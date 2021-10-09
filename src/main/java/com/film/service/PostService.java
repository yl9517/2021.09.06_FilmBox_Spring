package com.film.service;

import java.util.List;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;

public interface PostService {

	public List<PostDTO> getPostList();

	public List<MovieDTO> getMyMovie(String member_id);

	public void insertPost(PostDTO dto);

	public List<PostDTO> getMoviePostList();
	
}
