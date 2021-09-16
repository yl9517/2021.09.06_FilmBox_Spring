package com.film.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.dto.KakaopayDTO;

@Controller
public class ReserveContorller {

	@GetMapping("/form")
	public String payform() {
		return "form";
	}
	
	@RequestMapping("/kakaojsp")
	public String kakaojsp(KakaopayDTO dto ,Model model) {
		model.addAttribute("dto",dto);
		return "kakao";
		
	}
	
//	@GetMapping("/success")
//	public String reserveSuccess() {
//		
//	}
//	
}
