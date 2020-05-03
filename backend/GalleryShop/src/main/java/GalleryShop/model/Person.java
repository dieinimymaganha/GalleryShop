package GalleryShop.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Person{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private String name;
	private String lastName;
	private String nickname;
	@Column(unique = true)
	private String cpf;
	private Date birthdate;
	private String phoneNumber;
	
	public Person(String name, String lastName, String nickname, String cpf, Date birthdate,
			String phoneNumber) {
		super();
		this.name = name;
		this.lastName = lastName;
		this.nickname = nickname;
		this.cpf = cpf;
		this.birthdate = birthdate;
		this.phoneNumber = phoneNumber;
	}

	public Person() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
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
	
	
	
	
	
	

}
