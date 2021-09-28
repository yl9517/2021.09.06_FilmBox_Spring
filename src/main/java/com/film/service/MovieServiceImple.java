package com.film.service;

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

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.mapper.MovieMapper;

@Service(value = "movieservice")
public class MovieServiceImple implements MovieService {

	@Autowired
	private MovieMapper mvMapper;
	
	@Override
	public List<MovieDTO> getMovieList() {
		return mvMapper.getMovieList();
	}
	@Override
	public void movieinsert(List<MovieDTO> mvList) {
		mvMapper.movieinsert(mvList);
	}
	@Override
	public String updatedate() {
		return mvMapper.updatedate();
	}
 	@Override
	public MovieDTO getMovie(String movieCd) {
		return mvMapper.getMovie(movieCd);
	}
	@Override
	public void movieupdate(List<MovieDTO> mvList) {
		mvMapper.movieupdate(mvList);
		
	}
	@Override
	public List<MovieDTO> getSearchMovieList(String movieNm) {
		return mvMapper.getSearchMovieList(movieNm);
	}
	@Override
	public void reserveinsert(KakaopayDTO dto) {
		// TODO Auto-generated method stub
		mvMapper.reserveinsert(dto);
	}
	
	@Override
	public void screeninsert(List<KakaopayDTO> list) {
		// TODO Auto-generated method stub
		mvMapper.screeninsert(list);
	}
	
//	@Override
//	public void screeninsert(KakaopayDTO dto) {
//		// TODO Auto-generated method stub
//		mvMapper.screeninsert(dto);
//	}
	/* 영화 주간데이터 - 영화제목, 박스오피스, 누적관객, 이미지, 개봉일 */ 
	public void updateList() {
		System.out.println("serviece에서 동작");
		String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json";
    	String AUTH_KEY = "03778b8e03b2f65d0d2c724260f2df8c";
        SimpleDateFormat DATE_FMT = new SimpleDateFormat("yyyyMMdd");  //날짜형식
        
        
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
          
            // 박스오피스 목록 출력
            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("weeklyBoxOfficeList");
            Iterator<Object> iter = dailyBoxOfficeList.iterator();
            while(iter.hasNext()) {
                JSONObject boxOffice = (JSONObject) iter.next();
                
                String rank = (String) boxOffice.get("rank");
                String movieCd = (String) boxOffice.get("movieCd");
                String movieNm = (String) boxOffice.get("movieNm");
                String openDt = (String) boxOffice.get("openDt");
                String audiAcc = (String) boxOffice.get("audiAcc");
                String image = getImg(movieNm);
                
                MovieDTO dto = new MovieDTO(rank, movieCd, movieNm, openDt,audiAcc, image);
                mvList.add(dto);
               
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        mvMapper.updateList(mvList);

    }
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
      
        //추가
        String image = "";
        try {
        	JSONParser parser = new JSONParser();
			Object obj = parser.parse(responseBody);
			
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) obj;
			org.json.simple.JSONArray getArray = (org.json.simple.JSONArray) jsonObj.get("items");
			
			
//		   for (int i = 0; i < getArray.size(); i++) {
			if(getArray.size()>=1) {
                org.json.simple.JSONObject getImg = (org.json.simple.JSONObject) getArray.get(0);

                image = (String) getImg.get("image");
			}else {
                image = "https://www.flaticon.com/authors/freepik";  	
			}
 //            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
       return image;
       
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
	
	/* 영화 상세 - 영화영문명, 영화정보 */
	@Override
	public Map<String, Object> contentAPI(String movieCd) {
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
            
            String plotText = findPlotText(movieInfo.get("movieNm"), movieInfo.get("openDt")); //줄거리
            map.put("plotText", plotText);
           
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
    //영화줄거리 찾기
	public String findPlotText(Object title,Object openDt)  throws IOException {
    	String kmdb_URL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&";
    	String kmdb_KEY = "S1D06L56GRZ75O59WO9M";
		/*URL*/
		StringBuilder urlBuilder = new StringBuilder(kmdb_URL);
		/*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8")+"="+kmdb_KEY);
		/*제목*/
		urlBuilder.append("&" + URLEncoder.encode("title","UTF-8")	+ "=" + URLEncoder.encode((String)title, "UTF-8"));
		/*개봉일*/
		urlBuilder.append("&" + URLEncoder.encode("releaseDts","UTF-8")	+ "=" + URLEncoder.encode((String)openDt, "UTF-8"));
		
		URL url = new URL(urlBuilder.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line); 
		}
		
		rd.close();
		conn.disconnect();
		
	    // JSON 객체로  변환
	    JSONObject responseBody = new JSONObject(sb.toString());
	    
	    //줄거리 뽑아내기..
	   JSONArray boxOfficeResult = responseBody.getJSONArray("Data");
	   JSONObject result = boxOfficeResult.getJSONObject(0).getJSONArray("Result").getJSONObject(0);
	   JSONObject plot = result.getJSONObject("plots").getJSONArray("plot").getJSONObject(0);
	   String plotText = (String) plot.get("plotText");
	    
	    return plotText;
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
