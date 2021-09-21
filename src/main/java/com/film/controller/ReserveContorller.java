package com.film.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.ReserveDTO;
import com.film.service.MovieService;

@Controller
public class ReserveContorller {
	@Resource(name = "movieservice")
	private MovieService service;

	@GetMapping("/reservemovie/{movieCd}/{movieNm}")
    public String movieInfo(@PathVariable String movieCd,@PathVariable String movieNm, Model model) {
    	
    	MovieDTO dto = service.getMovie(movieCd);
    	model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
    	model.addAttribute("dto",dto);
    	
    	return "movie/movieRes";
    }
	
	@PostMapping("/seatchoice")
	public String seatchoice(ReserveDTO dto, Model model) {

		model.addAttribute("reserve", dto);
		return "seatchoice";
	}
	
	
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
