package GalleryShop.controller.dto;

import GalleryShop.model.Employee;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.stream.Collectors;

public class EmployeeDtoBasic {

    private Long id;
    private String name;
    private String lastName;
    private String nickname;
    private String cpf;
    @JsonFormat(pattern="dd/MM/yyyy")
    private Date birthdate;
    private String phoneNumber;
    private String rg;
    private Double commissionRate;

    public EmployeeDtoBasic(Employee employee) {
        this.id = employee.getId();
        this.name = employee.getName();
        this.lastName = employee.getLastName();
        this.nickname = employee.getNickname();
        this.cpf = employee.getCpf();
        this.birthdate = employee.getBirthDate();
        this.phoneNumber = employee.getPhoneNumber();
        this.rg = employee.getRg();
        this.commissionRate = employee.getCommissionRate();
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getLastName() {
        return lastName;
    }

    public String getNickname() {
        return nickname;
    }

    public String getCpf() {
        return cpf;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getRg() {
        return rg;
    }

    public Double getCommissionRate() {
        return commissionRate;
    }
}
