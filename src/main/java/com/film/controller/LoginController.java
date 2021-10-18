package com.film.controller; 

import java.beans.Encoder;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam;

import com.film.data.KakaoLoginAPI;
import com.film.data.NaverLoginBO;
import com.film.data.PwdMail;
import com.film.dto.UserDTO;
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
	@RequestMapping(value = "/login") 
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */ 

		if(session.getAttribute("loginId")!=null)
		{
			return "redirect:/";
		}else {
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session); 
			model.addAttribute("url", naverAuthUrl); 
			model.addAttribute("page", "login/login.jsp");
			return "view";
		}
	} 


	//네이버 로그인 성공시 callback호출 메소드 
	@RequestMapping(value = "/callback")
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {

		OAuth2AccessToken oauthToken; 
		oauthToken = naverLoginBO.getAccessToken(session, code, state); 

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
		String id= (String)response_obj.get("id");
		String name=(String)response_obj.get("name");
		String email=(String)response_obj.get("email");

		//4.파싱세션으로 저장 
		session.setAttribute("loginId", id);

		String token=oauthToken.getAccessToken();

		model.addAttribute("result", apiResult); 

		//DB 저장
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
		
		dto.setLogin_type("SNS");
		service.insertUser(dto);
		
		//세션에 login_type 저장
		UserDTO dto2 = service.userDetail(id);
		session.setAttribute("logintype", dto2.getLogin_type());

		return "redirect:login";
	} 

	//loginresult
	@PostMapping("/loginresult")
	public String loginresult(Model model, UserDTO dto, HttpSession session)
	{
		BCryptPasswordEncoder bcryptPasswordEncoder=new BCryptPasswordEncoder();
		String url="";

		if(session.getAttribute("loginId")!=null)
		{
			session.removeAttribute("loginId");
		}

		UserDTO getuser=service.getUser(dto);
		
         if(getuser!=null && bcryptPasswordEncoder.matches(dto.getMember_pwd(),  getuser.getMember_pwd()))
        {

			 session.setAttribute("loginId", getuser.getMember_id());
			 url="redirect:/";
		}else
		{
			url="redirect:login";
		}

		return url;
	}


	//로그아웃 
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {  
		session.invalidate(); 
		return "redirect:/";
	} 

	//-------------kakao---------------------
	@RequestMapping("/kakaologinview")
	public String kakaologinurl() throws Exception
	{
		//properties 불러오기
		ClassPathResource resource= new ClassPathResource("login.properties");
		Properties prop = new Properties();
		prop.load(resource.getInputStream());
		String url_data_1 = "https://kauth.kakao.com/oauth/authorize?client_id=";
		String url_data_2 = prop.getProperty("client_id");
		String url_data_3 = "&redirect_uri=http://localhost:8080/kakaologin&response_type=code";
		String url = url_data_1+url_data_2+url_data_3;
		
		return "redirect:"+url;
		
	}


	@GetMapping("/kakaologin")
	public String kakaoCallback(@RequestParam String code
			, HttpSession session) throws Exception
	{
		KakaoLoginAPI api = new KakaoLoginAPI();
		//인증 코드 요청 전달해서 사용자 액세스 토큰 값 받아오기
		String access_token = api.getAccessToken(code);

		//액세스 토큰 전달해서 사용자 정보 받아오기 hashmap으로
		Map<String, Object> userData = api.getUserInfo(access_token);

		UserDTO dto=new UserDTO();

		String id = userData.get("id").toString();
		String pwd = UUID.randomUUID().toString();
		String name = userData.get("nickname").toString();
		String phone = "";
		String email = userData.get("email").toString();
		if(userData.get("email")==null)
		{
			dto.setEmail("");
		}else {
			dto.setEmail(email);
		}

		dto.setMember_id(id);
		dto.setMember_pwd(pwd);
		dto.setMember_name(name);
		dto.setMember_phone(phone);	
		dto.setLogin_type("SNS");

		//회원가입+로그인 동시에
		service.insertUser(dto);

		//세션에 login_type 저장
		UserDTO dto2 = service.userDetail(id);
		
		//세션에 담기 (이메일 정보 or 아이디, 액세스 토큰)
		if(userData.get("id")!=null) {
			session.setAttribute("member_name", userData.get("nickname"));
			session.setAttribute("member_id", userData.get("id"));
			session.setAttribute("access_token", access_token);
			
			session.setAttribute("logintype", dto2.getLogin_type());
			session.setAttribute("loginId", userData.get("id"));

		}

		return "redirect:/";
	}

	//사용 보류
//	@GetMapping("/kakaologout")
//	public String klogout(HttpSession session)
//	{
//		KakaoLoginAPI api = new KakaoLoginAPI();
//		api.kakaologout((String)session.getAttribute("access_token"));
//		session.removeAttribute("access_token");
//		session.removeAttribute("member_id");
//		session.removeAttribute("sessionId");
//
//		return "redirect:index";
//	}

	//아이디 찾기
	@GetMapping("/finduserid")
	public String finduserid(Model model)
	{
		model.addAttribute("page","login/finduserid.jsp");
		return "view";
	}

	//아이디 찾기 결과
	@PostMapping("/finduseridresult")
	public String finduseridresult(@RequestParam String email, Model model)
	{
		String member_id = service.finduserid(email);
		if(member_id!=null) 
		{
			UserDTO dto = service.userDetail(member_id);
			model.addAttribute("login_type", dto.getLogin_type());
		}
		model.addAttribute("member_id", member_id);
		
		model.addAttribute("page","login/finduseridresult.jsp");
		return "view";
	}


	//비밀번호 찾기
	@GetMapping("/finduserpwd")
	public String finduserpwd(Model model)
	{
		model.addAttribute("page","login/finduserpwd.jsp");
		return "view";
	}		

	//비밀번호 찾기 결과
	@PostMapping("/finduserpwdresult")
	public String finduserpwdresult(@RequestParam String email, Model model) throws Exception
	{
		//비밀번호 암호화
		BCryptPasswordEncoder bcryptPasswordEncoder=new BCryptPasswordEncoder();
		
		//이메일이 등록된 이메일인지 확인해서 member_id
		String member_id = service.finduserid(email);
		if(member_id!=null)
		{
			UserDTO dto = service.userDetail(member_id);
			
			//로그인 타입이 일반회원(R)일때 비밀번호 수정
			if(dto.getLogin_type() != "SNS") 
			{
				//임시비밀번호
				String tempPwd = UUID.randomUUID().toString().replace("-", "");
				tempPwd = tempPwd.substring(0, 10);
			
				dto.setMember_id(member_id);
				dto.setMember_pwd(tempPwd);
				dto.setEmail(email);

				//메일 전송
				PwdMail mail = new PwdMail();
				mail.sendPwdEmail(dto);
				
				//비밀번호 암호화
				String secPw=bcryptPasswordEncoder.encode(dto.getMember_pwd());
				dto.setMember_pwd(secPw);
				
				//DB비밀번호 변경
				service.updatepwd(dto);
			}
			model.addAttribute("login_type", dto.getLogin_type());
		}
		
		model.addAttribute("member_id", member_id);
		
		model.addAttribute("page","login/finduserpwdresult.jsp");
		return "view";

	}
}




