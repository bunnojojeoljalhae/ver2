package com.web.honbab.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface NoticeService {

	public void noticeAllList(Model model, int num);
	
	public void noticeContent(Model model, int writeNo);
	
	public void upViews(int writeNo);
	
	public String saveNotice(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String modifyNotice(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String deleteNotice(int writeNo, HttpServletRequest request);
	
	public String getMessage(HttpServletRequest request, String msg, String url);

	public void noticeSearch(MultipartHttpServletRequest mul, Model model, int num);

}
