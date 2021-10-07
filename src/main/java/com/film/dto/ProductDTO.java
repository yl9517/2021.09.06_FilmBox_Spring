package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int product_no;
	private String product_name;
	private String product_content;
	private int product_price;
	private String product_img;
	private String product_category;
}
