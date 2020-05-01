package GalleryShop.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Client extends Person{
	
	private String email;

	public Client(long id, String name, String lastName, String nickname, String cpf, Date birthdate,
			String phoneNumber, String email) {
		super(id, name, lastName, nickname, cpf, birthdate, phoneNumber);
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
