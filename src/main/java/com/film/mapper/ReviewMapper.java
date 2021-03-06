package com.film.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.ReportDTO;
import com.film.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

	public int insertReview(ReviewDTO dto);
	public ReviewDTO getThisReview(ReviewDTO dto);
	public int modifyReview(ReviewDTO dto);
	public void deleteReview(ReviewDTO dto);
	public List<HashMap<String, Object>> getReviewList(ReviewDTO dto);
	
	public void report(ReportDTO redto);
	public Integer prereport(ReportDTO redto);
	public ReportDTO checkreport(ReportDTO redto);
	public ReviewDTO getReviewno(int review_no);

}
