package com.portal.entities;

import lombok.Data;

import javax.persistence.Column;
import java.math.BigDecimal;

@Data
public class CartItem {
	private int productId;
	private String productName;
	private String code;

	private int quantity;
	private BigDecimal unitPrice;
	private String productImage;
	private String style;

	private String size;

	private String year;
}
