package com.portal.entities;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;

@Entity
@Table(name = "tbl_roles")
public class Role extends BaseEntity implements GrantedAuthority {
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

	@Override
	public String getAuthority() {
		return name;
	}

}
