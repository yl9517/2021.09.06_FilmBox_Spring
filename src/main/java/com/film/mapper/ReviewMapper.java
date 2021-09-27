package com.film.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);
	public void deleteReview(ReviewDTO dto);
	public List<ReviewDTO> getReviewList(ReviewDTO dto);

}
