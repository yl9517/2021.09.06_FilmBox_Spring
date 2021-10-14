package com.film.service;

import java.util.List;

import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.dto.SubPostDTO;

public interface PostService {

	public List<PostDTO> getPostList();

	public List<MovieDTO> getMyMovie(String member_id);

	public void insertPost(PostDTO dto);

	public List<PostDTO> getMoviePostList();

	public PostDTO postdetail(int post_no);

	public void subpostadd(SubPostDTO dto);

//	public List<SubPostDTO> subdetail(int post_no);
	public List<SubPostDTO> subdetail(int startrow, int endrow);

	public void subDelete(int subno);

	public int subcount(int post_no);

	public void updatePost(PostDTO dto);

	public void postDelete(int post_no);

	public int getMyPostCount(String member_id);

	public List<PostDTO> getMyPostList(String member_id);
}
