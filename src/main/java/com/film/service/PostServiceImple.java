package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.mapper.PostMapper;
@Service(value="postservice")
public class PostServiceImple implements PostService {

	@Autowired
	private PostMapper postMapper;
	
	@Override
	public List<PostDTO> getPostList() {
		// TODO Auto-generated method stub
		return postMapper.getPostList();
	}

	@Override
	public List<MovieDTO> getMyMovie(String member_id) {
		// TODO Auto-generated method stub
		return postMapper.getMyMovie(member_id);
	}

	@Override
	public void insertPost(PostDTO dto) {
		// TODO Auto-generated method stub
		postMapper.insertPost(dto);
	}

	@Override
	public List<PostDTO> getMoviePostList() {
		// TODO Auto-generated method stub
		return postMapper.getMoviePostList();
	}

}
