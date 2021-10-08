package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	public int insertProduct(ProductDTO dto);

	public List<ProductDTO> getProductList();
	
	public String getImg(int product_no);

	public ProductDTO detailProduct(int product_no);

	public int updateProduct(ProductDTO dto);

	public int deleteProduct(int product_no);
}
