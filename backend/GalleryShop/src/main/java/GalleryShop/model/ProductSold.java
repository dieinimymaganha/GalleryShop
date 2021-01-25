package GalleryShop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ProductSold {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String description;

    private Double value;

    private Integer quantity;

    private Double valueTotal;

    public ProductSold(String description, Double value, Integer quantity, Double valueTotal) {
        this.description = description;
        this.value = value;
        this.quantity = quantity;
        this.valueTotal = valueTotal;
    }



    public Double getValueTotal() {
        return valueTotal;
    }

    public void setValueTotal(Double valueTotal) {
        this.valueTotal = valueTotal;
    }

    public ProductSold() {
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

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductSold{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", value=" + value +
                ", quantity=" + quantity +
                ", valueTotal=" + valueTotal +
                '}';
    }
}
