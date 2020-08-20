package GalleryShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import GalleryShop.controller.dto.ScheduleDto;
import GalleryShop.model.Schedule;
import GalleryShop.repository.ScheduleRepository;

@RestController
@RequestMapping("/schedules")
public class ScheduleController {

    @Autowired
    ScheduleRepository scheduleRepository;

    @GetMapping
    public List<ScheduleDto> getAll() {
        List<Schedule> schedules = scheduleRepository.findAll();
        return ScheduleDto.converter(schedules);
    }

}