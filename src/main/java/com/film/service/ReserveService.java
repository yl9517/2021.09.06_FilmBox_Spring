package com.film.service;

import java.util.List;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;

public interface ReserveService {
	public void reserveinsert(KakaopayDTO dto);
	public void screeninsert(ScreenDTO sDTO);

	//리뷰 권한 확인쿼리
	public Integer isRevNo(ReviewDTO rDTO);
	public List<ScreenDTO> getseats(KakaopayDTO dto);
	//예매 취소
	public Integer revCancel(int rev_no);
	
	//날짜,시간 지나면 condition 변경
	public void updateCondition();
	
	//영화 리스트 
	public List<MovieDTO> getMovieList();
	public KakaopayDTO getmoviecd(KakaopayDTO dto);
	public void usepointupdate(KakaopayDTO dto);
	public void usepointinsert(KakaopayDTO dto);
}
