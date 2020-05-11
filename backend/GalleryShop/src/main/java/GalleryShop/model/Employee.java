package GalleryShop.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "employee")
public class Employee extends Person {

	private String rg;
	private Double commissionRate;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToMany(mappedBy = "employees")
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commissionRate == null) ? 0 : commissionRate.hashCode());
		result = prime * result + ((rg == null) ? 0 : rg.hashCode());
		result = prime * result + ((typeEmployees == null) ? 0 : typeEmployees.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (commissionRate == null) {
			if (other.commissionRate != null)
				return false;
		} else if (!commissionRate.equals(other.commissionRate))
			return false;
		if (rg == null) {
			if (other.rg != null)
				return false;
		} else if (!rg.equals(other.rg))
			return false;
		if (typeEmployees == null) {
			if (other.typeEmployees != null)
				return false;
		} else if (!typeEmployees.equals(other.typeEmployees))
			return false;
		return true;
	}



	
}
