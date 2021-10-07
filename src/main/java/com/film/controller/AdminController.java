package com.film.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.dto.ProductDTO;
import com.film.service.ProductService;

@Controller
public class AdminController {

	@Autowired
	private ProductService service;

	//관리자 상품등록페이지
	@GetMapping("/productInsert")
	public String productInsert(Model model) 
	{
		model.addAttribute("page", "admin/productInsert.jsp");
		return "view";
	}
	//관리자 상품등록
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
		List<ProductDTO> productList = service.getProductList();
		model.addAttribute("productList", productList);
		
		model.addAttribute("page", "admin/productList.jsp");
		return "view";
	}

	//관리자 상품상세
	@GetMapping("/productDetail/{product_no}")
	public String productDetail(@PathVariable int product_no, Model model) 
	{
		ProductDTO dto = service.detailProduct(product_no);
		model.addAttribute("dto", dto);
		
		model.addAttribute("page", "admin/productDetail.jsp");
		return "view";
	}

	//관리자 상품수정페이지요
	@GetMapping("/productUpdate/{product_no}")
	public String productUpdate(@PathVariable int product_no, Model model) 
	{
		ProductDTO dto = service.detailProduct(product_no);
		model.addAttribute("dto", dto);
		
		model.addAttribute("page", "admin/productUpdate.jsp");
		return "view";
	}
	//관리자 상품수정
	@PostMapping("/productUpdateAction")
	public String productUpdateAction(@ModelAttribute ProductDTO dto)
	{
		int result = service.updateProduct(dto);
		return "redirect:/productList";
	}
	

	//관리자 상품삭제
	@GetMapping("/productDelete/{product_no}")
	public String productDelete(@PathVariable int product_no) 
	{
		int result = service.deleteProduct(product_no);
		return "redirect:/productList";
	}

}
