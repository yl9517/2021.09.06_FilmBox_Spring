package com.film.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.film.dto.ReviewDTO;

public interface ReviewService {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);
	public void deleteReview(ReviewDTO dto);
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto);

}
