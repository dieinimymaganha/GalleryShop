package GalleryShop.controller.dto;

import GalleryShop.model.Product;

import java.util.List;
import java.util.stream.Collectors;

public class ProductDto {

    private Long id;
    private String description;
    private Double value;

    public ProductDto(final Product product) {
        this.id = product.getId();
        this.description = product.getDescription();
        this.value = product.getValue();
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

    public static List<ProductDto> converter(final List<Product> products) {
        return products.stream().map(ProductDto::new).collect(Collectors.toList());
    }

}
