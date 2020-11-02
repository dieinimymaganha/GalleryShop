package GalleryShop.controller.dto;

import GalleryShop.model.UserLogin;

public class UserLoginDto {

    private  Long id;
    private String phoneNumber;
    private String password;


    public UserLoginDto(final UserLogin userLogin){
        this.id = userLogin.getId();
        this.phoneNumber = userLogin.getPhoneNumber();
        this.password = userLogin.getPassword();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
}
