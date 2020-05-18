package GalleryShop.controller.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import GalleryShop.config.anotation.Cpf;
import GalleryShop.config.anotation.EmailRegex;
import GalleryShop.config.anotation.PhoneNumber;
import GalleryShop.model.Client;
import GalleryShop.model.Profile;
import GalleryShop.model.UserLogin;
import GalleryShop.repository.ClientRepository;
import GalleryShop.repository.ProfileRepository;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class ClientForm {

	@NotNull
	@NotEmpty
	private String name;

	@NotNull
	@NotEmpty
	private String lastName;

	@NotEmpty
	private String nickname;

	@Cpf
	private String cpf;

	@NotNull(message = "não pode ser nulo")
	private Date birthDate;

	@NotNull
	@NotEmpty
	@PhoneNumber
	private String phoneNumber;

	@NotNull
	@NotEmpty
	@EmailRegex
	private String email;

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

	public Date getBirthdate() {
		return birthDate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthDate = birthdate;
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

	public Client converter(ProfileRepository profileRepository) {

		List<Profile> newListProfile = new ArrayList<>();

		for (Profile profile : listProfiles) {
			Profile newProfile = profileRepository.findByRole(profile.getRole().toString());
			newListProfile.add(newProfile);
		}


		UserLogin userLogin = new UserLogin();
		userLogin.setPhoneNumber(phoneNumber);
		userLogin.setPassword(new BCryptPasswordEncoder().encode(password));
		userLogin.setProfiles(newListProfile);

		return new Client(name, lastName, nickname, cpf, birthDate, phoneNumber, userLogin, email);
	}

	public Client upload(Long id, ClientRepository clientRepository) {
		Client client = clientRepository.getOne(id);
		client.setName(this.name);
		client.setLastName(this.lastName);
		client.setNickname(this.nickname);
		client.setCpf(this.cpf);
		client.setBirthDate(this.birthDate);
		client.setPhoneNumber(this.phoneNumber);
		client.setEmail(this.email);
		return client;
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
}
