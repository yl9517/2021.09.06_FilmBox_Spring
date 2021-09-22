package com.film.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.UserDTO;
import com.film.service.UserService;



@Controller
public class UserContoller {

	//private static final Logger logger = LoggerFactory.getLogger(UserContoller.class);

	@Autowired
	private UserService service;

	//회원가입 페이지
	@RequestMapping("/join")
	public String userJoin()
	{
		return "login/join";
	}

	//회원가입 환영 페이지
	@RequestMapping("/joinresult")
	public String joinresult(Model model, UserDTO dto)
	{
		service.insertFilmUser(dto);
		model.addAttribute("member_name", dto.getMember_name());
		return "login/joinresult";
	}

	@RequestMapping(value = "/useridcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String member_id)
	{
		int result=service.idcheck(member_id);

		if(result!=0)
			return "fail";
		else
			return "success";

	}

	//마이페이지
	@RequestMapping("/mypage")
	public String goMyPage()
	{
		return "mypage";
	}
	//마이페이지>내 포인트 내역
	@RequestMapping("/mypointlist")
	public String mypointlist()
	{
		return "user/mypointlist";
	}
	//마이페이지>회원정보수정
	@RequestMapping("/myinfo")
	public String myinfo()
	{
		return "user/myinfo";
	}
	//마이페이지>나의 필름스토리
	@RequestMapping("/myfilmstory")
	public String myfilmstory()
	{
		return "user/myfilmstory";
	}
	//마이페이지>my예매내역
	@RequestMapping("/myreservelist")
	public String myreservelist()
	{
		return "user/myreservelist";
	}
	
}
