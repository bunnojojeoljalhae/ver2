package com.web.honbab.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.honbab.session.MemberSession;

@Component
public class MemberInterceptor extends HandlerInterceptorAdapter implements MemberSession {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if(session.getAttribute(LOGINUSER) == null) {
			response.setContentType("text/html; charset=utf-8");
			response.sendRedirect("/honbab/index");
			
			return false;
		}
		return true;
		
	}
}
