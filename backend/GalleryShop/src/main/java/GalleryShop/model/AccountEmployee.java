package GalleryShop.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class AccountEmployee {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Double amount;

    private Double amountPaid;

    private Double balance;

    @OneToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "id")
    private Employee employee;

    @OneToMany(mappedBy = "accountEmployee")
    private List<Payment> payments = new ArrayList<>();

    @OneToMany(mappedBy = "accountEmployee")
    private List<Sale> sales = new ArrayList<>();

    @OneToMany(mappedBy = "accountEmployee")
    private List<ServiceRecord> serviceRecords = new ArrayList<>();


    public AccountEmployee(Double amount, Double amountPaid, Double balance, Employee employee, List<Payment> payments, List<Sale> sales) {
        this.amount = amount;
        this.amountPaid = amountPaid;
        this.balance = balance;
        this.employee = employee;
        this.payments = payments;
        this.sales = sales;
    }


    public AccountEmployee() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }

    public List<Sale> getSales() {
        return sales;
    }

    public void setSales(List<Sale> sales) {
        this.sales = sales;
    }
}
