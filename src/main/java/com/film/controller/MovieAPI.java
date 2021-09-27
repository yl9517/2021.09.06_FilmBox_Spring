package com.film.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.dto.MovieDTO;
import com.film.service.MovieService;


@Controller
public class MovieAPI {
	
	@Resource(name = "movieservice")
	private MovieService service;
	
    private final String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json";
    private final String AUTH_KEY = "03778b8e03b2f65d0d2c724260f2df8c";
    private final SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");  //날짜형식
 
    // API요청
    @GetMapping("/main")
    public String requestAPI(Model model) {
      
    	List<MovieDTO> list =  service.getMovieList();
    	
    	model.addAttribute("mvList",list);
    	return "main";
    }
 
}
 
