package com.film.service;

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
	public List<ProductDTO> getProductList() 
	{
		return productmapper.getProductList();
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

	
	
}
