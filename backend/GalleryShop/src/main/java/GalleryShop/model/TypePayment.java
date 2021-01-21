package GalleryShop.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class TypePayment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String description;

    private Boolean card;

    private String flag;

    private Double tax;

    @OneToOne
    @JoinColumn(name = "payment_id", referencedColumnName = "id")
    private Payment payment;

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

    public Boolean getCard() {
        return card;
    }

    public void setCard(Boolean card) {
        this.card = card;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }


    public TypePayment(String description, Boolean card, String flag, Double tax) {
        this.description = description;
        this.card = card;
        this.flag = flag;
        this.tax = tax;
    }

    public TypePayment() {
    }

}

