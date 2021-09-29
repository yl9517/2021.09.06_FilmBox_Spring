package com.film.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.film.dto.ReviewDTO;
import com.film.mapper.MovieMapper;
import com.film.mapper.ReviewMapper;

@Transactional(rollbackFor = {Exception.class}) //exception 발생시 롤백
@Service(value = "reviewservice")
public class ReviewServiceImple implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private MovieMapper mvmapper;
	
	@Override
	public int insertReview(ReviewDTO dto) {
		 int reuslt = mapper.insertReview(dto); //댓글등록
		 mvmapper.avgStarpoint(dto.getMovieCd()); //mv평점 변경
		 
		 return reuslt;
	}

	@Override
	public ReviewDTO getThisReview(ReviewDTO dto) {
		return mapper.getThisReview(dto);
	}

	@Override
	public int modifyReview(ReviewDTO dto) {
		return mapper.modifyReview(dto);
	}

	@Override
	public void deleteReview(ReviewDTO dto) {
		mapper.deleteReview(dto);
	}

	@Override
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto) {
		return mapper.getReviewList(dto);
	}

}
