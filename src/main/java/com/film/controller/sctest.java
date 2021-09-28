package com.film.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class sctest {

	@Scheduled(fixedRate = 60000)
	public void test() {
		System.out.println("test");
	}
}

