package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.MypageDTO;
import com.film.dto.UserDTO;

@Mapper
public interface UserMapper {

	public int insertUser(UserDTO dto);
	
	public int idcheck(String member_id);

	public String finduserid(String email);

	public void updatepwd(UserDTO dto);
	
	public UserDTO getUser(UserDTO dto);
	
	public UserDTO userDetail(String member_id);

	public int updateUser(UserDTO dto);

	public int deleteUser(String member_id);

	public int pwdcheck(UserDTO dto);

	public int emailcheck(String email);

	public List<MypageDTO> getMyfilmData(String member_id);
	
	public List<MypageDTO> getRsvData(String member_id);
	
	public void updateMyPoint(String member_id);

	public String getPoster(String movieNm);

	
}
