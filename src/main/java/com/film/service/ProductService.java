package com.film.service;

import java.util.List;

import com.film.dto.ProductDTO;

public interface ProductService {

	public int insertProduct(ProductDTO dto);

	public List<ProductDTO> getProductList();
	
	public List<ProductDTO> getProductListP(int startRow, int endRow);

	public ProductDTO detailProduct(int product_no);

	public int updateProduct(ProductDTO dto);

	public int deleteProduct(int product_no);

	public int totalCount();

}
