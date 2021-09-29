package com.film.data;

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
		
		if(session.getAttribute("loginId")==null)
		{
			response.sendRedirect("login"); //로그인값 없으면 login페이지로 넘기기
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
