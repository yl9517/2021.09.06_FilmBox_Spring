package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.ProductDTO;
import com.film.mapper.ProductMapper;

@Service
public class ProductServiceImple implements ProductService {
	
	@Autowired
	private ProductMapper productmapper;

	@Override
	public int insertProduct(ProductDTO dto) {

		return productmapper.insertProduct(dto);
	}
	
	
}
