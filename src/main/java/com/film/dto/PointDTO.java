package com.film.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
public class PointDTO {
	private int point_no;
	private String member_id;
	private String point_date;
	private int point;
	private String point_content;
	public PointDTO(String member_id, int point, String point_content) {
		super();
		this.member_id = member_id;
		this.point = point;
		this.point_content = point_content;
	}

	

}
