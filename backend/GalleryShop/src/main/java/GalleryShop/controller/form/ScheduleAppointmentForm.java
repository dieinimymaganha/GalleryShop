package GalleryShop.controller.form;

import GalleryShop.model.Client;
import GalleryShop.model.Schedule;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ScheduleRepository;

import java.util.Optional;

public class ScheduleAppointmentForm {

    private Long sheduleId;

    private Long clientId;

    private Boolean avaliable;

    public ScheduleAppointmentForm(Long sheduleId, Long clientId, Boolean avaliable) {
        this.sheduleId = sheduleId;
        this.clientId = clientId;
        this.avaliable = avaliable;
    }

    public Long getSheduleId() {
        return sheduleId;
    }

    public Long getClientId() {
        return clientId;
    }

    public Boolean getAvaliable() {
        return avaliable;
    }

    public Schedule appointment(Schedule schedule, Client client) {

        schedule.setAvailable(avaliable);
        schedule.setClient(client);

        return schedule;
    }


}
