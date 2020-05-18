package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import GalleryShop.model.Client;
import GalleryShop.model.Employee;
import GalleryShop.model.Profile;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.ProfileRepository;

public class UserLoginForm {

    private String phoneNumber;
    private String password;
    private List<Profile> listProfiles = new ArrayList<>();

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Profile> getListProfiles() {
        return listProfiles;
    }

    public void setListProfiles(List<Profile> listProfiles) {
        this.listProfiles = listProfiles;
    }

    public UserLogin converter(ClientRepository clientRepository, EmployeeRepository employeeRepository,
            ProfileRepository profileRepository) {

        List<Profile> newListProfile = new ArrayList<>();

        for (Profile profile : listProfiles) {
            Profile newProfile = profileRepository.findByRole(profile.getRole().toString());
            newListProfile.add(newProfile);
        }

        Optional<Client> client = clientRepository.findByPhoneNumber(phoneNumber);

        if (client.isPresent()) {
            String passwordCrypt = new BCryptPasswordEncoder().encode(password);
            return new UserLogin(phoneNumber, passwordCrypt, client.get(), newListProfile);
        }

        Optional<Employee> employee = employeeRepository.findByPhoneNumber(phoneNumber);

        if (employee.isPresent()) {
            String passwordCrypt = new BCryptPasswordEncoder().encode(password);
            return new UserLogin(phoneNumber, passwordCrypt, employee.get(), newListProfile);

        }

        return null;

    }

}