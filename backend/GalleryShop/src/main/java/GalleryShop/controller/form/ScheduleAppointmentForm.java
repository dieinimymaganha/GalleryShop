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


    public Schedule appointment(Long id, ScheduleRepository scheduleRepository, ClientRepository clientRepository) {
        Schedule schedule = scheduleRepository.getOne(id);

        Optional<Client> client = clientRepository.findById(clientId);


        if (schedule != null && client.isPresent()) {
            Client client_recover = client.get();
            schedule.setAvailable(avaliable);
            schedule.setClient(client_recover);

            return schedule;
        }

        return null;
    }


}
