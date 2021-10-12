package com.film.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.dto.CouponDTO;
import com.film.dto.ProductDTO;
import com.film.service.CouponService;
import com.film.service.ProductService;

@Controller
public class StoreController {

	@Autowired
	private ProductService proService;
	@Autowired
	private CouponService couponService;
	
	//상품목록
	@GetMapping("/store")
	public String store(HttpSession session, Model model) {
		
		List<ProductDTO> list = proService.getProductList();
		String member_id=(String)session.getAttribute("loginId");
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("list",list);
		model.addAttribute("page","store/storeList.jsp");
		
		return "view";
	}
	
	//상품상세
	@GetMapping("/store/{product_no}")
	public String store(@PathVariable int product_no, Model model) {
		ProductDTO dto = proService.detailProduct(product_no);
		
		model.addAttribute("dto",dto);
		model.addAttribute("page","store/storeDetail.jsp");
		
		return "view";
	}
	
	//상품결제
	@PostMapping("/storepay")
	public String storepay(@ModelAttribute ProductDTO dto,@RequestParam int product_count,HttpSession session, Model model) {
		String member_id= "";
    	if((String)session.getAttribute("loginId") !=null)
    		member_id = (String)session.getAttribute("loginId"); //세션아이디
	
    	List<HashMap<String, Object>> map = couponService.getRealCoupon(member_id);
		
    	model.addAttribute("map",map);
		model.addAttribute("dto",dto);
		System.out.println("ㅇㅁㅈ"+dto.getProduct_img());
		System.out.println("name"+dto.getProduct_name());
		model.addAttribute("count",product_count);
		model.addAttribute("page","store/storePay.jsp");
		
		return "view";
	}
	
	//상품결제끝
	@PostMapping("/storepaydone")
	public String storepaydone(@ModelAttribute CouponDTO dto,HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("loginId");
		dto.setMember_id(member_id);
		
		couponService.insertCoupon(dto);
		
		model.addAttribute("page","store/storePayDone.jsp");
		
		return "view";
	}
	
}
