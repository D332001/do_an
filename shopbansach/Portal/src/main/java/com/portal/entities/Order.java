package com.portal.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_order")
public class Order extends BaseEntity {
	@Column(name = "code", nullable = false)
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = false)
	private BigDecimal total;

	@Column(name = "customer_name", nullable = false)
	private String customerName;

	@Column(name = "customer_address", nullable = false)
	private String customerAddress;

	@Column(name = "customer_phone", nullable = false)
	private String customerPhone;

	@Column(name = "customer_email", nullable = false)
	private String customerEmail;

	@Column(name = "seo")
	private String seo;

	@Column(name = "status_order", nullable = false)
	private String statusOrder;

	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "order"
			, fetch = FetchType.LAZY)
	public List<OrderProducts> orderProducts = new ArrayList<OrderProducts>();

	public void addOrderProducts(OrderProducts _orderProducts) {
		_orderProducts.setOrder(this);
		orderProducts.add(_orderProducts);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<OrderProducts> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<OrderProducts> orderProducts) {
		this.orderProducts = orderProducts;
	}

	public String getStatusOrder() {
		return statusOrder;
	}

	public void setStatusOrder(String statusOrder) {
		this.statusOrder = statusOrder;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}


}
