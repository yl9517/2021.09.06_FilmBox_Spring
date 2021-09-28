package com.film.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.ReviewDTO;
import com.film.service.ReviewService;

@Controller
public class ReviewController {
	
	@Resource(name="reviewservice")
	private ReviewService service;
	

	@PostMapping("/reviewInsertAction")
	public String reviewInsertAction(@ModelAttribute ReviewDTO dto, HttpSession session) {
		
		String member_id=(String)session.getAttribute("loginId"); //세션아이디 받기
		dto.setMember_id(member_id); 

    	int result = service.insertReview(dto);
		
		return "redirect:/movieInfo/"+dto.getMovieCd();
		
	}
	
	
	@GetMapping("/getThisReview") //등록 된 리뷰 가져오기
	public @ResponseBody ReviewDTO getThisReview(@RequestParam String movieCd, @RequestParam String member_id){
		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id(member_id);
		
		return service.getThisReview(dto);
	}
	
	@PostMapping("/reviewModifyAction")
	public String reviewModifyAction(@ModelAttribute ReviewDTO dto, HttpSession session) {
		String member_id=(String)session.getAttribute("loginId"); //세션아이디 받기
		dto.setMember_id(member_id); 
		
    	int result = service.modifyReview(dto);		
	
		return "redirect:/movieInfo/"+dto.getMovieCd();		
	}
	
	@GetMapping("/reviewDeleteAction/{movieCd}")
	public String reviewDeleteAction(@PathVariable String movieCd,  HttpSession session) {
		ReviewDTO dto = new ReviewDTO();
	
		String member_id=(String)session.getAttribute("loginId"); //세션아이디 받기
		dto.setMember_id(member_id); 
		
		dto.setMovieCd(movieCd);
		service.deleteReview(dto);

		return "redirect:/movieInfo/"+movieCd;	
	}
	
	@GetMapping("/reveiwList")
	public @ResponseBody List<HashMap<String, Object>> reviewList(@RequestParam String movieCd,@RequestParam String member_id) {

		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id(member_id);
		List<HashMap<String, Object>> list = service.getReviewList(dto);

		return list;
	}

	
}
