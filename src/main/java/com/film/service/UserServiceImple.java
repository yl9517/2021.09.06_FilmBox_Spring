package com.film.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.UserDTO;
import com.film.mapper.UserMapper;


@Service
public class UserServiceImple implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public void insertUser(UserDTO dto) {
		
		int result=mapper.insertUser(dto);
		
	}
	
	@Override
	public void insertFilmUser(UserDTO dto) {

		int result=mapper.insertFilmUser(dto);
		
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
}
