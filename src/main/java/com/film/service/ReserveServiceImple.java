package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.KakaopayDTO;
import com.film.mapper.ReserveMapper;
@Service(value="reserveservice")
public class ReserveServiceImple implements ReserveService {

	@Autowired
	private ReserveMapper reMapper;
	
	@Override
	public void reserveinsert(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		reMapper.reserveinsert(dto);
	}
	
//	@Override
//	public void screeninsert(List<KakaopayDTO> list) {
//		// TODO Auto-generated method stub
//		reMapper.screeninsert(list);
//	}
	
	@Override
	public void screeninsert(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		reMapper.screeninsert(dto);
	}
}
