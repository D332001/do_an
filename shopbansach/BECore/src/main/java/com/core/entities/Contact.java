package com.core.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity // tương ứng với 1 Table
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
	
	@Column(name = "full_name", nullable = false) // tương ứng với cột trong table
	private String fullName;

	
	@Column(name = "email",nullable = false)
	private String email;
	
	@Column(name = "message", nullable = false)
	private String message;

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
