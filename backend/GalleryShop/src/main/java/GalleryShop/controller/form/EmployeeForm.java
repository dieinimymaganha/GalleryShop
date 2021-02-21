package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import GalleryShop.config.anotation.Cpf;
import GalleryShop.config.anotation.PhoneNumber;
import GalleryShop.model.Employee;
import GalleryShop.model.Profile;
import GalleryShop.model.TypeEmployee;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ProfileRepository;
import GalleryShop.repository.TypeEmployeeRepository;
import GalleryShop.repository.UserLoginRepository;

public class EmployeeForm {

    @Autowired
    UserLoginRepository userLoginRepository;

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
    @JsonFormat(pattern="dd/MM/yyyy")
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
    @NotNull
    @NotEmpty
    private String password;
    @NotNull
    @NotEmpty
    private List<Profile> listProfiles = new ArrayList<>();

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Employee converter(TypeEmployeeRepository typeEmployeeRepository, ProfileRepository profileRepository) {

        List<Profile> newListProfile = new ArrayList<>();

        for (Profile profile : listProfiles) {
            Profile newProfile = profileRepository.findByRole(profile.getRole().toString());
            newListProfile.add(newProfile);
        }

        UserLogin userLogin = new UserLogin();
        userLogin.setPhoneNumber(phoneNumber);
        userLogin.setPassword(new BCryptPasswordEncoder().encode(password));
        userLogin.setProfiles(newListProfile);

        List<TypeEmployee> newListTypeEmployees = new ArrayList<>();

        for (TypeEmployee typeEmployee : listTypeEmployees) {
            TypeEmployee newTypeEmployee = typeEmployeeRepository
                    .findByDescriptionIgnoreCase(typeEmployee.getDescription().toString());
            newListTypeEmployees.add(newTypeEmployee);
        }
        return new Employee(name, lastName, nickname, cpf, birthDate, phoneNumber, userLogin, rg, commissionRate,
                newListTypeEmployees);
    }

    public Employee upload(Long id, EmployeeRepository employeeRepository,
            TypeEmployeeRepository typeEmployeeRepository) {
        Employee employee = employeeRepository.getOne(id);

        List<TypeEmployee> newListTypeEmployees = new ArrayList<>();
        for (TypeEmployee typeEmployee : listTypeEmployees) {
            TypeEmployee newTypeEmployee = typeEmployeeRepository
                    .findByDescriptionIgnoreCase(typeEmployee.getDescription().toString());
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

    public UserLoginRepository getUserLoginRepository() {
        return userLoginRepository;
    }

    public void setUserLoginRepository(UserLoginRepository userLoginRepository) {
        this.userLoginRepository = userLoginRepository;
    }

    public List<Profile> getListProfiles() {
        return listProfiles;
    }

    public void setListProfiles(List<Profile> listProfiles) {
        this.listProfiles = listProfiles;
    }

}