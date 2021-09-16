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

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
    
    
    //영화 상세
    @GetMapping("/movieInfo/{movieCd}")
    public String movieInfo(@PathVariable String movieCd, Model model) {
    	
    	MovieDTO dto = service.getMovie(movieCd);
    	model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
    	model.addAttribute("dto",dto);
    	
    	return "movie/movieInfo";
    }
    
    
    //영화 상세2 
    @GetMapping("/movieInfo2/{movieCd}")
    public String requestAPI(@PathVariable String movieCd, Model model) {
    	String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
    	String AUTH_KEY = "03778b8e03b2f65d0d2c724260f2df8c";
        
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
                System.out.println("여기"+response.toString());
            }
        }catch (Exception e) {
			// 내일 고치기
		}
 
//            // JSON 객체로  변환
//            JSONObject responseBody = new JSONObject(response.toString());
// 
//            // 데이터 추출
//            JSONObject boxOfficeResult = responseBody.getJSONObject("movieInfoResult");         
//          
//            // 박스오피스 목록 출력
//            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("MovieInfo");
//            Iterator<Object> iter = dailyBoxOfficeList.iterator();
//            while(iter.hasNext()) {
//                JSONObject boxOffice = (JSONObject) iter.next();
//
//              map.put("movieNm", (String) boxOffice.get("movieNm"));
//              map.put("nationNm", (String) boxOffice.get("nationNm"));
//              map.put("showTm", (String) boxOffice.get("showTm"));
//              map.put("actors", (String) boxOffice.get("actors"));
//               
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        model.addAttribute("map",map);
        //영화 리스트삽입    
//      service.movieupdate(mvList);
//        String date=service.updatedate();
        
        
    	return "movie/movieInfo";
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
