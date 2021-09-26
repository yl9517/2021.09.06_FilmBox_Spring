package com.film.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);

}
