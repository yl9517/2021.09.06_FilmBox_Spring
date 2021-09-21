package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReserveDTO {
	private String movieNm;
	private String movieCd;
	private String screenTime;
	private String reserveDate;
	private KakaopayDTO cgvPayDto;
}
