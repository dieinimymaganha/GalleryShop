package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import GalleryShop.model.Employee;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.TypeEmployeeRepository;

public class EmployeeForm {

    private String name;
    private String lastName;
    private String nickname;
    private String cpf;
    private Date birthdate;
    private String phoneNumber;
    private String rg;
    private Double commissionRate;
    private String descriptonTypeEmployee;

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(final String nickname) {
        this.nickname = nickname;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(final String cpf) {
        this.cpf = cpf;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(final Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(final String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(final String rg) {
        this.rg = rg;
    }

    public Double getCommissionRate() {
        return commissionRate;
    }

    public void setCommissionRate(final Double commissionRate) {
        this.commissionRate = commissionRate;
    }

    public String getDescriptonTypeEmployee() {
        return descriptonTypeEmployee;
    }

    public void setDescriptonTypeEmployee(final String descriptonTypeEmployee) {
        this.descriptonTypeEmployee = descriptonTypeEmployee;
    }

    public Employee converter(final TypeEmployeeRepository typeEmployeeRepository){     
        List<TypeEmployee> typeEmployee = typeEmployeeRepository.findByTypeEmployeeDescription(descriptonTypeEmployee);
        return new Employee(name, lastName, nickname, cpf, birthdate, phoneNumber, cpf, commissionRate, typeEmployee);
    }

}