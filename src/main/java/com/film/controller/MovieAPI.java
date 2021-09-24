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
        // 변수설정
        //   - 일주일 전 영화데이터 가져오기 (가장 최근데이터임. 실제 이번주껀 아직 없음)
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.DATE, -7);
        
        
        // 변수 설정
        //   - 요청(Request) 인터페이스 Map
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"          , AUTH_KEY);                        // 발급받은 인증키
        paramMap.put("targetDt"     , DATE_FMT.format(cal.getTime()));  // 조회하고자 하는 날짜
        paramMap.put("weekGb"  , "0");                         			// 주간
        paramMap.put("itemPerPage"  , "10");                            // 결과 ROW 의 개수( 최대 10개 )

        List<MovieDTO> mvList = new ArrayList<MovieDTO>();
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
            JSONObject boxOfficeResult = responseBody.getJSONObject("boxOfficeResult");
 
//            // 박스오피스 주제 출력
//            String boxofficeType = boxOfficeResult.getString("boxofficeType");
//            System.out.println(boxofficeType);
            
          
            // 박스오피스 목록 출력
            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("weeklyBoxOfficeList");
            Iterator<Object> iter = dailyBoxOfficeList.iterator();
            while(iter.hasNext()) {
                JSONObject boxOffice = (JSONObject) iter.next();
                
                String rank = (String) boxOffice.get("rank");
                String movieCd = (String) boxOffice.get("movieCd");
                String movieNm = (String) boxOffice.get("movieNm");
                String openDt = (String) boxOffice.get("openDt");
                String image = getImg(movieNm);
                
                MovieDTO dto = new MovieDTO(rank, movieCd, movieNm, openDt, image);
                mvList.add(dto);
               
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("mvList",mvList);
        //영화 리스트삽입    
//      service.movieupdate(mvList);
//        String date=service.updatedate();
        
        
    	return "main";
    }
    
    //네이버 영화 검색api에서 이미지 가져오기
    public static String getImg(String title) {
        String clientId = "HYX4a9ygamLFJItnu0gY"; 
        String clientSecret = "vIJnIW_G5B";

        String text = null;
        try {
            text = URLEncoder.encode(title, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text;    // json


        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
      //  System.out.println(responseBody);
  
      
        //추가
        String image = "";
        try {
        	JSONParser parser = new JSONParser();
			Object obj = parser.parse(responseBody);
			
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) obj;
			org.json.simple.JSONArray getArray = (org.json.simple.JSONArray) jsonObj.get("items");
			
			
//		   for (int i = 0; i < getArray.size(); i++) {
                org.json.simple.JSONObject object = (org.json.simple.JSONObject) getArray.get(0);

                String getTitle = (String) object.get("title");
                image = (String) object.get("image");
 
//            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
       return image;
       
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
 
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
        	
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }
            
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
 
