package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SubPostDTO {
	private int sub_no;
	private int post_no;
	private String subcontent;
	private String member_id;

}
