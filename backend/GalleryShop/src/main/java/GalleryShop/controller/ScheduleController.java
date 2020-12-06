package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import GalleryShop.controller.form.ScheduleAppointmentForm;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ScheduleDto;
import GalleryShop.controller.form.ScheduleForm;
import GalleryShop.model.Schedule;

@RestController
@RequestMapping("/schedules")
public class ScheduleController {

    @Autowired
    ScheduleRepository scheduleRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    OpeningHoursRepository openingHoursRepository;

    @Autowired
    TypeEmployeeRepository typeEmployeeRepository;

    @Autowired
    ClientRepository clientRepository;

    @GetMapping
    public List<ScheduleDto> getAll() {
        List<Schedule> schedules = scheduleRepository.findAll();
        return ScheduleDto.converter(schedules);
    }

    @GetMapping("/employeeId={idEmployee}&typeEmployeeId={idTypeEmployee}")
    public List<ScheduleDto> getByIdEmployee(@PathVariable Long idEmployee, @PathVariable Long idTypeEmployee) {

        List<Schedule> schedules = scheduleRepository.findByEmployeeIdAndTypeEmployeeId(idEmployee, idTypeEmployee);

        return ScheduleDto.converter(schedules);

    }

    @GetMapping("/clientId={id}")
    public List<ScheduleDto> getByClientId(@PathVariable Long id) {
        List<Schedule> schedules = scheduleRepository.findByClientId(id);

        return ScheduleDto.converter(schedules);
    }

    @GetMapping("/employeeId={id}&available={available}")
    public List<ScheduleDto> getByEmployeeIdAndAvailable(@PathVariable Long id, @PathVariable Boolean available) {
        List<Schedule> schedules = scheduleRepository.findByEmployeeIdAndAvailable(id, available);

        return ScheduleDto.converter(schedules);
    }


    @PostMapping
    @Transactional
    public ResponseEntity<ScheduleDto> createNewSchedule(@RequestBody @Valid ScheduleForm form,
                                                         UriComponentsBuilder uriBuilder) {
        List<Schedule> listSchedule = form.convert(employeeRepository, openingHoursRepository, typeEmployeeRepository);
//        System.out.println(listSchedule);

        if (!listSchedule.isEmpty()) {
            for (Schedule schedule : listSchedule) {
                scheduleRepository.save(schedule);
            }

            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();

    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> delete(@PathVariable Long id) {
        Optional<Schedule> optional = scheduleRepository.findById(id);

        if (optional.isPresent()) {
            scheduleRepository.deleteById(id);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();
    }

    @PatchMapping("{id}")
    @Transactional
    public ResponseEntity<?> scheduleAppointment(@PathVariable Long id, @RequestBody @Valid ScheduleAppointmentForm form, UriComponentsBuilder uriBuilder) {
        Schedule schedule = form.appointment(id, scheduleRepository, clientRepository);

        if (schedule != null) {
            scheduleRepository.save(schedule);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();

    }


}