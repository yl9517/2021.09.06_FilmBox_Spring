package com.film.service;

import com.film.dto.ReviewDTO;

public interface ReviewService {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);

}
