package edu.neu.finalproject.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Company")
@PrimaryKeyJoinColumn(name="PersonId")
public class Company extends Person implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Column(name="Company_Name", nullable=false, unique=true, length=100)
	private String companyName;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="Company_Chocolate",
	   joinColumns={@JoinColumn(name="PersonId", nullable=false, updatable=false)},
	   inverseJoinColumns={@JoinColumn(name="Chocolate_ID", nullable=false, updatable=false)})
	private List<Chocolate> chocolate = new ArrayList<Chocolate>();

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public List<Chocolate> getChocolate() {
		return chocolate;
	}

	public void setChocolate(List<Chocolate> chocolate) {
		this.chocolate = chocolate;
	}

//	public long getSupplierId() {
//		return supplierId;
//	}
//
//	public void setSupplierId(long supplierId) {
//		this.supplierId = supplierId;
//	}

//	public Admin getAdmin() {
//		return admin;
//	}
//
//	public void setAdmin(Admin admin) {
//		this.admin = admin;
//	}

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}
	
}