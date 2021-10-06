package com.film.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
@Mapper
public interface PostMapper {

	public List<PostDTO> getPostList();

	public List<MovieDTO> getMyMovie(String member_id);

}
