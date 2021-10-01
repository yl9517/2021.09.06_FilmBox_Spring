package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;

@Mapper
public interface ReserveMapper {

	
	public void reserveinsert(KakaopayDTO dto);
	public void screeninsert(ScreenDTO sDTO);
	
	//리뷰 권한 확인쿼리
	public Integer isRevNo(ReviewDTO rDTO);
	public List<ScreenDTO> getseats(KakaopayDTO dto);
	//예매취소
	public Integer reserveCancel(int rev_no);
	
	//날짜,시간 지나면 condition 변경
	public List<HashMap<String, Integer>> selectPast();
	public void updateCondition(List<HashMap<String, Integer>> list);
	
	
	public List<MovieDTO> getMovieList();
	public KakaopayDTO getmoviecd(KakaopayDTO dto);

}
