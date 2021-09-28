package com.film.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.MovieDTO;
import com.film.dto.UserDTO;
import com.film.service.UserService;
import com.mysql.cj.Session;



@Controller
public class UserContoller {

	//private static final Logger logger = LoggerFactory.getLogger(UserContoller.class);

	@Autowired
	private UserService service;

	//회원가입 페이지
	@RequestMapping("/join")
	public String userJoin(Model model)
	{
		model.addAttribute("page", "login/join.jsp");
		return "view";
	}

	//회원가입 환영 페이지
	@RequestMapping("/joinresult")
	public String joinresult(Model model, UserDTO dto)
	{
		service.insertFilmUser(dto);
		model.addAttribute("member_name", dto.getMember_name());
		model.addAttribute("page", "login/joinresult.jsp");
		return "view";
	}

	//id 중복 체크
	@RequestMapping(value = "/useridcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String member_id)
	{
		int result=service.idcheck(member_id);

		if(result!=0)
			return "fail";
		else
			return "success";

	}
	
	//email 중복 체크
	@RequestMapping(value = "/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailcheck(String email)
	{
		int result=service.emailcheck(email);

		if(result!=0)
			return "fail";
		else
			return "success";

	}
	
	//마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {

		String member_id=(String) session.getAttribute("loginId");
		UserDTO dto=service.userDetail(member_id);

		model.addAttribute("dto", dto);
		model.addAttribute("page","mypage.jsp");

		return "view";
	}
	//마이페이지>내 포인트 내역
	@GetMapping("/mypointlist")
	public String mypointlist(Model model) {

		model.addAttribute("page","user/mypointlist.jsp");

		return "view";
	}

	//마이페이지>나의 필름스토리
	@GetMapping("/myfilmstory")
	public String myfilmstory(Model model)
	{
		model.addAttribute("page","user/myfilmstory.jsp");
		return "view";
	}
	//마이페이지>my예매내역
	@GetMapping("/myreservelist")
	public String myreservelist(Model model) {

		model.addAttribute("page","user/myreservelist.jsp");
		return "view";
	}

	//	//마이페이지>my예매내역 데이터 받아서 > jsp
	//	@RequestMapping(value = "/qrtest", method = RequestMethod.POST)
	//	//						, produces = "application/json; charset=utf-8")
	//	public String qr(@ModelAttribute("map") HashMap<String, Object> map, Model model) throws Exception
	//	{			
	//		//			JSONObject json = new JSONObject(map);
	//		//			System.out.printf("JSON : %s", json);
	//
	//		//			model.addAttribute("map", map);
	//		//			System.out.println(map);
	//		return "qrtestresult";
	//
	//	}
	//	//예매내역 모바일에서 보기
	//	@RequestMapping("/qrtestresult")
	//	public String qrresult() 
	//	{
	//		return "qrtestresult";
	//	}
	//
	//	//qr보기 -> url jsp에 넘기기
	//	@RequestMapping("/showQR")
	//	public String makeQr(Model model) throws Exception
	//	{
	//		//properties 불러오기
	//		ClassPathResource resource= new ClassPathResource("ip.properties");
	//		Properties prop = new Properties();
	//		prop.load(resource.getInputStream());
	//
	//		//google qr 코드 api
	//		String QRurl = "https://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=";
	//		String url="http://"+prop.getProperty("ip")+":8080/filmbox/qrtestresult";
	//		model.addAttribute("QRurl", QRurl+url);
	//		return "QRview";		
	//	}

	//마이페이지>회원정보수정
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpSession session)
	{
		String login_type = (String)session.getAttribute("logintype");
		if(login_type != null)
		{
			return "redirect:mypage";
		}else {
			model.addAttribute("page","user/pwdcheck.jsp");
			return "view";
		}
	}

	//회원 정보 수정 전 비밀번호 체크
	@PostMapping("/myinfo")
	public String pwdcheck(HttpSession session, UserDTO dto)
	{
		String login_type = (String)session.getAttribute("logintype");

		if(login_type != null)
		{
			return "redirect:mypage";
		}else {
			String member_id=(String) session.getAttribute("loginId");
			String member_pwd=dto.getMember_pwd();

			dto.setMember_id(member_id);
			dto.setMember_pwd(member_pwd);

			int result=service.pwdcheck(dto);

			if(result>0)
			{
				return "redirect:modify";
			}
			else
			{
				return "redirect:myinfo";
			}
		}
	}

	//회원 정보 수정
	@GetMapping("/modify")
	public String mymodifypage(Model model, HttpSession session)
	{
		String member_id=(String) session.getAttribute("loginId");
		//System.out.println("session 테스트------------" + member_id);
		UserDTO dto=service.userDetail(member_id);

		model.addAttribute("dto", dto);
		model.addAttribute("page", "user/modifyform.jsp");
		return "view";
	}

	//수정 후 DB 저장(+메인페이지로 이동)
	@RequestMapping("/modifyresult")
	public String updateUser(Model model, UserDTO dto)
	{
		boolean tf=false;
		Map<String, Object> result=new HashMap<String, Object>();
		if(dto!=null)
		{
			tf=service.updateUser(dto);
		}
		result.put("result", tf);
		return "redirect:mypage";
	}	

	//회원 탈퇴
	@RequestMapping("/userquit")
	public String userquit(HttpSession session)
	{
		String member_id=(String) session.getAttribute("loginId");
		service.deleteUser(member_id);

		session.removeAttribute("loginId");
		session.invalidate();

		return "redirect:main";
	}

}
