package edu.neu.finalproject.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Chocolate")
public class Chocolate implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Chocolate_Id", unique = true, nullable = false)
	private int chocolateId;

	@Column(name = "Chocolate_Name", nullable = false, length = 100)
	private String chocolateName;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "Category_ID", nullable = true)
	private Category category;

	@Column(name = "Price", nullable = false, length = 100)
	private float price;

	@Column(name = "Quantity", nullable = false, length = 100)
	private int quantity;

	@Column(name = "Description", nullable = false, length = 100)
	private String description;

	@Column(name = "Path", nullable = false, length = 100)
//	private String path="/images/";
	private String path;

	@Column(name= "companyName", nullable = false, length = 100)
	private String companyName;

	// @ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL,
	// mappedBy="product")
	// private List<Supplier> supplier = new ArrayList<Supplier>();

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "chocolate", cascade = CascadeType.ALL)
	private List<OrderItem> orderItem = new ArrayList<OrderItem>();

	public int getChocolateId() {
		return chocolateId;
	}

	public void setChocolateId(int chocolateId) {
		this.chocolateId = chocolateId;
	}

	public String getChocolateName() {
		return chocolateName;
	}

	public void setChocolateName(String chocolateName) {
		this.chocolateName = chocolateName;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
}
