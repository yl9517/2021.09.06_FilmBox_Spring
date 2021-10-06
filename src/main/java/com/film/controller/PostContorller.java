package com.film.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ScreenDTO;
import com.film.dto.UserDTO;
import com.film.service.MovieService;
import com.film.service.PostService;
import com.film.service.ReserveService;
import com.film.service.UserService;

@Controller
public class PostContorller {
	@Resource(name = "movieservice")
	private MovieService service;

	@Resource(name = "reserveservice")
	private ReserveService reservice;

	@Autowired
	private UserService userservice;

	@Autowired
	private PostService postservice;

	@RequestMapping(value = "/post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postMovie(MovieDTO dto, Model model, HttpSession session) {

		List<PostDTO> list = postservice.getPostList();
		// 세션아이디 받기
		String member_id = (String) session.getAttribute("loginId");

		model.addAttribute("member_id", member_id);
		model.addAttribute("list", list);

		model.addAttribute("page", "post/postmovie.jsp");

		return "view";
	}
	@PostMapping("/mypost")
	public String mypost(MovieDTO dto, Model model, HttpSession session) {

		String member_id = (String) session.getAttribute("loginId");

	    List<MovieDTO> list = postservice.getMyMovie(member_id);
		String result = null;
		if (member_id == null) {
			result = "reserve/logincondition";
		} else {
			model.addAttribute("list", list);

			model.addAttribute("page", "post/mypost.jsp");

			result = "view";
		}
		return result;
	}
	@PostMapping("/postadd")
	public String mypostadd(PostDTO dto, Model model, HttpSession session) {

		List<PostDTO> list = postservice.getPostList();
		// 세션아이디 받기
		String member_id = (String) session.getAttribute("loginId");

		model.addAttribute("member_id", member_id);
		model.addAttribute("list", list);

		model.addAttribute("page", "post/postmovie.jsp");

		return "view";
	}
}