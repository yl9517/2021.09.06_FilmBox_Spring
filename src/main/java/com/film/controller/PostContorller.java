package com.film.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.PostDTO;
import com.film.dto.ProductDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ScreenDTO;
import com.film.dto.SubPostDTO;
import com.film.dto.SubPostPage;
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
	private PostService postservice;

	@RequestMapping(value = "/post", method = { RequestMethod.GET, RequestMethod.POST })
	public String postMovie(MovieDTO dto, Model model, HttpSession session) {

		List<PostDTO> list = postservice.getPostList();
		List<PostDTO> postlist = postservice.getMoviePostList();
		// 세션아이디 받기
		String member_id = (String) session.getAttribute("loginId");

		model.addAttribute("id", member_id);
		model.addAttribute("list", list);
		model.addAttribute("postlist", postlist);

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
		model.addAttribute("dto",dto);
		model.addAttribute("list", list);

		model.addAttribute("page", "post/postadd.jsp");

		return "view";
	}
	
	
	@RequestMapping(value = "/postinsert", method = {  RequestMethod.POST })
	public String result (@RequestParam(value="member_id",required = false) String member_id
			  ,@RequestParam(value="post_content",required = false) String post_content
			  ,@RequestParam(value="movieNm",required = false) String movieNm
			  ,@RequestParam(value="image",required = false) MultipartFile file
			  , HttpServletRequest request, Model model) throws  IOException {

		String uploadDir = request.getRealPath("");
		
		
		String filename = "/resources/upload/"+file.getOriginalFilename();	
		
		String filePath = uploadDir+"\\"+filename;
		
		file.transferTo(new File(filePath));
		
		PostDTO dto = new PostDTO(member_id,post_content,movieNm,filename);
		
		postservice.insertPost(dto);
		return "redirect:/post";
	}
	@RequestMapping("/postdetail/{post_no}")
	public String postdetail(@RequestParam(required = false,defaultValue ="1")  int currPage,
			@PathVariable int post_no, Model model, HttpSession session) {
		int subcount= postservice.subcount(post_no);
		PostDTO dto = postservice.postdetail(post_no);
		String member_id = (String) session.getAttribute("loginId");
		
		int pagesize=5;
		int blocksize=5;
		
		SubPostPage subpage = new SubPostPage(currPage, subcount,pagesize,blocksize);

		List<SubPostDTO> sublist = postservice.subdetail(post_no,subpage.getStartRow(),subpage.getEndRow());
		model.addAttribute("dto",dto);
		model.addAttribute("subcount",subcount);
		model.addAttribute("member_id",member_id);
		model.addAttribute("sublist",sublist);
		model.addAttribute("subpage",subpage);
		model.addAttribute("post_no",post_no);
		model.addAttribute("page","post/postDetail.jsp");
		
		return "view";
	}
	
	@PostMapping("/subpostinsert")
	public String subpostadd(SubPostDTO dto,Model model, HttpSession session) {
		postservice.subpostadd(dto);
		
		return "redirect:/postdetail/"+dto.getPost_no();
		
	}
	@GetMapping("/subDelete/{subno}/{post_no}")
	public String subDelete(@PathVariable int subno,@PathVariable int post_no, Model model, HttpSession session){
		postservice.subDelete(subno);
		return "redirect:/postdetail/"+post_no;
	}
	@GetMapping("/postModify/{post_no}")
	public String postModify(@PathVariable int post_no, Model model, HttpSession session) {

		PostDTO dto = postservice.postdetail(post_no);
		String member_id = (String) session.getAttribute("loginId");

		model.addAttribute("member_id", member_id);
		model.addAttribute("dto",dto);
		model.addAttribute("page", "post/postmodify.jsp");

		return "view";
	}
	@RequestMapping(value = "/postmodifyresult", method = {  RequestMethod.POST })
	public String postmodifyresult (@RequestParam(value="member_id",required = false) String member_id
				,@RequestParam(value="post_no",required = false) int post_no
				,@RequestParam(value="post_content",required = false) String post_content
				,@RequestParam(value="movieNm",required = false) String movieNm
				,@RequestParam(value="image",required = false) MultipartFile file
			  	, HttpServletRequest request, Model model) throws  IOException {

		String uploadDir = request.getRealPath("");
		
		
		String filename = "/resources/upload/"+file.getOriginalFilename();	
		
		String filePath = uploadDir+"\\"+filename;
		
		file.transferTo(new File(filePath));
		
		PostDTO dto = new PostDTO(member_id,post_content,movieNm,filename,post_no);
		
		postservice.updatePost(dto);
		return "redirect:/post";
	}

	@GetMapping("/postDelete/{post_no}")
	public String postDelete(@PathVariable int post_no, Model model, HttpSession session){
		postservice.postDelete(post_no);
		return "redirect:/post";
	}
}