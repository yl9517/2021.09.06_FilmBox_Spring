package com.film.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.film.service.CouponService;
import com.film.service.ReserveService;

@Component
public class ConditionUpdate {
	@Autowired
	private ReserveService service;
	
	@Autowired
	private CouponService couservice;
	
	//예매 상태 업데이트
	
//	@Scheduled(fixedRate = 10000)
	@Scheduled(cron = "10 0 10,12,14,18 * * ?") //아무요일 매월 매일 10,12..시 10초마다
	public void updateList() {
		service.updateCondition();
	}
	
	//쿠폰 상태 업데이트
	@Scheduled(cron = "1 0 0 * * ?") //아무요일 매월 매일 0시 1초마다
	public void updateCoupon() {
		couservice.updateCouponCon();
	}
}
