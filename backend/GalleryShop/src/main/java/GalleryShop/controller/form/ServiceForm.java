package GalleryShop.controller.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import GalleryShop.model.Service;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.ServiceRepository;
import GalleryShop.repository.TypeEmployeeRepository;

public class ServiceForm {

    @NotNull
    @NotEmpty
    private String description;

    private Double value;

    @NotNull
    private Boolean fixedPrice;

    @NotNull
    @NotEmpty
    private String descriptonTypeEmployee;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Boolean getFixedPrice() {
        return fixedPrice;
    }

    public void setFixedPrice(Boolean fixedPrice) {
        this.fixedPrice = fixedPrice;
    }

    public String getDescriptonTypeEmployee() {
        return descriptonTypeEmployee;
    }

    public void setDescriptonTypeEmployee(String descriptonTypeEmployee) {
        this.descriptonTypeEmployee = descriptonTypeEmployee;
    }

    public Service converter(TypeEmployeeRepository typeEmployeeRepository) {
        TypeEmployee typeEmployee = typeEmployeeRepository.findByDescriptionIgnoreCase(descriptonTypeEmployee);
        return new Service(description, value, fixedPrice, typeEmployee);

    }

    public Service upload(Long id, ServiceRepository serviceRepository, TypeEmployeeRepository typeEmployeeRepository) {
        Service service = serviceRepository.getOne(id);

        TypeEmployee typeEmployee = typeEmployeeRepository.findByDescriptionIgnoreCase(this.descriptonTypeEmployee);

        service.setDescription(this.description);
        service.setFixedPrice(this.fixedPrice);
        service.setValue(this.value);
        service.setTypeEmployee(typeEmployee);

        return service;
    }

}