package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SubPostDTO {
	private int subno;
	private int post_no;
	private String subcontent;
	private String member_id;
	private String sub_date;
}
