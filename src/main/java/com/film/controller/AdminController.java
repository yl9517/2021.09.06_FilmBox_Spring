package com.film.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.film.dto.ProductDTO;
import com.film.service.ProductService;

@Controller
public class AdminController {

	@Autowired
	private ProductService service;

	//관리자 상품등록페이지
	@GetMapping("/productInsert")
	public String productInsert(Model model, HttpSession session) 
	{
		String member_id=(String)session.getAttribute("loginId");
		if(!(member_id).equals("admin"))
			return "redirect:main";
		
		model.addAttribute("page", "admin/productInsert.jsp");
		return "view";
	}
	
	//관리자 상품등록
	@PostMapping("/productInsertAction")
	public String productInsertAction(@RequestParam String product_name
									  ,@RequestParam(required = false) String product_content
									  ,@RequestParam int product_price
									  ,@RequestParam String product_category
									  ,@RequestParam(value="productfile",required = false) MultipartFile file
									  ,HttpServletRequest request
									  )throws IOException {

		String uploadDir = request.getRealPath(""); //실제경로
//		String uploadDir = request.getRealPath("resources/upload"); //실제경로
		
		String filename = "/resources/upload/"+file.getOriginalFilename();	//파일 이름
//		String filename = file.getOriginalFilename();	//파일 이름
		
		String filePath = uploadDir+"\\"+filename;
		file.transferTo(new File(filePath)); //파일 저장

		ProductDTO dto = new ProductDTO(product_name, product_content, product_price, filename, product_category);
		
		int result = service.insertProduct(dto);
//   	return "testfile";
		return "redirect:/productList";
	}

	//관리자 상품목록
	@GetMapping("/productList")
	public String productList(Model model, HttpSession session) 
	{
		String member_id=(String)session.getAttribute("loginId");
		if(!(member_id).equals("admin"))
			return "redirect:main";
		
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
	public String productUpdateAction(@RequestParam String product_name
			  							,@RequestParam(required = false) String product_content
			  							,@RequestParam int product_price
			  							,@RequestParam String product_category
			  							,@RequestParam(value="productfile",required = false) MultipartFile file
			  							,HttpServletRequest request
			  							)throws IOException
	{
		String uploadDir = request.getRealPath(""); //실제경로
//		String uploadDir = request.getRealPath("resources/upload"); //실제경로
		
		String filename = "/resources/upload/"+file.getOriginalFilename();	//파일 이름
//		String filename = file.getOriginalFilename();	//파일 이름
		
		String filePath = uploadDir+"\\"+filename;
		file.transferTo(new File(filePath)); //파일 저장

		ProductDTO dto = new ProductDTO(product_name, product_content, product_price, filename, product_category);
		
		int result = service.updateProduct(dto);
		return "redirect:/productList";
	}
	

	//관리자 상품삭제
	@RequestMapping("/productDelete/{product_no}")
	public String productDelete(@PathVariable int product_no) 
	{
		int result = service.deleteProduct(product_no);
		return "redirect:/productList";
	}

}
