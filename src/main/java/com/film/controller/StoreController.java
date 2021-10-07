package com.film.controller;

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

import com.film.dto.CartDTO;
import com.film.dto.ProductDTO;
import com.film.service.CartService;
import com.film.service.ProductService;

@Controller
public class StoreController {

	@Autowired
	private ProductService proService;
	@Autowired
	private CartService cartService;
	
	//상품목록
	@GetMapping("/store")
	public String store(Model model) {
		
		List<ProductDTO> list = proService.getProductList();
	
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
	public String storepay(@ModelAttribute ProductDTO dto,@RequestParam int product_count, Model model) {
		model.addAttribute("dto",dto);
		model.addAttribute("count",product_count);
		model.addAttribute("page","store/storePay.jsp");
		
		return "view";
	}
	
	//상품결제끝
	@PostMapping("/storepaydone")
	public String storepaydone(@ModelAttribute CartDTO dto,HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("loginId");
		dto.setMember_id(member_id);
		
		cartService.insertCart(dto);
		
		model.addAttribute("page","store/storePayDone.jsp");
		
		return "view";
	}
	
}
