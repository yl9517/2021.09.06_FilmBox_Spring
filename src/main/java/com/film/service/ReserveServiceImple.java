package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.PointDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ReviewDTO;
import com.film.dto.ScreenDTO;
import com.film.mapper.MovieMapper;
import com.film.mapper.PointMapper;
import com.film.mapper.ReserveMapper;
import com.film.mapper.UserMapper;
@Service(value="reserveservice")
public class ReserveServiceImple implements ReserveService {

	@Autowired
	private ReserveMapper reMapper;
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired MovieMapper mvMapper;
	
	@Override
	public void reserveinsert(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		reMapper.reserveinsert(dto);
		
		MovieDTO getMovie = mvMapper.getMovie(dto.getMovieCd());
		 PointDTO pointdto = new PointDTO(dto.getMember_id(), (int) (dto.getPayMoney()*0.05), "("+getMovie.getMovieNm()+") 예매 포인트적립");//포인트 적립
		 pointMapper.changePoint(pointdto); //포인트 적립
		 userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
		
	}

	@Override
	public void screeninsert(ScreenDTO sDTO) {
		// TODO Auto-generated method stub
		reMapper.screeninsert(sDTO);
	}
	
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

	@Override
	public void updateCondition() {
		reMapper.updateCondition(reMapper.selectPast());		
	}

	@Override
	public List<MovieDTO> getMovieList() {
		// TODO Auto-generated method stub
		return reMapper.getMovieList();
	}


	
	
}
