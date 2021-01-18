package GalleryShop.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class AccountClient {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private Client client;

    @OneToMany(mappedBy = "accountClient")
    private List<ServiceRecord> serviceRecord = new ArrayList<>();

    private Double amount;

    private Double amountPaid;

    private Double balance;

    @OneToMany(mappedBy = "accountClient")
    private List<Payment> payments = new ArrayList<>();

    public AccountClient(Client client, List<ServiceRecord> serviceRecord, Double amount, Double amountPaid, Double balance, List<Payment> payments) {
        this.client = client;
        this.serviceRecord = serviceRecord;
        this.amount = amount;
        this.amountPaid = amountPaid;
        this.balance = balance;
        this.payments = payments;
    }

    public AccountClient(Client client, List<ServiceRecord> serviceRecord, Double amount, Double amountPaid, Double balance) {
        this.client = client;
        this.serviceRecord = serviceRecord;
        this.amount = amount;
        this.amountPaid = amountPaid;
        this.balance = balance;
    }

    public AccountClient(Client client, Double amount, Double amountPaid, Double balance) {
        this.client = client;
        this.amount = amount;
        this.amountPaid = amountPaid;
        this.balance = balance;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }

    public AccountClient() {
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public AccountClient(Client client, int i, int i1, int i2) {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public List<ServiceRecord> getServiceRecord() {
        return serviceRecord;
    }

    public void setServiceRecord(List<ServiceRecord> serviceRecord) {
        this.serviceRecord = serviceRecord;
    }
}
