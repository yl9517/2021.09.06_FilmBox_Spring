package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class MovieDTO {
	private String rank;
	private String movieCd;
	private String movieNm;
	private String openDt;
	private String audiAcc;
	private String image;
	private String update_date;
	private float starpoint;
	
	public MovieDTO(String rank, String movieCd, String movieNm, String openDt, String audiAcc,String image) {
		super();
		this.rank = rank;
		this.movieCd = movieCd;
		this.movieNm = movieNm;
		this.openDt = openDt;
		this.audiAcc=audiAcc;
		this.image = image;
	}
	
	
	
}
