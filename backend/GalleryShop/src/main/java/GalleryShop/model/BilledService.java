package GalleryShop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BilledService {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String description;
    private String typeEmployee;
    private Double value;
    private Double discount;
    private Double valueFinal;
    private Double commissionAmountEmployee;
    private Double commissionAmountCompany;

    public BilledService(String description, String typeEmployee, Double value, Double discount, Double valueFinal, Double commissionAmountEmployee, Double commissionAmountCompany) {
        this.description = description;
        this.typeEmployee = typeEmployee;
        this.value = value;
        this.discount = discount;
        this.valueFinal = valueFinal;
        this.commissionAmountEmployee = commissionAmountEmployee;
        this.commissionAmountCompany = commissionAmountCompany;
    }

    public Double getCommissionAmountEmployee() {
        return commissionAmountEmployee;
    }

    public void setCommissionAmountEmployee(Double commissionAmountEmployee) {
        this.commissionAmountEmployee = commissionAmountEmployee;
    }

    public Double getCommissionAmountCompany() {
        return commissionAmountCompany;
    }

    public void setCommissionAmountCompany(Double commissionAmountCompany) {
        this.commissionAmountCompany = commissionAmountCompany;
    }

    public String getTypeEmployee() {
        return typeEmployee;
    }

    public void setTypeEmployee(String typeEmployee) {
        this.typeEmployee = typeEmployee;
    }

    public Double getValueFinal() {
        return valueFinal;
    }

    public void setValueFinal(Double valueFinal) {
        this.valueFinal = valueFinal;
    }

    public BilledService() {
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

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }
}
