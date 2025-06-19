package com.portal.entities;

import java.util.ArrayList;
import java.util.List;

/**
 * giỏ hàng.
 * @author admin
 */
public class Cart {
	public List<CartItem> cartItems = new ArrayList<CartItem>();
	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

}
