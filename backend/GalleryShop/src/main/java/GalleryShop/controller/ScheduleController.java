package GalleryShop.controller;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import GalleryShop.controller.dto.ScheduleDtoAppointment;
import GalleryShop.controller.form.ScheduleAppointmentForm;
import GalleryShop.model.Client;
import GalleryShop.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
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

    @GetMapping("current/employeeId={idEmployee}&typeEmployeeId={idTypeEmployee}")
    public List<ScheduleDto> getByIdEmployeeCurrent(@PathVariable Long idEmployee, @PathVariable Long idTypeEmployee) {

//        List<Schedule> schedules = scheduleRepository.findByEmployeeIdAndTypeEmployeeId(idEmployee, idTypeEmployee,
//                Sort.by("day").ascending().and(Sort.by("startAttendance").ascending()));


        List<Schedule> schedules = scheduleRepository.findByEmployeeTypeEmployeeScheduleCurrent(idEmployee, idTypeEmployee);

        return ScheduleDto.converter(schedules);

    }


    @GetMapping("employeeId={idEmployee}&typeEmployeeId={idTypeEmployee}")
    public List<ScheduleDto> getByIdEmployee(@PathVariable Long idEmployee, @PathVariable Long idTypeEmployee) {

        List<Schedule> schedules = scheduleRepository.findByEmployeeIdAndTypeEmployeeId(idEmployee, idTypeEmployee,
                Sort.by("day").ascending().and(Sort.by("startAttendance").ascending()));
        return ScheduleDto.converter(schedules);
    }

        @GetMapping("/clientId={id}")
    public List<ScheduleDto> getByClientId(@PathVariable Long id) {
        List<Schedule> schedules = scheduleRepository.findByClientId(id, Sort.by("day").ascending().
                and(Sort.by("startAttendance").ascending()));

        return ScheduleDto.converter(schedules);
    }

    @GetMapping("/employeeId={id}&available={available}")
    public List<ScheduleDtoAppointment> getByEmployeeIdAndAvailable(@PathVariable Long id, @PathVariable Boolean available) {
        List<Schedule> schedules = scheduleRepository.findByEmployeeIdAndAvailable(id, available);

        return ScheduleDtoAppointment.converterDto(schedules);
    }


    @PostMapping
    @Transactional
    public ResponseEntity<ScheduleDto> createNewSchedule(@RequestBody @Valid ScheduleForm form,
                                                         UriComponentsBuilder uriBuilder) {
        List<Schedule> listSchedule = form.convert(employeeRepository, openingHoursRepository, typeEmployeeRepository);

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
    public ResponseEntity<?> scheduleAppointment(@PathVariable Long id, @RequestBody @Valid ScheduleAppointmentForm form) {

        Schedule schedule = scheduleRepository.getOne(id);

        Optional<Client> client = clientRepository.findById(form.getClientId());

        if (schedule.getAvailable() == true) {
            return ResponseEntity.status(HttpStatus.LOCKED).build();

        } else if (schedule != null && client.isPresent()) {

            Client client1 = client.get();


            List<Schedule> listSchedule = scheduleRepository.findByClientIdAndDay(client1.getId(), schedule.getDay());


            for (Schedule scheduleOne : listSchedule
            ) {
                if (scheduleOne.getStartAttendance() == schedule.getStartAttendance()) {
                    return ResponseEntity.status(HttpStatus.CONFLICT).build();
                } else if ((schedule.getStartAttendance().isBefore(scheduleOne.getStartAttendance())
                        && schedule.getEndAttendance().isBefore(scheduleOne.getEndAttendance()))
                        && !(schedule.getEndAttendance().isBefore(scheduleOne.getStartAttendance())
                        && scheduleOne.getEndAttendance().isAfter(schedule.getStartAttendance()))) {
                    return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).build();
                }
            }

        }
        Schedule scheduleUpdate = form.appointment(schedule, client.get());
        return ResponseEntity.ok().build();
    }


    @PatchMapping("cancel/{id}")
    @Transactional
    public ResponseEntity<?> scheduleCancelAppointment(@PathVariable Long id) {
        Schedule schedule = scheduleRepository.getOne(id);

        if (schedule != null) {
            schedule.setClient(null);
            schedule.setAvailable(false);
//            scheduleRepository.save(schedule);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();

    }

}