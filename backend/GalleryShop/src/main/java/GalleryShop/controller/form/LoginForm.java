package GalleryShop.controller.form;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;


public class LoginForm {

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

	public UsernamePasswordAuthenticationToken converter() {
		return new UsernamePasswordAuthenticationToken(phoneNumber,password);
	}

}
