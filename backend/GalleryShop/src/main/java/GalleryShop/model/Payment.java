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

    @ManyToOne()
    private AccountEmployee accountEmployee;

    private Double value;

    public Payment(Date datePayment, TypePayment typePayment, AccountClient accountClient, Double value) {
        this.datePayment = datePayment;
        this.typePayment = typePayment;
        this.accountClient = accountClient;
        this.value = value;
    }

    public Payment(Date datePayment, TypePayment typePayment, AccountEmployee accountEmployee, Double value) {
        this.datePayment = datePayment;
        this.typePayment = typePayment;
        this.accountEmployee = accountEmployee;
        this.value = value;
    }

    public AccountEmployee getAccountEmployee() {
        return accountEmployee;
    }

    public void setAccountEmployee(AccountEmployee accountEmployee) {
        this.accountEmployee = accountEmployee;
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

    @Override
    public String toString() {
        return "Payment{" +
                "id=" + id +
                ", datePayment=" + datePayment +
                ", typePayment=" + typePayment +
                ", accountClient=" + accountClient +
                ", value=" + value +
                '}';
    }
}
