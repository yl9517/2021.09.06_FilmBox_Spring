package com.film.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션 가져오기
		HttpSession session=request.getSession();
		
		if(session.getAttribute("login")==null)
		{
			response.sendRedirect("login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
