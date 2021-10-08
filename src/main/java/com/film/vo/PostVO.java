package com.film.vo;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;

@Getter
@Service
public class PostVO {
	private MultipartFile image;
}
