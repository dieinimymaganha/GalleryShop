package GalleryShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import GalleryShop.controller.dto.AppointmentDto;
import GalleryShop.model.Appointment;
import GalleryShop.repository.AppointmentRepository;

@RestController
@RequestMapping("/appointments")
public class AppointmentController {

    @Autowired
    AppointmentRepository appointmentRepository;

    @GetMapping
    public List<AppointmentDto> getAll() {

        List<Appointment> appointments = appointmentRepository.findAll();
        return AppointmentDto.converter(appointments);
    }

}