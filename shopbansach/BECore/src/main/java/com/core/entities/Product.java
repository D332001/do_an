package com.core.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity {
	@Column(name = "code", length = 500, nullable = false)
	private String code;
	@Column(name = "style",length = 500)
	private String style;

	@Column(name = "size",length = 500)
	private String size;

	@Column(name = "year",length = 500)
	private String year;
	@Column(name = "title", length = 500, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;

	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String shortDetails;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id") // tên field khoá ngoại
	private Category category;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.EAGER, orphanRemoval = true)
	private List<ProductImages> productImages = new ArrayList<ProductImages>();

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productComment")
	private List<Comment> comments = new ArrayList<Comment>();

	@Column(name = "seo", nullable = false)
	private String seo;
	/**
	 * Thêm ảnh vào sản phẩm.
	 *
	 * @param _productImages
	 */
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}

	public void clearProductImages() {
		for(ProductImages productImages : productImages) {
			productImages.setProduct(null);
		}
		productImages.clear();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	public String getShortDetails() {
		return shortDetails;
	}

	public void setShortDetails(String shortDetails) {
		this.shortDetails = shortDetails;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(List<ProductImages> productImages) {
		this.productImages = productImages;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

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
