package com.core.entities;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@MappedSuperclass
public abstract class BaseEntity {
	@Id // xác định đây là khoá chính.
	@GeneratedValue(strategy = GenerationType.IDENTITY) // auto-increment.
	@Column(name = "id")
	private Integer id; // primary-key

	@CreationTimestamp
	@CreatedDate
	@Column(name = "created_date")
	private LocalDateTime createdDate;

	@UpdateTimestamp
	@LastModifiedDate
	@Column(name = "updated_date")
	private LocalDateTime updatedDate;

	@CreatedBy
	@Column(name = "created_by")
	private Integer createdBy;

	@LastModifiedBy
	@Column(name = "updated_by")
	private Integer updatedBy;

	@Column(name = "status", nullable = false)
	private boolean status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Integer getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
