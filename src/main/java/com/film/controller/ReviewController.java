package com.film.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.service.ReviewService;

@Controller
public class ReviewController {
	
	@Resource(name="reviewservice")
	private ReviewService service;

	@PostMapping("reviewAction")
	public String reviewWriteAction(@RequestParam String reviewContent, Model model) {
		//아이디 세션으로 받기
		String loginId = "123";
		
		int result = service.insertReview();
		
		
		return "movie/movieInfo";
		
	}
}
