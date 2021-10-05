package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReportDTO {
	private int repcount;
	private int report_no;
	private int review_no;
	private String member_id;
	public ReportDTO(int review_no, String member_id) {
		super();
		this.review_no = review_no;
		this.member_id = member_id;
	}
	
	
}
