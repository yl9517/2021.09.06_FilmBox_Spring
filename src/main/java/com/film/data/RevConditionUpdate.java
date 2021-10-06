package com.film.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.film.service.ReserveService;

@Component
public class RevConditionUpdate {
	@Autowired
	private ReserveService service;
	

//	@Scheduled(fixedRate = 10000)
	@Scheduled(cron = "10 0 10,12,14,18 * * ?") //아무요일 매월 매일 10,12..시 10초마다
	public void updateList() {
		System.out.println("테스트");
		service.updateCondition();
	}
	
}
