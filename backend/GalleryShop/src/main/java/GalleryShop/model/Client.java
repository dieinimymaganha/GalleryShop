package GalleryShop.model;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
public class Client extends Person{
	
	private String email;
	

	public Client() {
	
	}

	public Client(String name, String lastName, String nickname, String cpf, Date birthDate,
			String phoneNumber, String email) {
		super(name, lastName, nickname, cpf, birthDate, phoneNumber);
		this.email = email;
	}


	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Client client = (Client) o;
		return Objects.equals(email, client.email);
	}

	@Override
	public int hashCode() {
		return Objects.hash(email);
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
