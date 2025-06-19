package com.portal.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.*;

@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails {
	private static final long serialVersionUID = -1956195527415323516L;

	@Column(name = "username", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 100, nullable = false)
	private String password;


	@Column(name = "email", length = 45, nullable = false)
	private String email;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(
			name = "tbl_users_roles",
			joinColumns = @JoinColumn(
					name = "user_id", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(
					name = "role_id", referencedColumnName = "id"
			)
	)
	private Collection<Role> roles;
	@Transient
	private List<String> listName;

	public List<String> getListName() {
		return listName;
	}

	public void setListName(List<String> listName) {
		this.listName = listName;
	}


	@Column(name = "address", nullable = false)
	private String address;

	@Column(name = "phone", nullable = false)
	private String phone;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}
}
