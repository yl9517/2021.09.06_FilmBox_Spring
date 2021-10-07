package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.CartDTO;
import com.film.mapper.CartMapper;

@Service
public class CartImpleService implements CartService{

	@Autowired
	private CartMapper mapper;
	
	@Override
	public void insertCart(CartDTO dto) {
		mapper.insertCart(dto);
	}

}
