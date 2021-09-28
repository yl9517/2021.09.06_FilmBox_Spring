package com.film.service;

import java.util.List;
import java.util.Map;

import com.film.dto.MovieDTO;

public interface MovieService {

	public List<MovieDTO> getMovieList();
	public void movieinsert(List<MovieDTO> mvList);
	public String updatedate();
	public MovieDTO getMovie(String movieCd); //영화 상세 가져오기
	public void movieupdate(List<MovieDTO> mvList);
	public Map<String, Object> contentAPI(String movieCd);
	
	public void updateList();
	public List<MovieDTO> getSearchMovieList(String movieNm);
}
