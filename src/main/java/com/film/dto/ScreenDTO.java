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
public class ScreenDTO {
	private int rev_no;
	private String reserveDate;
	private String screenTime;
	private String seats;

}
