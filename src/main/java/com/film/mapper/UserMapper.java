package com.film.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.UserDTO;

@Mapper
public interface UserMapper {

	public int insertUser(UserDTO dto);

}