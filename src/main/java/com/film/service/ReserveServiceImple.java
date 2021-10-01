package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.KakaopayDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;
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

	@Override
	public void screeninsert(ScreenDTO sDTO) {
		// TODO Auto-generated method stub
		reMapper.screeninsert(sDTO);
	}

//	@Override
//	public void screeninsert(List<KakaopayDTO> list) {
//		// TODO Auto-generated method stub
//		reMapper.screeninsert(list);
//	}
	
//	@Override
//	public void screeninsert(List<KakaopayDTO> list) {
//		// TODO Auto-generated method stub
//		reMapper.screeninsert(list);
//	}
	
//	@Override
//	public void screeninsert(KakaopayDTO dto) {
//		// TODO Auto-generated method stub
//		reMapper.screeninsert(dto);
//	}
	
	@Override
	public Integer isRevNo(ReviewDTO rDTO) {
		int result = 0;
		if( reMapper.isRevNo(rDTO) != null) {
			result =  reMapper.isRevNo(rDTO);
		}
		return result;
	}

	@Override
	public List<ScreenDTO> getseats(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		return reMapper.getseats(dto);
	}

	@Override
	public Integer revCancel(int rev_no) {
		// TODO Auto-generated method stub
		int result = 0;
		if( reMapper.reserveCancel(rev_no) != null) {
			result =  reMapper.reserveCancel(rev_no);
		}
		return result;
	}
	
}
