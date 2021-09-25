package com.film.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReviewDTO {
	private int review_no;
	private String member_id;
	private String movieCd;
	private String review_content;
	private int review_starpoint;
	private Date review_date;
	private int rev_no;
}
