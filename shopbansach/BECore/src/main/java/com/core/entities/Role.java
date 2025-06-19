package com.core.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity  {
	private static final long serialVersionUID = -1246332751520787944L;

	@Column(name = "name", length = 45, nullable = false)
	private String name;

	@Column(name = "description", length = 45, nullable = false)
	private String description;


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

}
