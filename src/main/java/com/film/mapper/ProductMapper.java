package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	public int insertProduct(ProductDTO dto);
	
	public List<ProductDTO> getCouponList();
	public List<ProductDTO> getFoodList();

	public List<ProductDTO> getProductListP(HashMap<String, Object> hmap);

	public ProductDTO detailProduct(int product_no);

	public int updateProduct(ProductDTO dto);

	public int deleteProduct(int product_no);

	public int totalCount(HashMap<String, Object> smap);

	
}
