package GalleryShop.controller.dto;

import GalleryShop.model.BilledService;

public class BilledServiceDto {
    private Long id;
    private String description;
    private String typeEmployee;
    private Double value;
    private Double discount;
    private Double valueFinal;


    public BilledServiceDto(final BilledService billedService) {
        this.id = billedService.getId();
        this.value = billedService.getValue();
        this.discount = billedService.getDiscount();
        this.description = billedService.getDescription();
        this.valueFinal = billedService.getValueFinal();
        this.typeEmployee = billedService.getTypeEmployee();
    }

    public String getTypeEmployee() {
        return typeEmployee;
    }

    public Double getValueFinal() {
        return valueFinal;
    }

    public Double getDiscount() {
        return discount;
    }

    public String getDescription() {
        return description;
    }

    public Long getId() {
        return id;
    }

    public Double getValue() {
        return value;
    }
}
