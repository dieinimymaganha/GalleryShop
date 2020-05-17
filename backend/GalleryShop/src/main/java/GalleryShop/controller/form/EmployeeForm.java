package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import GalleryShop.config.anotation.Cpf;
import GalleryShop.config.anotation.PhoneNumber;
import GalleryShop.model.Employee;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.TypeEmployeeRepository;

public class EmployeeForm {

    @NotNull
    @NotBlank
    private String name;
    @NotNull
    @NotBlank
    private String lastName;
    @NotNull
    @NotBlank
    private String nickname;
    @NotNull
    @NotBlank
    @Cpf
    private String cpf;
    @NotNull(message = "não pode ser nulo")
    private Date birthDate;
    @NotNull
    @NotEmpty
    @PhoneNumber
    private String phoneNumber;
    @NotNull
    @NotBlank
    private String rg;
    @NotNull
    private Double commissionRate;
    private List<TypeEmployee> listTypeEmployees = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Double getCommissionRate() {
        return commissionRate;
    }

    public void setCommissionRate(Double commissionRate) {
        this.commissionRate = commissionRate;
    }

    public List<TypeEmployee> getListTypeEmployees() {
        return listTypeEmployees;
    }

    public void setListTypeEmployees(List<TypeEmployee> listTypeEmployees) {
        this.listTypeEmployees = listTypeEmployees;
    }

    public Employee converter(TypeEmployeeRepository typeEmployeeRepository) {

        List<TypeEmployee> newListTypeEmployees = new ArrayList<>();

        for (TypeEmployee typeEmployee : listTypeEmployees) {
            TypeEmployee newTypeEmployee = typeEmployeeRepository
                    .findByDescription(typeEmployee.getDescription().toString());
            newListTypeEmployees.add(newTypeEmployee);
        }
        return new Employee(name, lastName, nickname, cpf, birthDate, phoneNumber, rg, commissionRate,
                newListTypeEmployees);
    }

    public Employee upload(Long id, EmployeeRepository employeeRepository,
            TypeEmployeeRepository typeEmployeeRepository) {
        Employee employee = employeeRepository.getOne(id);

        List<TypeEmployee> newListTypeEmployees = new ArrayList<>();
        for (TypeEmployee typeEmployee : listTypeEmployees) {
            TypeEmployee newTypeEmployee = typeEmployeeRepository
                    .findByDescription(typeEmployee.getDescription().toString());
            newListTypeEmployees.add(newTypeEmployee);
        }

        employee.setName(this.name);
        employee.setLastName(this.lastName);
        employee.setNickname(this.nickname);
        employee.setCpf(this.cpf);
        employee.setBirthDate(this.birthDate);
        employee.setPhoneNumber(this.phoneNumber);
        employee.setRg(this.rg);
        employee.setCommissionRate(this.commissionRate);
        employee.setTypeEmployees(newListTypeEmployees);

        return employee;

    }

}