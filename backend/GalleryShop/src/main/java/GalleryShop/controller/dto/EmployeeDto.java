package GalleryShop.controller.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import GalleryShop.model.Employee;

public class EmployeeDto {

    private Long id;
    private String name;
    private String lastName;
    private String nickname;
    private String cpf;
    private Date birthdate;
    private String phoneNumber;
    private String rg;
    private Double commissionRate;
    private String password;
    private List<TypeEmployeeDto> typeEmployees;

    public EmployeeDto(Employee employee) {
        this.id = employee.getId();
        this.name = employee.getName();
        this.lastName = employee.getLastName();
        this.nickname = employee.getNickname();
        this.cpf = employee.getCpf();
        this.birthdate = employee.getBirthDate();
        this.phoneNumber = employee.getPhoneNumber();
        this.rg = employee.getRg();
        this.commissionRate = employee.getCommissionRate();
        this.password = employee.getUserLogin().getPassword();
        this.typeEmployees = new ArrayList<>();
        this.typeEmployees
                .addAll(employee.getTypeEmployees().stream().map(TypeEmployeeDto::new).collect(Collectors.toList()));

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
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

    public List<TypeEmployeeDto> getTypeEmployees() {
        return typeEmployees;
    }

    public void setTypeEmployees(List<TypeEmployeeDto> typeEmployees) {
        this.typeEmployees = typeEmployees;
    }

    public static List<EmployeeDto> converter(List<Employee> employees) {
        return employees.stream().map(EmployeeDto::new).collect(Collectors.toList());
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}