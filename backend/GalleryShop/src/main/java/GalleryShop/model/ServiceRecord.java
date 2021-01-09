package GalleryShop.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ServiceRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private @Temporal(TemporalType.DATE)
    Date dateService;

    @OneToOne
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private Client client;

    @OneToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "id")
    private Employee employee;

    @OneToOne
    @JoinColumn(name = "billedService_id", referencedColumnName = "id")
    private BilledService billedService;

    @ManyToOne()
    @JoinColumn(name = "account_id")
    private AccountClient accountClient;


    public ServiceRecord(Date dateService, Client client, Employee employee, BilledService billedService, AccountClient accountClient) {
        this.dateService = dateService;
        this.client = client;
        this.employee = employee;
        this.billedService = billedService;
        this.accountClient = accountClient;
    }

    public AccountClient getAccountClient() {
        return accountClient;
    }

    public void setAccountClient(AccountClient accountClient) {
        this.accountClient = accountClient;
    }

    public ServiceRecord() {
    }

    public Date getDateService() {
        return dateService;
    }

    public void setDateService(Date dateService) {
        this.dateService = dateService;
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

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public BilledService getBilledService() {
        return billedService;
    }

    public void setBilledService(BilledService billedService) {
        this.billedService = billedService;
    }
}
