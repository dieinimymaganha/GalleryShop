package GalleryShop.controller.dto;

import GalleryShop.model.Product;
import GalleryShop.model.ProductSold;

public class ProductSoldDto {
    private Long id;
    private String description;

    private Double value;

    private Integer quantity;

    private Double valueTotal;


    public ProductSoldDto(final ProductSold productSold) {
        this.id = productSold.getId();
        this.description = productSold.getDescription();
        this.value = productSold.getValue();
        this.quantity = productSold.getQuantity();
        this.valueTotal = productSold.getValueTotal();
    }

    public Long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public Double getValue() {
        return value;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Double getValueTotal() {
        return valueTotal;
    }
}
