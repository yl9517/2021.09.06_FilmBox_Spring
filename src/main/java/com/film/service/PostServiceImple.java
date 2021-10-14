package com.film.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.dto.SubPostDTO;
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

	@Override
	public PostDTO postdetail(int post_no) {
		// TODO Auto-generated method stub
		return postMapper.postdetail(post_no);
	}

	@Override
	public void subpostadd(SubPostDTO dto) {
		// TODO Auto-generated method stub
		postMapper.subpostadd(dto);
	}

//	@Override
//	public List<SubPostDTO> subdetail(int post_no) {
//		// TODO Auto-generated method stub
//
//		return postMapper.subdetail(post_no);
//	}
	@Override
	public List<SubPostDTO> subdetail(int startrow, int endrow) {
		// TODO Auto-generated method stub

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startrow", startrow);
		hm.put("endrow", endrow);
		
		return postMapper.subdetail(hm);
	}

	@Override
	public void subDelete(int subno) {
		// TODO Auto-generated method stub
		postMapper.subDelete(subno);
	}

	@Override
	public int subcount(int post_no) {
		// TODO Auto-generated method stub
		return postMapper.subcount(post_no);
	}

	@Override
	public void updatePost(PostDTO dto) {
		// TODO Auto-generated method stub
		postMapper.updatePost(dto);
	}

	@Override
	public void postDelete(int post_no) {
		// TODO Auto-generated method stub
		postMapper.postDelete(post_no);
	}

	@Override
	public int getMyPostCount(String member_id)
	{
		return postMapper.getMyPostCount(member_id);
	}

	@Override
	public List<PostDTO> getMyPostList(String member_id) 
	{
		return postMapper.getMyPostList(member_id);
	}

}
