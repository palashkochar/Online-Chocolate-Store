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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Category_Id", unique = true, nullable = false)
	private int categoryId;

	@Column(name = "CategoryName", nullable = false, unique = true, length = 100)
	private String categoryName;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category", cascade = CascadeType.ALL)
	private List<Chocolate> chocolate = new ArrayList<Chocolate>();

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Chocolate> getChocolate() {
		return chocolate;
	}

	public void setChocolate(List<Chocolate> chocolate) {
		this.chocolate = chocolate;
	}

	@Override
	public String toString() {
		return categoryName;
	}

}
