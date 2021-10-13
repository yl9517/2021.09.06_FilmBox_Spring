package com.filmbox;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.film.dto.KakaopayDTO;
import com.film.dto.ScreenDTO;
import com.film.dto.SubPostDTO;
import com.film.dto.SubPostPage;
import com.film.mapper.PostMapper;
import com.film.mapper.ReserveMapper;
import com.film.service.PostService;
import com.film.service.ReserveService;
import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class resreveTest {

	@Autowired
	private HikariDataSource ds;

	@Autowired
	private PostService postservice;
	@Autowired
	private PostMapper mapper;
	@Test
	public void t1() {
		SubPostPage subpage = new SubPostPage(1, 6,5,5);
		List<SubPostDTO> sublist = postservice.subdetail(subpage.getStartRow(),subpage.getEndRow());
		System.out.println(sublist.toString());
		
	}
	
	
}
