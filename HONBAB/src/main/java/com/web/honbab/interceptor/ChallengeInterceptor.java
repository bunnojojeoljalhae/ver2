package com.web.honbab.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.honbab.session.MemberSession;

public class ChallengeInterceptor extends HandlerInterceptorAdapter implements MemberSession {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGINUSER) == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 작성 가능');"
					+ "location.href='" 
					+ request.getContextPath()
					+ "/member/login' </script>");
			return false;
		}
		return true;
	}

}
