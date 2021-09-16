package com.film.controller; 

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam;

import com.film.dto.UserDTO;
import com.film.login.NaverLoginBO;
import com.film.service.UserService;
import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller 
public class LoginController { 
	

	/* NaverLoginBO */ 
	private NaverLoginBO naverLoginBO; 
	private String apiResult = null; 
	
	@Autowired
	private UserService service;
	
	@Autowired 
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) { 
		this.naverLoginBO = naverLoginBO; } 
	
	//로그인 첫 화면 요청 메소드 
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
		System.out.println("네이버:" + naverAuthUrl); 

		model.addAttribute("url", naverAuthUrl); 
		
		return "login/login"; 
	} 
	
	//네이버 로그인 성공시 callback호출 메소드 
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("여기는 callback"); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state); 
		System.out.println(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		
		//1. 로그인 사용자 정보를 읽어온다. 
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		//2. String형식인 apiResult를 json형태로 바꿈 
		JSONParser parser = new JSONParser(); 
		Object obj = parser.parse(apiResult); 
		JSONObject jsonObj = (JSONObject) obj; 
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱 
		JSONObject response_obj = (JSONObject)jsonObj.get("response"); 
			
		String mobile= (String)response_obj.get("mobile"); 


		//4.파싱 모바일 세션으로 저장 
		session.setAttribute("sessionId",mobile); 

		String token=oauthToken.getAccessToken();
		System.out.println(token);
		//세션 생성
		model.addAttribute("result", apiResult); 
		
		///////
		String id= (String)response_obj.get("id");
		
		String name=(String)response_obj.get("name");
		//String birthyear=(String)response_obj.get("birthyear");
		String email=(String)response_obj.get("email");

		
		UserDTO dto=new UserDTO();

		dto.setMember_id(id);
		
		if(name==null)
			dto.setMember_name("");
		else
			dto.setMember_name(name);
			
		dto.setMember_pwd(token);
		
		if(mobile==null)
			dto.setMember_phone("");
		else
			dto.setMember_phone(mobile);

		if(email==null)
			dto.setEmail("");
		else
			dto.setEmail(email);
		
		service.insertUser(dto);

		return "login/login";
		} 
	
	//로그아웃 
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException { 
		System.out.println("여기는 logout"); 
		session.invalidate(); 
		return "redirect:index"; //login
   } 
	
	//index 페이지는 테스트용이므로 추후 수정 필요 시 수정
	@RequestMapping(value = "/index")
	public String index() {
		return "login/index";
	}
	
}




