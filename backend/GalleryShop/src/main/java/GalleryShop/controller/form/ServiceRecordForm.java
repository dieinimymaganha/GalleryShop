package GalleryShop.controller.form;

import GalleryShop.model.*;
import GalleryShop.repository.*;

import java.util.Date;
import java.util.Optional;

import static java.lang.Math.abs;

public class ServiceRecordForm {

    private Double discount;

    private Long serviceId;

    private Long employeeId;

    private Long clientId;

    private double value;

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

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

    public ServiceRecord converter(ServiceRepository serviceRepository, EmployeeRepository employeeRepository,
                                   ClientRepository clientRepository, AccountClientRepository accountClientRepository,
                                   BilledServiceRepository billedServiceRepository,
                                   TypePaymentRepository typePaymentRepository, PaymentRepository paymentRepository) {

        Service service = serviceRepository.getOne(serviceId);

        BilledService billedService = new BilledService();

        Employee employee = employeeRepository.getOne(employeeId);

        Date dateService = new Date();


        if (service != null) {
            billedService.setDescription(service.getDescription());
            if (service.getFixedPrice().equals(false)) {
                billedService.setValue(value);
            } else {
                billedService.setValue(service.getValue());
            }
            billedService.setDiscount(discount);
            double valueFinal = billedService.getValue() - billedService.getDiscount();
            billedService.setValueFinal(valueFinal);
            billedService.setTypeEmployee(service.getTypeEmployee().getDescription());
            double commissionAmountEmployee = (valueFinal / 100) * employee.getCommissionRate();
            double commissionAmountCompany = valueFinal - commissionAmountEmployee;
            billedService.setCommissionAmountEmployee(commissionAmountEmployee);
            billedService.setCommissionAmountCompany(commissionAmountCompany);
            billedServiceRepository.save(billedService);
        }


        Client client = clientRepository.getOne(clientId);

        Optional<AccountClient> accountClient = accountClientRepository.findByClientId(clientId);

        AccountClient accountClientReturn = new AccountClient();

        if (accountClient.isPresent()) {
            accountClientReturn = accountClient.get();
            Double updateAmount = (accountClientReturn.getAmount() + billedService.getValue()) -
                    billedService.getDiscount();
            accountClientReturn.setAmount(updateAmount);

        } else {
            AccountClient createAccount = new AccountClient(client, billedService.getValueFinal(), 0.0, 0.0);
            accountClientRepository.save(createAccount);
            Optional<AccountClient> accountClientNew = accountClientRepository.findByClientId(clientId);
            if (accountClientNew.isPresent()) {
                accountClientReturn = accountClientNew.get();
            }
        }


        return new ServiceRecord(dateService, client, employee, billedService, accountClientReturn);

    }


}
