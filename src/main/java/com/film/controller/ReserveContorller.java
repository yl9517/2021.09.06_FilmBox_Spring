package com.film.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.ReserveDTO;
import com.film.service.MovieService;
import com.film.service.ReserveService;

@Controller
public class ReserveContorller {
	@Resource(name = "movieservice")
	private MovieService service;


	@Resource(name = "reserveservice")
	private ReserveService reservice;
	
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
		return "movie/seatchoice";
	}
	
	
	@GetMapping("/form")
	public String payform() {
		return "form";
	}
	
	@RequestMapping("/kakaojsp")
	public String kakaojsp(KakaopayDTO dto ,Model model) {
		model.addAttribute("dto",dto);
		return "kakao/kakao";
		
	}
	
	@GetMapping("/success/{payMoney}/{movieCd}/{screenTime}/{reserveDate}/{ticketNumber}/{selectedSeat}")
	public String reserveSuccess(KakaopayDTO dto) {
		reservice.reserveinsert(dto);
		System.out.println("좌석"+dto.getSelectedSeat());
		String[] seats = dto.getSelectedSeat().split(",");
		
//		List<KakaopayDTO> list = new ArrayList<KakaopayDTO>();
//		KakaopayDTO dto2= new KakaopayDTO(dto.getRev_no(),dto.getReserveDate(),dto.getScreenTime(),dto.getSelectedSeat());
//		list.add(dto);
		for(int i=0; 1<seats.length;i++) {
			System.out.println(seats[i]);
		}
//		service.screeninsert(dto);
		reservice.screeninsert(dto);
		return "redirect:/main";		
	}

	
}
