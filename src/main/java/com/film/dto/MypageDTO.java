package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class MypageDTO {
	private int rev_no;
	private String image;
	private String show_date;
	private String show_time;
	private String seatno;
	private int review_starpoint;
	private String review_content;
	private String movieNm;
	private String member_id;
}
