package com.film.controller;

import java.util.HashMap;

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
//		int rev_no=service.reserveinsert(dto);
//		KakaopayDTO dto2 = new KakaopayDTO();
//		dto2.setRev_no(rev_no);
//		dto2.setScreenTime(dto.getScreenTime());
//		dto2.setReserveDate(dto.getReserveDate());
//		dto2.setSelectedSeat(dto.getSelectedSeat());
		service.reserveinsert(dto);
//		dto.setRev_no(rev_no);
		System.out.println(dto.getRev_no());
		service.screeninsert(dto);
		return "redirect:/main";		
	}
//	@GetMapping("/success/{payMoney}/{movieCd}/{screenTime}/{reserveDate}/{ticketNumber}/{selectedSeat}")
//	public String reserveSuccess(@PathVariable int payMoney,@PathVariable String movieCd,@PathVariable String screenTime
//			,@PathVariable String reserveDate,@PathVariable String ticketNumber,@PathVariable String selectedSeat) {
//		HashMap<String, Object> hm= service.reserveinsert(ticketNumber,movieCd,payMoney);
//		return "redirect:/main";		
//	}
//	@GetMapping("/success/{dto}")
//	public String reserveSuccess(KakaopayDTO dto) {
//		service.reserveinsert(dto);
//		return "redirect:/main";
//	}
	
}
