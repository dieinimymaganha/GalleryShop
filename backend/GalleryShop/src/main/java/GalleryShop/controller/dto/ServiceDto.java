package GalleryShop.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Service;

public class ServiceDto {

    private Long id;
    private String description;
    private Double value;
    private Boolean fixedPrice;

    public ServiceDto(Service service) {
        this.id = service.getId();
        this.description = service.getDescription();
        this.value = service.getValue();
        this.fixedPrice = service.getFixedPrice();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public static List<ServiceDto> converter(List<Service> services) {

        return services.stream().map(ServiceDto::new).collect(Collectors.toList());

    }

}