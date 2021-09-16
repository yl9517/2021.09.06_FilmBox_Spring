package com.film.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dto.MovieDTO;
import com.film.mapper.MovieMapper;

@Service(value = "movieservice")
public class MovieServiceImple implements MovieService {

	@Autowired
	private MovieMapper mvMapper;
	
	@Override
	public List<MovieDTO> getMovieList() {
		return mvMapper.getMovieList();
	}

	@Override
	public void movieinsert(List<MovieDTO> mvList) {
		// TODO Auto-generated method stub
		mvMapper.movieinsert(mvList);
	}

	@Override
	public String updatedate() {
		// TODO Auto-generated method stub
		return mvMapper.updatedate();
	}

	
	public MovieDTO getMovie(String movieCd) {
		return mvMapper.getMovie(movieCd);
	}
	@Override
	public void movieupdate(List<MovieDTO> mvList) {
		// TODO Auto-generated method stub
		mvMapper.movieupdate(mvList);
		
	}

	

}
