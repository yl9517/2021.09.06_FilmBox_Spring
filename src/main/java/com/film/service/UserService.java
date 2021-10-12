package com.film.service;

import java.util.List;

import com.film.dto.MypageDTO;
import com.film.dto.PointDTO;
import com.film.dto.UserDTO;

public interface UserService {


	public void insertUser(UserDTO dto);

	public void insertFilmUser(UserDTO dto);

	public int idcheck(String member_id);

	public String finduserid(String email);

	public void updatepwd(UserDTO dto);

	public UserDTO getUser(UserDTO dto);

	public UserDTO userDetail(String member_id);

	public boolean updateUser(UserDTO dto);

	public void deleteUser(String member_id);

	public int pwdcheck(UserDTO dto);

	public int emailcheck(String email);

	public List<MypageDTO> getMyfilmData(String member_id);
	
	public List<MypageDTO> getRsvData(String member_id);

	public String getPoster(String movieNm);

	public int totalCount(String member_id);

	public List<PointDTO> getMyPointList(String member_id, int startRow, int endRow);

	

}

