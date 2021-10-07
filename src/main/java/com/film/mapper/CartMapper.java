package com.film.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.CartDTO;

@Mapper
public interface CartMapper {
	public void insertCart(CartDTO dto);
}
