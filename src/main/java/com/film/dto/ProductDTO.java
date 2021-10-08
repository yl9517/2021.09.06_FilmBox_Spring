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
	public ProductDTO(String product_name, String product_content, int product_price, String product_img,
			String product_category) {
		super();
		this.product_name = product_name;
		this.product_content = product_content;
		this.product_price = product_price;
		this.product_img = product_img;
		this.product_category = product_category;
	}
	
	
}
