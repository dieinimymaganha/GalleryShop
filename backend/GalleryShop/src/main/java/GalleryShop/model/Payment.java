package GalleryShop.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private @Temporal(TemporalType.DATE)
    Date datePayment;

    @ManyToOne()
    @JoinColumn(name = "type_payment_id")
    private TypePayment typePayment;

    @ManyToOne()
    private AccountClient accountClient;

    private Double value;


    public Payment(Date datePayment, TypePayment typePayment, AccountClient accountClient, Double value) {
        this.datePayment = datePayment;
        this.typePayment = typePayment;
        this.accountClient = accountClient;
        this.value = value;
    }

    public Payment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDatePayment() {
        return datePayment;
    }

    public void setDatePayment(Date datePayment) {
        this.datePayment = datePayment;
    }

    public TypePayment getTypePayment() {
        return typePayment;
    }

    public void setTypePayment(TypePayment typePayment) {
        this.typePayment = typePayment;
    }

    public AccountClient getAccountClient() {
        return accountClient;
    }

    public void setAccountClient(AccountClient accountClient) {
        this.accountClient = accountClient;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }
}
