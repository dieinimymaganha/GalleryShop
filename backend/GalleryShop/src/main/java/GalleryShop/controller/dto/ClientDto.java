package GalleryShop.controller.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Client;

public class ClientDto {

	private Long id;
	private String name;
	private String lastName;
	private String nickname;
	private String cpf;
	@JsonFormat(pattern = "dd/MM/yyyy")
	private Date birthdate;
	private String phoneNumber;
	private String email;

	public ClientDto(Client client) {
		this.id = client.getId();
		this.name = client.getName();
		this.lastName = client.getLastName();
		this.nickname = client.getNickname();
		this.cpf = client.getCpf();
		this.birthdate = client.getBirthDate();
		this.phoneNumber = client.getPhoneNumber();
		this.email = client.getEmail();

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static List<ClientDto> converter(List<Client> clients) {

		return clients.stream().map(ClientDto::new).collect(Collectors.toList());
	}

	public static ClientDto convertDto(Client client) {
		return new ClientDto(client);
	}

}
