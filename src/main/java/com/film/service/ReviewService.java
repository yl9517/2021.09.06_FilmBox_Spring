package com.film.service;

import java.util.List;

import com.film.dto.ReviewDTO;

public interface ReviewService {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);
	public void deleteReview(ReviewDTO dto);
	public List<ReviewDTO> getReviewList(ReviewDTO dto);

}
