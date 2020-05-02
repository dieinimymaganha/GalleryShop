package GalleryShop.model;

import java.util.Date;

import javax.persistence.Entity;

@Entity
public class Employee extends Person{
	
	private String rg;
	private Double commissionRate;
	private String typeEmployee;
	
	public Employee(long id, String name, String lastName, String nickname, String cpf, Date birthdate,
			String phoneNumber, String rg, Double commissionRate, String typeEmployee) {
		super(name, lastName, nickname, cpf, birthdate, phoneNumber);
		this.rg = rg;
		this.commissionRate = commissionRate;
		this.typeEmployee = typeEmployee;
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

	public String getTypeEmployee() {
		return typeEmployee;
	}

	public void setTypeEmployee(String typeEmployee) {
		this.typeEmployee = typeEmployee;
	}
	
	


}
