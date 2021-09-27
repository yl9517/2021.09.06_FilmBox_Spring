package com.film.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.MovieDTO;
import com.film.service.MovieService;


@Controller
public class MovieController {
	@Resource(name = "movieservice")
	private MovieService service;
	
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
    public String movieInfo(@PathVariable String movieCd, Model model) {
    	
    	MovieDTO dto = service.getMovie(movieCd);
    	model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
    	model.addAttribute("dto",dto);
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
