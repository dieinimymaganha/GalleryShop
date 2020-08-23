package GalleryShop.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Appointment;

public class AppointmentDto {

    private Long id;

    private ScheduleDto scheduleDto;

    private ClientDto client;

    public AppointmentDto(final Appointment appointment) {
        this.id = appointment.getId();
        this.client = ClientDto.convertDto(appointment.getClient());
        this.scheduleDto = ScheduleDto.converterDto(appointment.getSchedule());
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

    public ScheduleDto getScheduleDto() {
        return scheduleDto;
    }

    public void setScheduleDto(ScheduleDto scheduleDto) {
        this.scheduleDto = scheduleDto;
    }

    public ClientDto getClient() {
        return client;
    }

    public void setClient(ClientDto client) {
        this.client = client;
    }

}