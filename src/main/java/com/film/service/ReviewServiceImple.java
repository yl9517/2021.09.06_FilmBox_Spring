package com.film.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.film.dto.PointDTO;
import com.film.dto.ReportDTO;
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
	public void insertReview(ReviewDTO dto) {
		 int reuslt = mapper.insertReview(dto); //댓글등록
		 mvMapper.avgStarpoint(dto.getMovieCd()); //mv평점 변경
		 
		 String movieNm = mvMapper.getMovie(dto.getMovieCd()).getMovieNm();
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), 500, "("+movieNm+") 관람평 작성 포인트적립");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 적립
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
	}

	@Override
	public ReviewDTO getThisReview(ReviewDTO dto) {
		return mapper.getThisReview(dto);
	}

	@Override
	public void modifyReview(ReviewDTO dto) {
			mapper.modifyReview(dto);
		mvMapper.avgStarpoint(dto.getMovieCd()); //mv평점 변경
	}

	@Override
	public void deleteReview(ReviewDTO dto) {
		mapper.deleteReview(dto);
		mvMapper.avgStarpoint(dto.getMovieCd()); //mv평점 변경
		
		 String movieNm = mvMapper.getMovie(dto.getMovieCd()).getMovieNm();
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), -500, "("+movieNm+") 관람평 삭제 포인트회수");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 삭제
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)

	}

	@Override
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto) {
		return mapper.getReviewList(dto);
	}

	@Override
	public int report(ReportDTO redto) {	
		int result = 0;
		if(mapper.prereport(redto) != null) { //신고 전적 있으면 신고불가
			result = 1;
		}else { //신고전적 없으면 신고완료
			mapper.report(redto);
			
			//신고횟수 확인
			ReportDTO reportreview = mapper.checkreport(redto);
			 
			int checkreport =  reportreview.getRepcount();
			int review_no =  reportreview.getReview_no();
			
			if(checkreport >= 3) { //3번 이상이면
				ReviewDTO reviewDto = mapper.getReviewno(review_no);
				reviewDto.setReview_content("신고 된 관람평입니다");
				modifyReview(reviewDto);
			}
		}
		return result;
	}

}
