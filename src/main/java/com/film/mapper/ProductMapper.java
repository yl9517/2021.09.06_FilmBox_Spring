package com.film.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	public int insertProduct(ProductDTO dto);
}
