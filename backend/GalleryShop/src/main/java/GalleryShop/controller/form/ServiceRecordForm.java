package GalleryShop.controller.form;

import GalleryShop.model.Client;
import GalleryShop.model.Employee;
import GalleryShop.model.Service;
import GalleryShop.model.ServiceRecord;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ServiceRepository;

import java.util.Date;

public class ServiceRecordForm {

    private Double discount;

    private Long serviceId;

    private Long employeeId;

    private Long clientId;

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Long getServiceId() {
        return serviceId;
    }

    public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public ServiceRecord converter(ServiceRepository serviceRepository, EmployeeRepository employeeRepository, ClientRepository clientRepository) {

        Service service = serviceRepository.getOne(serviceId);

        Employee employee = employeeRepository.getOne(employeeId);

        Client client = clientRepository.getOne(clientId);

        Date dateService = new Date();

        return new ServiceRecord(discount, dateService, client, employee, service);

    }


}
