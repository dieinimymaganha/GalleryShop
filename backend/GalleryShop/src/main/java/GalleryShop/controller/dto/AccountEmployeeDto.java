package GalleryShop.controller.dto;

import GalleryShop.model.AccountEmployee;

import java.util.List;
import java.util.stream.Collectors;

public class AccountEmployeeDto {
    private Long id;
    private Double amount;
    private Double amountPaid;
    private Double balance;
    private EmployeeDtoBasic employeeDtoBasic;

    public Double getAmountPaid() {
        return amountPaid;
    }

    public AccountEmployeeDto(final AccountEmployee accountEmployee) {
        this.id = accountEmployee.getId();
        this.amount = accountEmployee.getAmount();
        this.amountPaid = accountEmployee.getAmountPaid();
        this.balance = accountEmployee.getBalance();
        this.employeeDtoBasic = new EmployeeDtoBasic(accountEmployee.getEmployee());
    }

    public Long getId() {
        return id;
    }

    public Double getAmount() {
        return amount;
    }

    public Double getBalance() {
        return balance;
    }

    public EmployeeDtoBasic getEmployeeDtoBasic() {
        return employeeDtoBasic;
    }

    public static List<AccountEmployeeDto> convertDto(final List<AccountEmployee> accountEmployees) {
        return accountEmployees.stream().map(AccountEmployeeDto::new).collect(Collectors.toList());
    }
}
