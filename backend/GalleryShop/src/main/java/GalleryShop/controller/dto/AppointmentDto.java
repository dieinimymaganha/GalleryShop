package GalleryShop.controller.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Appointment;
import GalleryShop.model.Client;

public class AppointmentDto {

    private Long id;

    private ScheduleDto scheduleDto;

    private Long clientId;

    public AppointmentDto(final Appointment appointment) {
        this.id = appointment.getId();
        this.clientId = appointment.getClient().getId();
        this.scheduleDto = scheduleDto.converterDto(appointment.getSchedule());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public static List<AppointmentDto> converter(final List<Appointment> appointments) {
        return appointments.stream().map(AppointmentDto::new).collect(Collectors.toList());
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public ScheduleDto getScheduleDto() {
        return scheduleDto;
    }

    public void setScheduleDto(ScheduleDto scheduleDto) {
        this.scheduleDto = scheduleDto;
    }

    

}