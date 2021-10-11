package com.film.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.film.dto.NoticeDTO;
import com.film.dto.NoticePageDTO;
import com.film.dto.ProductDTO;
import com.film.dto.UserDTO;
import com.film.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;

	//공지사항 목록
	@RequestMapping("/notice")
	public String noticeList(Model model, HttpSession session
						, @RequestParam(required = false, defaultValue = "1") int currPage)
	{
		String member_id=(String)session.getAttribute("loginId");
		model.addAttribute("member_id", member_id);
		
		int totalcount=service.totalCount();
		int pagesize=5;
		int blocksize=5;
		
		NoticePageDTO page=new NoticePageDTO(currPage, totalcount, pagesize, blocksize);
		
		model.addAttribute("page2", page);

		List<NoticeDTO> list=service.noticeList(page.getStartRow(), page.getEndRow());
		model.addAttribute("list", list);
		
		model.addAttribute("page", "notice/noticelist.jsp");
		return "view";
	}
	
	
	//공지사항 입력 form
	@RequestMapping("/noticeinsert")
	public String noticeInsert(Model model, HttpSession session)
	{
		model.addAttribute("page", "notice/noticeinsert.jsp");
		return "view";
	}
	
//	//공지사항 DB insert
//	@RequestMapping("/noticeinsertresult")
//	public String noticeInsertResult(NoticeDTO dto)
//	{
//		service.noticeInsert(dto);
//		
//		return "redirect:/notice";
//	}
	
	//공지사항 DB insert + 파일첨부
	@PostMapping("/noticeinsertresult")
	public String productInsertAction(/*@PathVariable int notice_no */
									  @RequestParam(required = false) String notice_title
									  ,@RequestParam(required = false) String notice_content
									  ,@RequestParam(required = false, defaultValue = "0") int notice_readno
									  ,@RequestParam(value="upload",required = false) MultipartFile file
									  ,HttpServletRequest request
									  )throws IOException {

		String uploadDir = request.getRealPath(""); //실제경로
//		String uploadDir = request.getRealPath("resources/upload"); //실제경로
		
		String filename = "/resources/upload/"+file.getOriginalFilename();	//파일 이름
//		String filename = file.getOriginalFilename();	//파일 이름
		
		String filePath = uploadDir+"\\"+filename;
		file.transferTo(new File(filePath)); //파일 저장

		NoticeDTO dto = new NoticeDTO(notice_title, notice_content, notice_readno, filename);
		
		service.noticeInsert(dto);
//   	return "testfile";
		return "redirect:/notice";
	}
	
	//공지사항 Detail (+조회수)
	@GetMapping("/noticeDetail")
	public String noticeDetail(HttpSession session, Model model, NoticeDTO dto, @RequestParam("notice_no")int notice_no) {
		
		String member_id=(String)session.getAttribute("loginId");
		model.addAttribute("member_id", member_id);
		model.addAttribute("detail", service.noticeDetail(dto.getNotice_no()));
	
		service.updateReadno(notice_no);
		model.addAttribute("page", "notice/noticedetail.jsp");
		return "view";
	}
	
	//공지사항 수정 form
	@GetMapping("/noticemodify")
	public String noticeModify(Model model, NoticeDTO dto) {
		
		model.addAttribute("detail", service.noticeDetail(dto.getNotice_no()));
		
		model.addAttribute("page", "notice/noticemodify.jsp");
		return "view";
	}
	
	//공지사항 수정 완료
	@PostMapping("/noticemodifyresult")
	public String noticeModifyResult(@RequestParam("notice_no")int notice_no
									  ,@RequestParam(required = false) String notice_title
									  ,@RequestParam(required = false) String notice_content
									  ,@RequestParam(value="upload",required = false) MultipartFile file
									  ,HttpServletRequest request ) throws IOException
									  
	{
		

		String uploadDir = request.getRealPath(""); //실제경로
		String filename = "/resources/upload/"+file.getOriginalFilename();	//파일 이름

		
		if(file.getOriginalFilename().equals(""))
		{
			NoticeDTO dto = new NoticeDTO(notice_no, notice_title, notice_content);
			service.noticeModify2(dto);
		}
		else
		{
			String filePath = uploadDir+"\\"+filename;
			file.transferTo(new File(filePath)); //파일 저장
			
			 NoticeDTO dto2 = new NoticeDTO(notice_no, notice_title, notice_content,filename);
			 service.noticeModify(dto2);
		}
		

		return "redirect:/notice";
	}
	
	//공지사항 삭제
	@RequestMapping("/noticedelete")
	public String noticeDeelete(NoticeDTO dto)
	{
		service.noticeDelete(dto);
		
		return "redirect:/notice";
	}
	
	
}
