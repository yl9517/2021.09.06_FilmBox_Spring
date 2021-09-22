package com.film.service;

import com.film.dto.UserDTO;

public interface UserService {

	public void insertUser(UserDTO dto);
	
	public void insertFilmUser(UserDTO dto);
	
	public int idcheck(String member_id);

	public String finduserid(String email);

	public void updatepwd(UserDTO dto);

	public String getUser(UserDTO dto);
	
	public UserDTO userDetail(String member_id);

	public boolean updateUser(UserDTO dto);

}
