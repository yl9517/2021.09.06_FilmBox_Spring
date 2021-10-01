package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.film.dto.MypageDTO;
import com.film.dto.PointDTO;
import com.film.dto.UserDTO;
import com.film.mapper.PointMapper;
import com.film.mapper.ReserveMapper;
import com.film.mapper.UserMapper;


@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired PointMapper pointMapper;
	
	@Autowired ReserveMapper revMapper;
	
	@Override
	public void insertUser(UserDTO dto) {
		
		int result=mapper.insertUser(dto);
		
	}
	
	@Override
	public void insertFilmUser(UserDTO dto) {
		int result=mapper.insertUser(dto);
		PointDTO pointdto = new PointDTO(dto.getMember_id(), 3000, "회원가입 적립");//포인트 적립
		pointMapper.changePoint(pointdto); //포인트 적립
		mapper.updateMyPoint(dto.getMember_id()); //회원테이블 업뎃(포인트)
		 
	}

	@Override
	public int idcheck(String member_id) {
		
		return mapper.idcheck(member_id);
	}

	@Override
	public String finduserid(String email) {
		return mapper.finduserid(email);
	}

	@Override
	public void updatepwd(UserDTO dto) {
		// TODO Auto-generated method stub
		mapper.updatepwd(dto);
	}


	@Override
	public String getUser(UserDTO dto) {
		
		return mapper.getUser(dto);
	}
	
	@Override
	public UserDTO userDetail(String member_id) {
		
		return mapper.userDetail(member_id);
	}

	@Override
	public boolean updateUser(UserDTO dto) {

		int r=mapper.updateUser(dto);
		boolean result=false;
		
		if(r>0)
		{
			result=true;
		}
		return result;
	}

	@Override
	public void deleteUser(String member_id) {
		
		int result=mapper.deleteUser(member_id);

	}

	@Override
	public int pwdcheck(UserDTO dto) {
		
		return mapper.pwdcheck(dto);
	}

	@Override
	public int emailcheck(String email) {
		
		return mapper.emailcheck(email);
	}
	
	@Override
	public List<MypageDTO> getMyfilmData(String member_id) {
		
		return mapper.getMyfilmData(member_id);
	}

	@Override
	public List<PointDTO> getMyPoints(String member_id) {
		// TODO Auto-generated method stub
		return pointMapper.getMyPoints(member_id);
	}


}
