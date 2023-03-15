package com.web.honbab.service;

import javax.servlet.http.HttpServletRequest;

public interface AdminService {	
	
	public int adminLogin(HttpServletRequest request);
	
	public String deleteChallenge(int writeNo, HttpServletRequest request);

	public String deleteReview(int writeNo, String imgName, HttpServletRequest request);
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String userBan(String id, HttpServletRequest request);

}

