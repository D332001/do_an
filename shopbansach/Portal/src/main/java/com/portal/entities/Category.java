package com.portal.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_category")
public class Category extends BaseEntity {

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "code", length = 50, nullable = false)
	private String code;

	@Column(name = "description", length = 45, nullable = false)
	private String description;

	// 1 category -> N products
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "category"/* tên property category trong class product */
			, fetch = FetchType.LAZY)
	private List<Product> products = new ArrayList<Product>();

	@Column(name = "seo", nullable = false)
	private String seo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
