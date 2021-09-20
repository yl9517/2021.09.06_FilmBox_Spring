package com.film.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
    	
    	return "movie/movieList";
    }
    
    
    //영화 상세 - view단에서 jsoㅜ으로 받기
    @GetMapping("/movieInfo/{movieCd}")
    public String movieInfo(@PathVariable String movieCd, Model model) {
    	
    	MovieDTO dto = service.getMovie(movieCd);
    	model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
    	model.addAttribute("dto",dto);
    	
    	return "movie/movieInfo";
    }
    
    
//    //영화 상세2 - java로 받기
//    @GetMapping("/movieInfo2/{movieCd}")
//    public String requestAPI(@PathVariable String movieCd, Model model) {
//    	String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
//    	String AUTH_KEY = "03778b8e03b2f65d0d2c724260f2df8c";
//        
//        // 변수 설정
//        //   - 요청(Request) 인터페이스 Map
//        Map<String, String> paramMap = new HashMap<String, String>();
//        paramMap.put("key"     , AUTH_KEY);      // 발급받은 인증키
//        paramMap.put("movieCd" , movieCd);   // 영화코드
//
//        Map<String, Object> map = new HashMap();
//        try {
//            // Request URL 연결 객체 생성
//            URL requestURL = new URL(REQUEST_URL+"?"+makeQueryString(paramMap));
//            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
// 
//            // GET 방식으로 요청
//            conn.setRequestMethod("GET");
//            conn.setDoInput(true);
// 
//            // 응답(Response) 구조 작성
//            //   - Stream -> JSONObject
//            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
//            String readline = null;
//            StringBuffer response = new StringBuffer();
//            while ((readline = br.readLine()) != null) {
//                response.append(readline);
//            }
//
//            // JSON 객체로  변환
//            JSONObject responseBody = new JSONObject(response.toString());
// 
//            // 데이터 추출
//            JSONObject result = responseBody.getJSONObject("movieInfoResult"); 
//            JSONObject movieInfo = result.getJSONObject("movieInfo");          
//          
//            map.put("movieNm", movieInfo.get("movieNm")); //영화명
//            map.put("showTm", movieInfo.get("showTm")); //상영시간
//            map.put("openDt", movieInfo.get("openDt")); //개봉일
//
//            JSONArray list1 = movieInfo.getJSONArray("genres"); //장르 -genreNm
//            JSONArray list2 = movieInfo.getJSONArray("directors"); //감독 -peopleNm
//            JSONArray list3 = movieInfo.getJSONArray("actors"); //배우 -peopleNm
//            JSONArray list4 = movieInfo.getJSONArray("audits"); //관람가 - watchGradeNm
//
//            map.put("acts", arrayMakeString(list1,"genreNm"));
//            map.put("acts", arrayMakeString(list2,"peopleNm"));
//            map.put("acts", arrayMakeString(list3,"peopleNm"));
//            map.put("acts", arrayMakeString(list4,"watchGradeNm"));
//            
//            
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("movieInfo",map);
//        
//    	MovieDTO dto = service.getMovie(movieCd);
//    	model.addAttribute("dto",dto);
//        
//    	return "movie/movieInfo";
//    }
    
  //영화 상세3 - java로 받기
    @GetMapping("/content")
    public @ResponseBody Map<String, Object> requestAPI3(@RequestParam String movieCd, Model model) {
    	String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
    	String AUTH_KEY = "03778b8e03b2f65d0d2c724260f2df8c";
        System.out.println("movieCd"+movieCd);
        // 변수 설정
        //   - 요청(Request) 인터페이스 Map
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"     , AUTH_KEY);      // 발급받은 인증키
        paramMap.put("movieCd" , movieCd);   // 영화코드

        Map<String, Object> map = new HashMap();
        try {
            // Request URL 연결 객체 생성
            URL requestURL = new URL(REQUEST_URL+"?"+makeQueryString(paramMap));
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
 
            // GET 방식으로 요청
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
 
            // 응답(Response) 구조 작성
            //   - Stream -> JSONObject
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String readline = null;
            StringBuffer response = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                response.append(readline);
            }

            // JSON 객체로  변환
            JSONObject responseBody = new JSONObject(response.toString());
 
            // 데이터 추출
            JSONObject result = responseBody.getJSONObject("movieInfoResult"); 
            JSONObject movieInfo = result.getJSONObject("movieInfo");          
 
            map.put("movieNm", movieInfo.get("movieNm")); //영화명
            map.put("movieNmEn", movieInfo.get("movieNmEn")); //영화명
            map.put("showTm", movieInfo.get("showTm")); //상영시간
            map.put("openDt", movieInfo.get("openDt")); //개봉일

            JSONArray list1 = movieInfo.getJSONArray("genres"); //장르 -genreNm
            JSONArray list2 = movieInfo.getJSONArray("directors"); //감독 -peopleNm
            JSONArray list3 = movieInfo.getJSONArray("actors"); //배우 -peopleNm
            JSONArray list4 = movieInfo.getJSONArray("audits"); //관람가 - watchGradeNm

            map.put("genres", arrayMakeString(list1,"genreNm"));
            map.put("directors", arrayMakeString(list2,"peopleNm"));
            map.put("actors", arrayMakeString(list3,"peopleNm"));
            map.put("audits", arrayMakeString(list4,"watchGradeNm"));
            
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }
    
    //json의 Array<Map>형식을 String으로 변환
    public String arrayMakeString(JSONArray array, String putNm) {
    	StringBuilder stringText = new StringBuilder();
        Iterator<Object> iter = array.iterator();
        
        //리스트
        while(iter.hasNext()) {
            JSONObject thisObject = (JSONObject) iter.next();
            stringText.append((thisObject.get(putNm)+" "));            
        }
       
        return stringText.toString();
    	
    }
    public String makeQueryString(Map<String, String> paramMap) {
        final StringBuilder sb = new StringBuilder();
 
        paramMap.entrySet().forEach(( entry )->{
            if( sb.length() > 0 ) {
                sb.append('&');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        });
 
        return sb.toString();
    }
    
}
