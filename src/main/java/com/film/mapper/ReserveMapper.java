package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.KakaopayDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;

@Mapper
public interface ReserveMapper {

	
	public void reserveinsert(KakaopayDTO dto);
//	public void screeninsert(KakaopayDTO dto);
//	public void screeninsert(List<KakaopayDTO> list);
//	public void screeninsert(List<KakaopayDTO> list);
	public void screeninsert(ScreenDTO sDTO);
	
	//리뷰 권한 확인쿼리
	public Integer isRevNo(ReviewDTO rDTO);

}
