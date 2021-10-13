package com.film.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.ProductDTO;
import com.film.mapper.ProductMapper;

@Service
public class ProductServiceImple implements ProductService {
	
	@Autowired
	private ProductMapper productmapper;

	@Override
	public int insertProduct(ProductDTO dto) 
	{
		return productmapper.insertProduct(dto);
	}
	
	@Override
	public List<ProductDTO> getCouponList() {	
		return productmapper.getCouponList();
	}
	@Override
	public List<ProductDTO> getFoodList() {	
		return productmapper.getFoodList();
	}
	
	@Override
	public List<ProductDTO> getProductListP(String search, int startRow, int endRow) 
	{
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("search", search);
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		return productmapper.getProductListP(hmap);
	}

	@Override
	public ProductDTO detailProduct(int product_no) 
	{
		return productmapper.detailProduct(product_no);
	}

	@Override
	public int updateProduct(ProductDTO dto) 
	{
		return productmapper.updateProduct(dto);
	}

	@Override
	public int deleteProduct(int product_no) 
	{
		return productmapper.deleteProduct(product_no);
	}

	@Override
	public int totalCount(String search) 
	{
		HashMap<String, Object> smap = new HashMap<String, Object>();
		smap.put("search", search);
		return productmapper.totalCount(smap);
	}

}
