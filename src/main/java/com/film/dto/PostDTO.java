package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PostDTO {
	private int post_no;
	private String member_id;
	private String post_content;
	private String movieNm;
	private String post_date;
	
	private String image;
	
	public PostDTO(String member_id, String post_content, String movieNm, String image) {
		super();
		this.member_id = member_id;
		this.post_content = post_content;
		this.movieNm = movieNm;
		this.image = image;
	}
}
