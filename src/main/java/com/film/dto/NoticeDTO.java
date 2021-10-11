package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_readno;
	private String notice_img;
	
	public NoticeDTO(String notice_title, String notice_content, int notice_readno, String notice_img) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_readno = notice_readno;
		this.notice_img = notice_img;
	}

	public NoticeDTO(int notice_no, String notice_title, String notice_content, String notice_img) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_img = notice_img;
	}

	public NoticeDTO(int notice_no, String notice_title, String notice_content) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}
	
	
	


	
	
	
}
