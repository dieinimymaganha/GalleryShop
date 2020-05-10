package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import GalleryShop.model.Employee;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.TypeEmployeeRepository;

public class EmployeeForm {

    private String name;
    private String lastName;
    private String nickname;
    private String cpf;
    private Date birthDate;
    private String phoneNumber;
    private String rg;
    private Double commissionRate;
    private List<TypeEmployee> listTypeEmployees = new ArrayList<TypeEmployee>();

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

        System.out.println("Lista de funcionarios: " + listTypeEmployees);
        for (TypeEmployee typeEmployee : listTypeEmployees) {
            TypeEmployee newTypeEmployee = typeEmployeeRepository
                    .findByDescription(typeEmployee.getDescription().toString());
            System.out.println("Tipo recuperado: " + newTypeEmployee);
            newListTypeEmployees.add(newTypeEmployee);
        }
        System.out.println("Nova Lista: " + newListTypeEmployees);
        return new Employee(name, lastName, nickname, cpf, birthDate, phoneNumber, rg, commissionRate,
                newListTypeEmployees);
    }

}