package com.filmbox;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.film.dto.MovieDTO;
import com.film.mapper.MovieMapper;
import com.film.mapper.ProMapper;
import com.film.service.MovieService;
import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class MovieTest {
	@Autowired
	private MovieService service;

	@Autowired
	private MovieMapper mapper;
	
	
//	@Test
//	public void t1() {
//		MovieDTO dto = new MovieDTO("1", "1", "1", "1", "1");
//		assertEquals(0, service.getMovieList());
//	}
//	
//	@Test 
//	public void t2() {
//		System.out.println(mapper.updatedate());
//	}
	
	@Test 
	public void t3() {
		assertNotNull(service);
		System.out.println(mapper.updatedate());
	}
	
	@Test
	public void t0915() {
	//	assertNotNull(service.getMovie("20190280"));
		assertEquals("3",service.getMovie("20192194").getRank());
	}
	

}
