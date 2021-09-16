package com.film.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = {"com.film.mapper"})
@ComponentScan(basePackages = {"com.film.service"})
public class Config {
	
}
