package com.film.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.dto.ProductDTO;
import com.film.service.ProductService;

@Controller
public class AdminController {

	@Autowired
	private ProductService service;

	//관리자 상품등록
	@GetMapping("/productInsert")
	public String productInsert(Model model) 
	{
		model.addAttribute("page", "store/productInsert.jsp");
		return "view";
	}
	@RequestMapping("/productInsertAction")
	public String productInsertAction(ProductDTO dto)
	{
		int result = service.insertProduct(dto);

		return "redirect:/productList";
	}

	//관리자 상품목록
	@GetMapping("/productList")
	public String productList(Model model) 
	{
		model.addAttribute("page", "store/productList.jsp");
		return "view";
	}

	//관리자 상품상세
	@GetMapping("/productDetail")
	public String productDetail(Model model) 
	{
		model.addAttribute("page", "store/productDetail.jsp");
		return "view";
	}

	//관리자 상품수정
	@GetMapping("/productUpdate")
	public String productUpdate(Model model) 
	{
		model.addAttribute("page", "store/productUpdate.jsp");
		return "view";
	}

	//관리자 상품삭제
	@GetMapping("/productDelete")
	public String productDelete(Model model) 
	{
		model.addAttribute("page", "store/productDelete.jsp");
		return "view";
	}

}
