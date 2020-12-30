package GalleryShop.controller.dto;

import GalleryShop.model.Schedule;

import java.util.List;
import java.util.stream.Collectors;

public class ScheduleDtoAppointment extends ScheduleDto {

    private Long clientId;
    private String clientName;
    private ClientDto clientDto;

    public ScheduleDtoAppointment(final Schedule schedule) {
        super(schedule);
        this.clientId = schedule.getClient().getId();
        this.clientName = schedule.getClient().getName();
        this.clientDto = new ClientDto(schedule.getClient());
    }

    public ClientDto getClientDto() {
        return clientDto;
    }

    public String getClientName() {
        return clientName;
    }

    public Long getClientId() {
        return clientId;
    }

    public static List<ScheduleDtoAppointment> converterDto(final List<Schedule> schedules) {
        return schedules.stream().map(ScheduleDtoAppointment::new).collect(Collectors.toList());
    }

}
