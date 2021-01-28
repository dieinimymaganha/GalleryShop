package GalleryShop.controller.dto;

import GalleryShop.model.AccountEmployee;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class AccountEmployeeDto {
    private Long id;
    private Double amount;
    private Double amountPaid;
    private Double balance;
    private EmployeeDtoBasic employeeDtoBasic;
    private List<SaleDto> saleDto;


    public AccountEmployeeDto(final AccountEmployee accountEmployee) {
        this.id = accountEmployee.getId();
        this.amount = accountEmployee.getAmount();
        this.amountPaid = accountEmployee.getAmountPaid();
        this.balance = accountEmployee.getBalance();
        this.employeeDtoBasic = new EmployeeDtoBasic(accountEmployee.getEmployee());
        this.saleDto = new ArrayList<>();
        this.saleDto.addAll(accountEmployee.getSales().stream().map(SaleDto::new).collect(Collectors.toList()));
    }

    public List<SaleDto> getSaleDto() {
        return saleDto;
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

    public Double getAmountPaid() {
        return amountPaid;
    }

    public static List<AccountEmployeeDto> convertDto(final List<AccountEmployee> accountEmployees) {
        return accountEmployees.stream().map(AccountEmployeeDto::new).collect(Collectors.toList());
    }
}
