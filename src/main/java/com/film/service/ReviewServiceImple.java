package com.film.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.film.dto.PointDTO;
import com.film.dto.ReviewDTO;
import com.film.mapper.MovieMapper;
import com.film.mapper.PointMapper;
import com.film.mapper.ReviewMapper;
import com.film.mapper.UserMapper;

@Transactional(rollbackFor = {Exception.class}) //exception 발생시 롤백
@Service(value = "reviewservice")
public class ReviewServiceImple implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private MovieMapper mvMapper;
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int insertReview(ReviewDTO dto) {
		 int reuslt = mapper.insertReview(dto); //댓글등록
		 mvMapper.avgStarpoint(dto.getMovieCd()); //mv평점 변경
		 
		 String movieNm = mvMapper.getMovie(dto.getMovieCd()).getMovieNm();
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), 500, "("+movieNm+") 관람평 작성 포인트적립");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 적립
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
		 
		 
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
		
		 String movieNm = mvMapper.getMovie(dto.getMovieCd()).getMovieNm();
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), -500, "("+movieNm+") 관람평 삭제 포인트회수");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 삭제
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)

	}

	@Override
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto) {
		return mapper.getReviewList(dto);
	}

}
