package com.film.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.MovieDTO;
import com.film.dto.ReviewDTO;
import com.film.service.MovieService;
import com.film.service.ReviewService;
import com.mysql.cj.Session;


@Controller
public class MovieController {
	@Resource(name = "movieservice")
	private MovieService service;
	
	@Resource(name = "reviewservice")
	private ReviewService reService;
	
    @GetMapping("/main")
    public String requestAPI(Model model) {
      
    	List<MovieDTO> list =  service.getMovieList();
    	
    	model.addAttribute("mvList",list);
    	return "main";
    }
    
	//영화리스트
    @GetMapping("/movieList")
    public String movieList(Model model) {
    	
    	List<MovieDTO> mvList = service.getMovieList();
    	model.addAttribute("mvList",mvList);
    	model.addAttribute("page","movie/movieList.jsp");
    	
     	return "view";
    }
    
    
    //영화 상세 상단 dto 
    @GetMapping("/movieInfo/{movieCd}")
    public String movieInfo(@PathVariable String movieCd,HttpSession session, Model model) {
    	//세션 로그인 담기
    	String member_id= "";
    	if((String)session.getAttribute("loginId") !=null)
    		member_id = (String)session.getAttribute("loginId"); //세션아이디 받기
    	
    	System.out.println(member_id);
    	MovieDTO dto = service.getMovie(movieCd);
    	ReviewDTO myreview = reService.getThisReview(new ReviewDTO(member_id, movieCd));
  
    	model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
    	model.addAttribute("dto",dto);
    	model.addAttribute("myreview",myreview);
    	
    	//비교날짜
	    	SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyy-MM-dd");
	    	Calendar cal = Calendar.getInstance();
	    	cal.setTime(new Date());
	        cal.add(Calendar.DATE, -7); //오늘부터 7일 전
    	String compare_date= DATE_FMT.format(cal.getTime());
    	model.addAttribute("compare_date",compare_date);
    	System.out.println("비교날짜 : "+compare_date);
    	System.out.println("업뎃 날짜 : "+dto.getUpdate_date());
    	
    	
    	model.addAttribute("page","movie/movieInfo.jsp");
    	
    	return "view";
    }
    
  
  //영화 상세 하단 ajax- java로 받기
    @GetMapping("/content")
    public @ResponseBody Map<String, Object> contentAPI(@RequestParam String movieCd) {

        Map<String, Object> map = service.contentAPI(movieCd);
        
        return map;
    }
 
    
}
