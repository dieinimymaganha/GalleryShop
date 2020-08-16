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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.ScheduleDto;
import GalleryShop.controller.form.ScheduleForm;
import GalleryShop.model.Schedule;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ScheduleRepository;

@RestController
@RequestMapping("/schedules")
public class ScheduleController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    ScheduleRepository scheduleRepository;

    @GetMapping
    public List<ScheduleDto> getAll() {
        List<Schedule> schedules = scheduleRepository.findAll();
        return ScheduleDto.converter(schedules);

    }

    @PostMapping
    @Transactional
    public ResponseEntity<ScheduleDto> createNewSchedule(@RequestBody @Valid ScheduleForm form,
            UriComponentsBuilder uriBuilder) {
        Schedule schedule = form.converter(employeeRepository);

        scheduleRepository.save(schedule);

        URI uri = uriBuilder.path("/schedules/{id}").buildAndExpand(schedule.getId()).toUri();

        return ResponseEntity.created(uri).body(new ScheduleDto(schedule));

    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteSchedule(@PathVariable Long id) {
        Optional<Schedule> optional = scheduleRepository.findById(id);

        if (optional.isPresent()) {
            scheduleRepository.deleteById(id);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();
    }

}