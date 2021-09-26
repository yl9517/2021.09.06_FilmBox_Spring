package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.ReviewDTO;
import com.film.mapper.ReviewMapper;

@Service(value = "reviewservice")
public class ReviewServiceImple implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int insertReview(ReviewDTO dto) {
		return mapper.insertReview(dto);
	}

	@Override
	public ReviewDTO getThisReview(ReviewDTO dto) {
		return mapper.getThisReview(dto);
	}

	@Override
	public int modifyReview(ReviewDTO dto) {
		return mapper.modifyReview(dto);
	}

}
