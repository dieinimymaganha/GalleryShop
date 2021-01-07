package GalleryShop.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ServiceRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Double discount;

    private @Temporal(TemporalType.DATE)
    Date dateService;

    @OneToOne
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private Client client;

    @OneToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "id")
    private Employee employee;

    @OneToOne
    @JoinColumn(name = "service_id", referencedColumnName = "id")
    private Service service;


    public ServiceRecord(Double discount, Date dateService, Client client, Employee employee, Service service) {
        this.discount = discount;
        this.dateService = dateService;
        this.client = client;
        this.employee = employee;
        this.service = service;
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

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
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

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

}
