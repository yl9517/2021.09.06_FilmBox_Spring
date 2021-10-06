package com.film.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.dto.MovieDTO;
import com.film.dto.MypageDTO;
import com.film.dto.PointDTO;
import com.film.dto.UserDTO;
import com.film.service.ReserveService;
import com.film.service.UserService;
import com.mysql.cj.Session;



@Controller
public class UserContoller {

	//private static final Logger logger = LoggerFactory.getLogger(UserContoller.class);

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private ReserveService revservice;
	
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
		dto.setLogin_type("R");
		dto.setMember_pwd(bcryptPasswordEncoder.encode(dto.getMember_pwd()));
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

	//마이페이지 메인(my예매내역)
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session){

		String member_id=(String)session.getAttribute("loginId");
		UserDTO dto=service.userDetail(member_id);
		List<MypageDTO> myRsvList = service.getRsvData(member_id);
		List<MypageDTO> myfilmlist = service.getMyfilmData(member_id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("myRsvList", myRsvList);
		model.addAttribute("myfilmlist", myfilmlist);
		model.addAttribute("page","mypage.jsp");

		return "view";
	}
	//마이페이지>내 포인트 내역
	@GetMapping("/mypointlist")
	public String mypointlist(HttpSession session, Model model) {

		String member_id=(String)session.getAttribute("loginId");
		List<PointDTO> pointList = service.getMyPoints(member_id);
		UserDTO dto=service.userDetail(member_id);
		
		model.addAttribute("pointList", pointList);
		model.addAttribute("dto", dto);
		model.addAttribute("page","user/mypointlist.jsp");

		return "view";
	}

	//마이페이지>나의 필름스토리
	@GetMapping("/myfilmstory")
	public String myfilmstory(HttpSession session, Model model)
	{
		String member_id=(String)session.getAttribute("loginId");
		List<MypageDTO> myfilmlist = service.getMyfilmData(member_id);
		
		model.addAttribute("myfilmlist", myfilmlist);
		model.addAttribute("page","user/myfilmstory.jsp");
		return "view";
	}
	
	//마이페이지>예약취소
	@RequestMapping("/rsvcancel")
	public @ResponseBody int revcancel(@RequestParam int rev_no)
	{
		System.out.println(rev_no);
		int result = 0;
		result = revservice.revCancel(rev_no);
		return result;
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

	
	//마이페이지>회원정보수정 1.세션체크
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpSession session)
	{
		//세션 체크
		if(session.getAttribute("loginId")!=null) 
		{
			//소셜회원구분 session 체크
			if(session.getAttribute("logintype") != null)
			{
				return "redirect:mypage";
			}else {
				model.addAttribute("page","user/pwdcheck.jsp");
				return "view";
			}

		}else {
			return "redirect:login";	
		}

	}

	//2.비밀번호 체크  3.수정 페이지로 이동
	@PostMapping("/myinfo")
	public String pwdcheck(HttpSession session, UserDTO dto, Model model)
	{	
		String member_id=(String) session.getAttribute("loginId");
		
		dto.setMember_id(member_id);

		UserDTO getuser=service.getUser(dto);
		boolean result=bcryptPasswordEncoder.matches(dto.getMember_pwd(),  getuser.getMember_pwd());

		if(getuser!=null && result)
		{
			UserDTO dto2=service.userDetail(member_id);
			model.addAttribute("dto", dto2);
			model.addAttribute("page", "user/modifyform.jsp");
			return "view";
		}
		else
		{
			return "redirect:myinfo";
		}
	}

	//4.수정 후 DB 저장  5.메인페이지로 이동
	@RequestMapping("/modifyresult")
	public String updateUser(Model model, UserDTO dto)
	{
		boolean tf=false;
		Map<String, Object> result=new HashMap<String, Object>();
		
		dto.setMember_pwd(bcryptPasswordEncoder.encode(dto.getMember_pwd()));
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

	
	//-----------------------------------

	@GetMapping("/reserveInfo/{rev_no}/{seats}")
	public String reserveInfo(@PathVariable int rev_no
			, @PathVariable String seats
            , Model model) {
	      System.out.println("sum예약번호"+rev_no);
	      System.out.println("sum좌석"+seats);
	         model.addAttribute("rev",rev_no);
	         model.addAttribute("seats",seats);
	         
		return "qrtestresult";
	}
	
//	//예매내역 모바일에서 보기
//	   @RequestMapping("/sendData")
//	   public @ResponseBody MypageDTO qrresult(@ModelAttribute MypageDTO dto, Model model) 
//	   {
//	      System.out.println("예약번호"+dto.getRev_no());
//	      System.out.println("영화제목"+dto.getMovieNm());
//	      System.out.println("포스터"+dto.getImage());
//	      System.out.println("상영날짜"+dto.getShow_date());
//	      System.out.println("상영시간"+dto.getShow_time());
//	      System.out.println("좌석"+dto.getSeats());
//	         
//	      return dto;
//	   }
	//   
	//   
	//   @RequestMapping("/qrtestresult/{rev_no}/{image}/{title}/{date}/{time}/{seats}") 
	//   public String qrresult2(@PathVariable int rev_no
//	                     , @PathVariable String image
//	                     , @PathVariable String title
//	                     , @PathVariable String date
//	                     , @PathVariable String time
//	                     , @PathVariable String seats
//	                     , Model model) 
	//   { 
//	      MypageDTO dto =new MypageDTO(rev_no, image, date, time, seats, title);
//	      model.addAttribute("dto", dto);
//	      System.out.println(dto.getRev_no());
//	      return "qrtestresult"; 
	//   }
	   
	//   @RequestMapping("/sendRevData")
	//   public String revData(@ModelAttribute MypageDTO dto)
	//   {
//	      System.out.println("예약번호"+dto.getRev_no());
//	      System.out.println("영화제목"+dto.getMovieNm());
//	      System.out.println("포스터"+dto.getImage());
//	      System.out.println("상영날짜"+dto.getShow_date());
//	      System.out.println("상영시간"+dto.getShow_time());
//	      System.out.println("좌석"+dto.getSeats());
	//   }
	   
	   @RequestMapping("/qrtestresult/{dto}")
	   public String qrtestresult(@ModelAttribute MypageDTO dto, Model model)
	   {
	      model.addAttribute("dto", dto);
	      return "qrtestresult";
	   }
	   
	   @RequestMapping(value = "/showQR")
	   public String makeQR(@ModelAttribute("dto") MypageDTO dto, Model model) throws Exception
	   {   
	      System.out.println("예약번호"+dto.getRev_no());
	      System.out.println("영화제목"+dto.getMovieNm());
	      System.out.println("포스터"+dto.getImage());
	      System.out.println("상영날짜"+dto.getShow_date());
	      System.out.println("상영시간"+dto.getShow_time());
	      System.out.println("좌석"+dto.getSeats());
	      
	      //properties 불러오기
	      ClassPathResource resource= new ClassPathResource("ip.properties");
	      Properties prop = new Properties();
	      prop.load(resource.getInputStream());
	      model.addAttribute("dto", dto);
	                     
	      //google qr 코드 api 로 qr 생성
	      String url1 = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=";
	      String url2 = "http://"+prop.getProperty("ip")+"/reserveInfo/"+dto.getRev_no()+"/"+dto.getSeats();
	      String url = url1+url2;
	      model.addAttribute("QRurl", url);
	               
	      return "QRview";
	   }
}