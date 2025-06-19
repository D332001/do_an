package com.core.entities;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CartItem {
	private int productId;
	private String productName;
	private int quantity;
	private BigDecimal unitPrice;
	private String style;

	private String size;

	private String year;

}
