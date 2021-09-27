package com.film.controller;

import java.util.List;

import javax.annotation.Resource;

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
	public String reviewInsertAction(@ModelAttribute ReviewDTO dto, Model model) {
		dto.setMember_id("yerim9337"); //세션으로 받은 아이디 넣기


    	int result = service.insertReview(dto);
		
		
		return "movie/result";
		
	}
	
	
	@GetMapping("/getThisReview") //등록 된 리뷰 가져오기
	public @ResponseBody ReviewDTO getThisReview(@RequestParam String movieCd, @RequestParam String member_id){
		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id(member_id);
		
		return service.getThisReview(dto);
	}
	
	@PostMapping("/reviewModifyAction")
	public String reviewModifyAction(@ModelAttribute ReviewDTO dto, Model model) {
		dto.setMember_id("yerim9337"); //세션으로 받은 아이디 넣기

    	int result = service.modifyReview(dto);		
		
		return "movie/result";		
	}
	
	@GetMapping("/reviewDeleteAction/{movieCd}")
	public String reviewDeleteAction(@PathVariable String movieCd) {
		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id("yerim9337");  //세션으로 받은 아이디 넣기
		
		service.deleteReview(dto);

		return "movie/result";		
	}
	
	@GetMapping("/reveiwList")
	public @ResponseBody List<ReviewDTO> reviewList(@RequestParam String movieCd,@RequestParam String member_id) {

		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id(member_id);
		List<ReviewDTO> list = service.getReviewList(dto);

		return list;
	}
	
	@GetMapping("/reveiwList2")
	public String reviewList2(@RequestParam String movieCd,@RequestParam String member_id, Model model) {
		System.out.println("review"+movieCd);
		ReviewDTO dto = new ReviewDTO();
		dto.setMovieCd(movieCd);
		dto.setMember_id(member_id);
		List<ReviewDTO> list = service.getReviewList(dto);
		
		model.addAttribute("list",list);
		return "movie/result";	
	}
	
}
