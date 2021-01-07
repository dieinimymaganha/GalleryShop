package GalleryShop.controller.form;

import GalleryShop.model.*;
import GalleryShop.repository.AccountClientRepository;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ServiceRepository;

import java.util.Date;
import java.util.Optional;

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

    public ServiceRecord converter(ServiceRepository serviceRepository, EmployeeRepository employeeRepository, ClientRepository clientRepository, AccountClientRepository accountClientRepository) {

        Service service = serviceRepository.getOne(serviceId);

        Employee employee = employeeRepository.getOne(employeeId);

        Client client = clientRepository.getOne(clientId);

        Optional<AccountClient> accountClient = accountClientRepository.findByClientId(clientId);

        AccountClient accountClientReturn = new AccountClient();

        if (accountClient.isPresent()) {
            accountClientReturn = accountClient.get();
            Double updateAmount = (accountClientReturn.getAmount() + service.getValue()) - discount;
            accountClientReturn.setAmount(updateAmount);

        } else {
            AccountClient createAccount = new AccountClient(client, 0.0, 0.0, 0.0);
            accountClientRepository.save(createAccount);
            Optional<AccountClient> accountClientNew = accountClientRepository.findByClientId(clientId);
            if (accountClientNew.isPresent()) {
                accountClientReturn = accountClientNew.get();
            }
        }

        Date dateService = new Date();

        return new ServiceRecord(discount, dateService, client, employee, service, accountClientReturn);

    }


}
