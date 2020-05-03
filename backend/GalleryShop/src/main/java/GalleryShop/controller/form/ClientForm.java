package GalleryShop.controller.form;

import java.util.Date;

import GalleryShop.config.anotation.Cpf;
import GalleryShop.config.anotation.EmailRegex;
import GalleryShop.model.Client;
import org.hibernate.validator.constraints.br.CPF;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class ClientForm {

	@NotNull @NotEmpty
	private String name;

	@NotNull @NotEmpty
	private String lastName;

	private String nickname;

	@Cpf
	private String cpf;

	@NotNull(message = "não pode ser nulo")
	private Date birthdate;

	@NotNull @NotEmpty
	private String phoneNumber;

	@NotNull @NotEmpty @EmailRegex
	private String email;

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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	


	public Client converter() {
		return new Client(name, lastName, nickname, cpf, birthdate, phoneNumber, email);
	}
	
	
}
