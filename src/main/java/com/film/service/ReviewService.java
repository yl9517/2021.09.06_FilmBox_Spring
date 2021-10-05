package com.film.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.film.dto.ReportDTO;
import com.film.dto.ReviewDTO;

public interface ReviewService {

	public void insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public void modifyReview(ReviewDTO dto);
	public void deleteReview(ReviewDTO dto);
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto);
	public int report(ReportDTO redto);

}
