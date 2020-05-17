package GalleryShop.controller.form;

import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import GalleryShop.model.Client;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.ClientRepository;

public class UserLoginForm {

    private String phoneNumber;
    private String password;

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

    public UserLogin coverter(ClientRepository clientRepository) {
        Optional<Client> client = clientRepository.findByPhoneNumber(phoneNumber);
        if (client.isPresent()) {
            String passwordCrypt = new BCryptPasswordEncoder().encode(password);
            return new UserLogin(phoneNumber, passwordCrypt, client.get());
        }

        return null;

    }

}