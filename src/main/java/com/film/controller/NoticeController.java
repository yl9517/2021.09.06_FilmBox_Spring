package com.film.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@RequestMapping("/notice")
	public String userJoin(Model model)
	{
		model.addAttribute("page", "notice/noticelist.jsp");
		return "view";
	}
	
}
