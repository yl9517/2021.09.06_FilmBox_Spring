package com.film.service;

import java.util.List;

import com.film.dto.KakaopayDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;

public interface ReserveService {
	public void reserveinsert(KakaopayDTO dto);
//	public void screeninsert(KakaopayDTO dto);
//	public void screeninsert(List<KakaopayDTO> list);
//	public void screeninsert(List<KakaopayDTO> list);
	public void screeninsert(ScreenDTO sDTO);

	//리뷰 권한 확인쿼리
	public Integer isRevNo(ReviewDTO rDTO);
	public List<ScreenDTO> getseats(KakaopayDTO dto);
}
