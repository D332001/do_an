package com.core.service;

import com.core.common.ProductSearch;
import com.core.common.Utilities;
import com.core.entities.Product;
import com.core.entities.ProductImages;
import com.core.repositories.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.io.File;
import java.util.List;

@Service
public class ProductService {

	@Autowired public ProductRepo productRepo;
	@PersistenceContext protected EntityManager entityManager;

	@SuppressWarnings("unchecked")
	public List<Product> search(final ProductSearch productSearch) {
		String jpql = "Select p from Product p where 1=1";
		if(productSearch.getSeoCategoty() != null && !productSearch.getSeoCategoty().isEmpty()) {
			jpql += " and p.category.seo = '" + productSearch.getSeoCategoty() + "'";
		}
		if(productSearch.getSeoProduct() != null && !productSearch.getSeoProduct().isEmpty()) {
			jpql += " and p.seo = '" + productSearch.getSeoProduct() + "'";
		}
		Query query = entityManager.createQuery(jpql, Product.class);

		if(productSearch.getCurrentPage() != null && productSearch.getCurrentPage() > 0) {
			query.setFirstResult((productSearch.getCurrentPage()-1) * ProductSearch.SIZE_ITEMS_ON_PAGE);
			query.setMaxResults(ProductSearch.SIZE_ITEMS_ON_PAGE);
		}

		return query.getResultList();
	}
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if(images == null || images.length <= 0) return true;
		if(images.length == 1 && images[0].getOriginalFilename().isEmpty()) return true;
		return false;
	}
	
	@Transactional(rollbackOn = Exception.class)
	public void saveProduct(MultipartFile[] images, Product product) throws Exception {
		try {
			product.setSeo(Utilities.createSeoLink(product.getTitle()));

			if(product.getId() != null) { // chỉnh sửa
				// lấy dữ liệu cũ của sản phẩm
				Product productInDb = productRepo.findById(product.getId()).get();

				if(!isEmptyUploadFile(images)) { // nếu admin sửa ảnh sản phẩm
					// lấy danh sách ảnh của sản phẩm cũ
					List<ProductImages> productImages = productInDb.getProductImages();
					// xoá ảnh cũ đi
					for(ProductImages _images : productImages) {
						new File("D:\\picture\\" + _images.getPath()).delete();
					}
					product.clearProductImages();
				} else { // ảnh phải giữ nguyên
					product.setProductImages(productInDb.getProductImages());
				}
			}

			// thêm ảnh mới.
			if(!isEmptyUploadFile(images)) {
				for(MultipartFile image : images) {
					image.transferTo(new File("D:\\picture\\" + image.getOriginalFilename()));
					ProductImages productImages = new ProductImages();
					productImages.setTitle(image.getOriginalFilename());
					productImages.setPath(image.getOriginalFilename());
					product.addProductImages(productImages);
				}
			}
			productRepo.save(product);

		} catch (Exception e) {
			throw e;
		}
	}

	public List<Product> listAll(String keyword) {
		if (keyword != null) {
			return productRepo.search(keyword);
		}
		return productRepo.findAll();
	}
}
