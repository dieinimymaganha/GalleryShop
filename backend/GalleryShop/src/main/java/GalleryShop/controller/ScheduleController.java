package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ScheduleDto;
import GalleryShop.controller.form.ScheduleForm;
import GalleryShop.model.Schedule;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;
import GalleryShop.repository.ScheduleRepository;
import GalleryShop.repository.TypeEmployeeRepository;

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

    @GetMapping
    public List<ScheduleDto> getAll() {
        List<Schedule> schedules = scheduleRepository.findAll();
        return ScheduleDto.converter(schedules);
    }

    @GetMapping("/employeeId={id}")
    public List<ScheduleDto> getByIdEmployee(@PathVariable Long id) {

        List<Schedule> schedules = scheduleRepository.findByEmployeeId(id);

        return ScheduleDto.converter(schedules);

    }

    @PostMapping
    @Transactional
    public ResponseEntity<ScheduleDto> createNewSchedule(@RequestBody @Valid ScheduleForm form,
            UriComponentsBuilder uriBuilder) {
        List<Schedule> listSchedule = form.convert(employeeRepository, openingHoursRepository, typeEmployeeRepository);

        for (Schedule schedule : listSchedule) {
            scheduleRepository.save(schedule);
        }

        return ResponseEntity.ok().build();
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

}