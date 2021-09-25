package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.mapper.ReviewMapper;

@Service(value = "reviewservice")
public class ReviewServiceImple implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int insertReview() {
		return mapper.insertReview();
	}

}
