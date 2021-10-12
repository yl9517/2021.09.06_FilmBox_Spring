package com.film.service;

import java.util.HashMap;
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
		
		if(dto.getUsepoint() > 0) {
			PointDTO usepoint = new PointDTO(dto.getMember_id(), -dto.getUsepoint(), "("+getMovie.getMovieNm()+") 예매 포인트사용", dto.getRev_no());
			pointMapper.changePointR(usepoint);	//포인트사용
		}
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
		if( reMapper.reserveCancel(rev_no) != null) 
		{
			result =  reMapper.reserveCancel(rev_no);	//update rev_condition 2
			KakaopayDTO dto = reMapper.getRevData(rev_no);
			
			MovieDTO getMovie = mvMapper.getMovie(dto.getMovieCd());	//영화 정보
			
			PointDTO pdto =pointMapper.getUsePointData(rev_no);
			if(pdto.getRev_no()!= 0) {
				PointDTO usepoint = new PointDTO(pdto.getMember_id(), -(pdto.getPoint()), "("+getMovie.getMovieNm()+") 예매취소 - 사용 포인트회수");
				pointMapper.changePoint(usepoint);	//사용 포인트 회수
			}
			PointDTO pointdto = new PointDTO(dto.getMember_id(), (int) -(dto.getPayMoney()*0.05), "("+getMovie.getMovieNm()+") 예매취소 - 적립 포인트회수");//예매포인트 회수
			 pointMapper.changePoint(pointdto); //적립 포인트 회수
			
			userMapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
		}
		return result;
	}

	@Override
	public void updateCondition() {
		reMapper.updateCondition(reMapper.selectPast());	
//		List<HashMap<String, Object>> map = reMapper.selectPast();
//		System.out.println(map.get(0).get("rev_no"));
//		System.out.println(map.get(1).get("rev_no"));
//		System.out.println(map.get(2).get("rev_no"));
	}

	@Override
	public List<MovieDTO> getMovieList() {
		// TODO Auto-generated method stub
		return reMapper.getMovieList();
	}

	@Override
	public KakaopayDTO getmoviecd(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		return reMapper.getmoviecd(dto);
	}


	
	
}
