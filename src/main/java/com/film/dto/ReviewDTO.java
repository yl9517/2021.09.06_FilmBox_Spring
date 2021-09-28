package com.film.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int review_no;
	private String member_id;
	private String movieCd;
	private String review_content;
	private int review_starpoint;
	private Date review_date;
	private int rev_no;
	
	public ReviewDTO(String member_id, String movieCd) {
		super();
		this.member_id = member_id;
		this.movieCd = movieCd;
	}
	
	
}
