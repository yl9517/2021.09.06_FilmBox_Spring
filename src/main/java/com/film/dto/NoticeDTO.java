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
	
}
