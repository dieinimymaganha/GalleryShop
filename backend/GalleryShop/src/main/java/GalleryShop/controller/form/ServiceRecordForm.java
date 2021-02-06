package GalleryShop.controller.form;

import GalleryShop.model.*;
import GalleryShop.repository.*;

import java.time.LocalTime;
import java.util.Date;
import java.util.Optional;

public class ServiceRecordForm {

    private Double discount;

    private Long serviceId;

    private Long employeeId;

    private Long accountClientId;

    private Long accountEmployeeId;

    private double value;

    private Long idSchedule;

    public Long getIdSchedule() {
        return idSchedule;
    }

    public void setIdSchedule(Long idSchedule) {
        this.idSchedule = idSchedule;
    }

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

    public Long getAccountClientId() {
        return accountClientId;
    }

    public void setAccountClientId(Long accountClientId) {
        this.accountClientId = accountClientId;
    }

    public Long getAccountEmployeeId() {
        return accountEmployeeId;
    }

    public void setAccountEmployeeId(Long accountEmployeeId) {
        this.accountEmployeeId = accountEmployeeId;
    }

    public ServiceRecord converter(ServiceRepository serviceRepository,
                                   EmployeeRepository employeeRepository,
                                   AccountClientRepository accountClientRepository,
                                   AccountEmployeeRepository accountEmployeeRepository,
                                   BilledServiceRepository billedServiceRepository,
                                   ScheduleRepository scheduleRepository) {

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


            if ((accountClientId == null && accountEmployeeId == null) ||
                    (accountClientId != null && accountEmployeeId != null)) {
                return null;
            } else if (accountClientId != null && accountEmployeeId == null) {
                Optional<AccountClient> accountClientOptional = accountClientRepository.findById(accountClientId);

                if (accountClientOptional.isPresent()) {
                    AccountClient accountClient = accountClientOptional.get();
                    accountClient = accountClientOptional.get();
                    Double updateAmount = (accountClient.getAmount() + billedService.getValue()) -
                            billedService.getDiscount();
                    accountClient.setAmount(updateAmount);
                    if (idSchedule != null) {
                        Schedule schedule = scheduleRepository.getOne(idSchedule);
                        schedule.setConcluded(true);
                        schedule.setCompletionTime(LocalTime.now());
                    }

                    return new ServiceRecord(dateService, employee, billedService, accountClient);

                } else {
                    return null;
                }

            } else if (accountClientId == null && accountEmployeeId != null) {
                Optional<AccountEmployee> accountEmployeeOptional = accountEmployeeRepository.findById(accountEmployeeId);

                if (accountEmployeeOptional.isPresent()) {

                    AccountEmployee accountEmployee = accountEmployeeOptional.get();
                    Double updateAmount = (accountEmployee.getAmount() + billedService.getValue()) -
                            billedService.getDiscount();
                    accountEmployee.setAmount(updateAmount);

                    if (idSchedule != null) {
                        Schedule schedule = scheduleRepository.getOne(idSchedule);
                        schedule.setConcluded(true);
                        schedule.setCompletionTime(LocalTime.now());
                    }

                    return new ServiceRecord(dateService, employee, billedService, accountEmployee);

                } else {
                    return null;
                }


            }

        }
        return null;
    }
}
