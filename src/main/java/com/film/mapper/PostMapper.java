package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.PostDTO;
@Mapper
public interface PostMapper {

	public List<PostDTO> getPostList();

}
