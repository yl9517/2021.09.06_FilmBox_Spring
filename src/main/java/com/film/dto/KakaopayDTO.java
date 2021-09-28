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
public class KakaopayDTO {
//	private String name;
//	private String email;
//	private String phone;
//	private String address;
//	private int totalPrice;
	private int rev_no;
	private String  movieNm;
	private String  movieCd;
	private String  reserveDate;
	private String  screenTime;
	private int  payMoney;
	private String  ticketNumber;
	private String  selectedSeat;
	public KakaopayDTO(int rev_no, String reserveDate, String screenTime, String selectedSeat) {
		super();
		this.rev_no = rev_no;
		this.reserveDate = reserveDate;
		this.screenTime = screenTime;
		this.selectedSeat = selectedSeat;
	}
	
}
