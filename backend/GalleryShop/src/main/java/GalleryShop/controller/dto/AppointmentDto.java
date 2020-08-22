package GalleryShop.controller.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Appointment;

public class AppointmentDto {

    private Long id;

    private List<ScheduleDto> scheduleDto;

    private Long clientId;

    public AppointmentDto(final Appointment appointment) {
        this.id = appointment.getId();
        this.scheduleDto = new ArrayList<>();
        this.scheduleDto.addAll(appointment.getSchedule().stream().map(ScheduleDto::new).collect(Collectors.toList()));
        this.clientId = appointment.getClient().getId();
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

    public List<ScheduleDto> getScheduleDto() {
        return scheduleDto;
    }

    public void setScheduleDto(List<ScheduleDto> scheduleDto) {
        this.scheduleDto = scheduleDto;
    }

}