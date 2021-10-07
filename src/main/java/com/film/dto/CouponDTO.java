package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO {
	private int coupon_no;
	private String member_id;
	private int product_no;
	private int coupon_count;
	private int coupon_price;
	private String coupon_lastdate;
	private int coupon_condition;
}
