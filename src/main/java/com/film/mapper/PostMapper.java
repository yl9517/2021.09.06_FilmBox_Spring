package com.film.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.dto.SubPostDTO;
@Mapper
public interface PostMapper {

	public List<PostDTO> getPostList();

	public List<MovieDTO> getMyMovie(String member_id);

	public void insertPost(PostDTO dto);

	public List<PostDTO> getMoviePostList();

	public PostDTO postdetail(int post_no);

	public void subpostadd(SubPostDTO dto);

//	public List<SubPostDTO> subdetail(int post_no);

	public void subDelete(int subno);

	public int subcount(int post_no);

	public List<SubPostDTO> subdetail(HashMap<String, Object> hm);

}
