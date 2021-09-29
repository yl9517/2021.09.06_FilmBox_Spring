package com.film.service;

import java.util.List;

import com.film.dto.KakaopayDTO;

public interface ReserveService {
	public void reserveinsert(KakaopayDTO dto);
	public void screeninsert(KakaopayDTO dto);
//	public void screeninsert(List<KakaopayDTO> list);

}
