package GalleryShop.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Service;
import GalleryShop.model.TypeEmployee;

public class ServiceDto {

    private Long id;
    private String description;
    private Double value;
    private Boolean fixedPrice;

    private String typeEmployee;

    public ServiceDto(final Service service) {
        this.id = service.getId();
        this.description = service.getDescription();
        this.value = service.getValue();
        this.fixedPrice = service.getFixedPrice();
        this.typeEmployee = service.getTypeEmployee().getDescription();
    }

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(final String description) {
        this.description = description;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(final Double value) {
        this.value = value;
    }

    public Boolean getFixedPrice() {
        return fixedPrice;
    }

    public void setFixedPrice(final Boolean fixedPrice) {
        this.fixedPrice = fixedPrice;
    }

    public String getTypeEmployee() {
        return typeEmployee;
    }

    public void setTypeEmployee(String typeEmployee) {
        this.typeEmployee = typeEmployee;
    }

    public static List<ServiceDto> converter(final List<Service> services) {

        return services.stream().map(ServiceDto::new).collect(Collectors.toList());

    }

}