package com.portal.entities;

import javax.persistence.*;

@Entity
@Table(name = "tbl_order_products")
public class OrderProducts extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;

	@Column(name = "code")
	private String code;

	@Column(name = "name")
	private String name;

	@Column(name = "quality")
	private Integer quality;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	private Order order;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuality() {
		return quality;
	}

	public void setQuality(Integer quality) {
		this.quality = quality;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "style")
	private String style;

	@Column(name = "size")
	private String size;

	@Column(name = "year")
	private String year;

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
}
