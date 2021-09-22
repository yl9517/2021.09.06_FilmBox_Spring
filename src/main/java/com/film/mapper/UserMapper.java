package com.film.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.UserDTO;

@Mapper
public interface UserMapper {

	public int insertUser(UserDTO dto);

	public int insertFilmUser(UserDTO dto);
	
	public int idcheck(String member_id);

	public String finduserid(String email);

	public void updatepwd(UserDTO dto);
	
	public String getUser(UserDTO dto);
	
	public UserDTO userDetail(String member_id);

	public int updateUser(UserDTO dto);
}
