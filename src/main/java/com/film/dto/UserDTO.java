package com.film.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_phone;
	private String email;
	private int point;
	
}
