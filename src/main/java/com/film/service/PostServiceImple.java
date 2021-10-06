package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.film.dto.PostDTO;
import com.film.mapper.PostMapper;

public class PostServiceImple implements PostService {

	@Autowired
	private PostMapper postMapper;
	
	@Override
	public List<PostDTO> getPostList() {
		// TODO Auto-generated method stub
		return postMapper.getPostList();
	}

}
