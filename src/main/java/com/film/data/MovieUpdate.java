package com.film.data;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.film.service.MovieService;

@Component
public class MovieUpdate {
	@Resource(name = "movieservice")
	private MovieService service;
	
//	@Scheduled(fixedRate = 10000) // 테스트

    @Scheduled(cron = "0 0 1 ? * MON") //매월 매주 월요일, 아무날짜나 오전 1시
	public void updateList() {
		service.updateList();
	}
}
