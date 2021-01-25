package GalleryShop.controller.form;

import GalleryShop.model.Product;
import GalleryShop.repository.ProductRepository;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class ProductForm {

    @NotEmpty
    @NotNull
    private String description;

    @NotNull
    private Double value;

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


    public Product converter() {
        return new Product(description, value);
    }

    public Product upload(Long id, ProductRepository productRepository) {
        Product product = productRepository.getOne(id);

        product.setDescription(description);
        product.setValue(value);

        return product;
    }
}
