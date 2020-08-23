package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.List;
import GalleryShop.model.OpeningHours;
import GalleryShop.repository.EmployeeRepository;

public class OpeningHoursFormList {

    private List<OpeningHoursForm> openingHoursForm = new ArrayList<>();

    public List<OpeningHours> convertList(List<OpeningHoursForm> openingHoursForm,
            EmployeeRepository employeeRepository) {
        List<OpeningHours> listOpen = new ArrayList<>();

        for (OpeningHoursForm openingHours : openingHoursForm) {
            OpeningHours create = openingHours.converter(employeeRepository);

            listOpen.add(create);

        }

        return listOpen;

    }

    public List<OpeningHoursForm> getOpeningHoursForm() {
        return openingHoursForm;
    }

    public void setOpeningHoursForm(List<OpeningHoursForm> openingHoursForm) {
        this.openingHoursForm = openingHoursForm;
    }

    public OpeningHoursFormList(List<OpeningHoursForm> openingHoursForm) {
        this.openingHoursForm = openingHoursForm;
    }

    public OpeningHoursFormList() {
    }

}