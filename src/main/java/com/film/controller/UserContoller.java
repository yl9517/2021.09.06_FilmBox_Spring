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

import com.film.dto.CouponDTO;
import com.film.dto.MovieDTO;
import com.film.dto.MypageDTO;
import com.film.dto.NoticePageDTO;
import com.film.dto.PointDTO;
import com.film.dto.PostDTO;
import com.film.dto.UserDTO;
import com.film.service.CouponService;
import com.film.service.PostService;
import com.film.service.ProductService;
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
	
	@Autowired
	private CouponService couponservice;
	
	@Autowired
	private PostService postservice;
	
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
		int postCount = postservice.getMyPostCount(member_id);
		
		List<MypageDTO> myRsvList = service.getRsvData(member_id);
		List<MypageDTO> myfilmlist = service.getMyfilmData(member_id);
		List<HashMap<String, Object>> myCouponList = couponservice.getMyCoupon(member_id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("postCount", postCount);
		model.addAttribute("myRsvList", myRsvList);
		model.addAttribute("myfilmlist", myfilmlist);
		model.addAttribute("myCouponList", myCouponList);
		model.addAttribute("page","user/mypage.jsp");

		return "view";
	}
	//마이페이지>내 포인트 내역
	@GetMapping("/mypointlist")
	public String mypointlist(@RequestParam(required = false, defaultValue = "1") int currPage
								, HttpSession session
								, Model model) 
	{
		String member_id=(String)session.getAttribute("loginId");
			
		//전체 자료수 확인
		int totalCount = service.totalCount(member_id);
		int pageSize = 10;
		int blockSize = 5;
			
		NoticePageDTO ppage = new NoticePageDTO(currPage, totalCount, pageSize, blockSize);
		List<PointDTO> pointList = service.getMyPointList(member_id, ppage.getStartRow(), ppage.getEndRow());
			
		UserDTO dto=service.userDetail(member_id);
			
		model.addAttribute("pointList", pointList);
		model.addAttribute("ppage", ppage);
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
	
	//마이페이지>무비 포스트
	@GetMapping("/myMoviePost")
	public String myMoviePost(HttpSession session, Model model)
	{
		String member_id=(String)session.getAttribute("loginId");
		List<PostDTO> mypostlist = postservice.getMyPostList(member_id);
		int postCount = postservice.getMyPostCount(member_id);
		
		model.addAttribute("postCount", postCount);
		model.addAttribute("mypostlist", mypostlist);
		model.addAttribute("page","user/myMoviePost.jsp");
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
	
	
	/*-------------------------------------------------------	*/	
	/* My예매내역 영화 예약정보 QR */
	@RequestMapping(value = "/showQR/{rev_no}/{movieNm}/{show_date}/{show_time}/{seats}")
	public String makeQR(@PathVariable int rev_no
						, @PathVariable String movieNm
						, @PathVariable String show_date
						, @PathVariable String show_time
						, @PathVariable String seats
						, Model model)  throws Exception
	{       
	      //properties 불러오기
	      ClassPathResource resource= new ClassPathResource("ip.properties");
	      Properties prop = new Properties();
	      prop.load(resource.getInputStream());
	      model.addAttribute("rev_no",rev_no);
		  model.addAttribute("movieNm",movieNm);
		  model.addAttribute("show_date",show_date);
		  model.addAttribute("show_time",show_time);
		  model.addAttribute("seats",seats);
	                     
	      //google qr 코드 api 로 qr 생성
	      String url1 = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=";
	      String url2 = "http://"+prop.getProperty("ip")+"/revInfo/"+rev_no
	      +"/"+movieNm+"/"+show_date+"/"+show_time+"/"+seats;
	      String url = url1+url2;
	      model.addAttribute("QRurl", url);
	               
	      return "user/QRview";
	 }
	
	@GetMapping("/revInfo/{rev_no}/{movieNm}/{show_date}/{show_time}/{seats}")
	public String reserveInfo(@PathVariable int rev_no
							, @PathVariable String movieNm
							, @PathVariable String show_date
							, @PathVariable String show_time
							, @PathVariable String seats
							, Model model) 
	{

	    //영화 포스터 이미지 불러오기
	    String image = service.getPoster(movieNm);
	    
	    model.addAttribute("rev_no",rev_no);
	    model.addAttribute("movieNm",movieNm);
	    model.addAttribute("show_date",show_date);
	    model.addAttribute("show_time",show_time);
	    model.addAttribute("seats",seats);
	    model.addAttribute("image",image);
	         
		return "user/myreserveinfo_m";
	}
	
	
	/* my쿠폰 QR */
	@RequestMapping(value = "/showCouponQR/{product_no}/{coupon_no}/{product_category}/{product_name}/{product_content}/{coupon_lastdate}")
	public String makeCouponQR( @PathVariable int product_no
						, @PathVariable int coupon_no
						, @PathVariable String product_category
						, @PathVariable String product_name
						, @PathVariable String product_content
						, @PathVariable String coupon_lastdate
						, Model model)  throws Exception
	{       
	      //properties 불러오기
	      ClassPathResource resource= new ClassPathResource("ip.properties");
	      Properties prop = new Properties();
	      prop.load(resource.getInputStream());

	                     
	      //google qr 코드 api 로 qr 생성
	      String url1 = "https://chart.googleapis.com/chart?cht=qr&chs=300x300&chl=";
	      String url2 = "http://"+prop.getProperty("ip")+"/couponInfo/"+product_no+"/"+coupon_no
	      +"/"+product_category+"/"+product_name+"/"+product_content+"/"+coupon_lastdate;
	      String url = url1+url2;
	      model.addAttribute("QRurl", url);
	               
	      return "user/QRview";
	 }
	
	@GetMapping("/couponInfo/{product_no}/{coupon_no}/{product_category}/{product_name}/{product_content}/{coupon_lastdate}")
	public String couponInfo( @PathVariable int product_no
							, @PathVariable int coupon_no
							, @PathVariable String product_category
							, @PathVariable String product_name
							, @PathVariable String product_content
							, @PathVariable String coupon_lastdate
							, Model model) 
	{

		HashMap<String, Object> map= couponservice.getInfo(coupon_no);
	  
		
		model.addAttribute("coupon_no",coupon_no);
	    model.addAttribute("product_category",product_category);
	    model.addAttribute("product_name",product_name);
	    model.addAttribute("product_content",product_content);
	    model.addAttribute("coupon_lastdate",coupon_lastdate);
	    model.addAttribute("map",map);
   
	    return "user/myCouponInfo_m";
	}
	

	@GetMapping("/useCoupon")
	public @ResponseBody void useCoupon(@RequestParam int coupon_no) {
		
		couponservice.oneUseCoupon(coupon_no);
	}
}