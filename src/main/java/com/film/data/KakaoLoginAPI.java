package com.film.data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.core.io.ClassPathResource;

public class KakaoLoginAPI {

	//액세스 토큰 받아오기
	public String getAccessToken(String code) throws Exception {
		// TODO Auto-generated method stub
		String access_token="";
		String refresh_token="";
		String requestUrl="https://kauth.kakao.com/oauth/token";
		
		//properties 불러오기
		ClassPathResource resource= new ClassPathResource("login.properties");
		Properties prop = new Properties();
		prop.load(resource.getInputStream());

		//서버에 액세스 토큰 요청하기 
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			String grant_type= "authorization_code";
			String client_id = prop.getProperty("client_id");
			String redirect_uri = "http://localhost:8080/kakaologin";

			//요청할때 보내야할 데이터 4가지
			sb.append("grant_type="+grant_type);
			sb.append("&client_id="+client_id);
			sb.append("&redirect_uri="+redirect_uri);
			sb.append("&code="+code);

			bw.write(sb.toString());
			bw.flush();
			int responseCode = conn.getResponseCode();
			System.out.println("response_code : "+responseCode);	//200(성공)

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while((line = br.readLine())!=null)
			{
				result+=line;
			}
			System.out.println("response body : "+result);
			JSONParser parser = new JSONParser();
			//Json 객체로 만들기
			JSONObject jobject = (JSONObject) parser.parse(result);
			access_token = (String) jobject.get("access_token");
			refresh_token = (String) jobject.get("refresh_token");

			br.close();
			bw.close();

		}catch(Exception e) {
			System.out.println(e);
		}
		return access_token;
	}

	//사용자 정보 가져오기
	public Map<String, Object> getUserInfo(String access_token) {
		// TODO Auto-generated method stub
		Map<String, Object> userData = new HashMap<String, Object>();

		String requestUrl = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+access_token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+responseCode);	//200

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while((line = br.readLine())!=null)
			{
				result+=line;
			}
			System.out.println("response body : "+result);
			JSONParser parser = new JSONParser();
			//Json 객체로 만들기
			JSONObject jobject = (JSONObject) parser.parse(result);
			System.out.println(jobject);
			
			String id="";
			String nickname = "";
			String email = "";
			
			
			JSONObject properties = (JSONObject) jobject.get("properties");
			JSONObject kakao_account = (JSONObject) jobject.get("kakao_account");
			
			id= String.valueOf(jobject.get("id"));
			nickname = (String) properties.get("nickname");
			email = (String) kakao_account.get("email");
			System.out.println(id);
			System.out.println(properties);
			System.out.println(kakao_account);
			
			userData.put("id", id);
			userData.put("nickname", nickname);
			userData.put("email", email);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return userData;
	}

	public void kakaologout(String attribute) {
		// TODO Auto-generated method stub
		String requestUrl = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+attribute);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : "+responseCode);	
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while((line = br.readLine())!=null)
			{
				result+=line;
			}
			System.out.println("response body : "+result);
			
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

}