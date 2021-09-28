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
	
	@GetMapping("/success/{payMoney}/{movieCd}/{screenTime}/{reserveDate}/{ticketNumber}/{selectedSeat}")
	public String reserveSuccess(KakaopayDTO dto) {
		service.reserveinsert(dto);
//		System.out.println(dto.getSelectedSeat());
		List<KakaopayDTO> list = new ArrayList<KakaopayDTO>();
//		KakaopayDTO dto2= new KakaopayDTO(dto.getRev_no(),dto.getReserveDate(),dto.getScreenTime(),dto.getSelectedSeat());
		list.add(dto);
		for(int i=0; 1<list.size();i++) {
			System.out.println(list.get(i).getSelectedSeat());
		}
//		service.screeninsert(dto);
		service.screeninsert(list);
		return "redirect:/main";		
	}

	
}
