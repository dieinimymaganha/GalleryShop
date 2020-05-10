package GalleryShop.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "employee")
public class Employee extends Person {

	private String rg;
	private Double commissionRate;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "type_employees_id")
	private List<TypeEmployee> typeEmployees = new ArrayList<>();

	public Employee() {

	}

	public Employee(String name, String lastName, String nickname, String cpf, Date birthDate, String phoneNumber,
			String rg, Double commissionRate, List<TypeEmployee> typeEmployees) {
		super(name, lastName, nickname, cpf, birthDate, phoneNumber);
		this.rg = rg;
		this.commissionRate = commissionRate;
		this.typeEmployees = typeEmployees;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Double getCommissionRate() {
		return commissionRate;
	}

	public void setCommissionRate(Double commissionRate) {
		this.commissionRate = commissionRate;
	}

	public List<TypeEmployee> getTypeEmployees() {
		return typeEmployees;
	}

	public void setTypeEmployees(List<TypeEmployee> typeEmployees) {
		this.typeEmployees = typeEmployees;
	}

}
