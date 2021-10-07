package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	private int cart_no;
	private String member_id;
	private int product_no;
	private int cart_count;
	private int cart_price;
	private String cart_date;
}
