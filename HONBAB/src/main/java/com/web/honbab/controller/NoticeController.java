package com.web.honbab.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.service.FileService;
import com.web.honbab.service.NoticeService;
import com.web.honbab.session.AdminSession;

@Controller
@RequestMapping("notice")
public class NoticeController implements AdminSession {

	@Autowired
	private NoticeService ns;
	
	@RequestMapping(value= "noticeAllList")	
	public String noticeAllList(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		ns.noticeAllList(model, num);
		
		return "notice/noticeAllList";
	}
	
	@RequestMapping("noticeWriteForm")
	public String noticeForm(Model model) {
		return "notice/noticeWriteForm";
	}
	
	@RequestMapping("saveNotice")
	public void saveNotice(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = ns.saveNotice(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	 
	@RequestMapping("noticeContent")
	public String noticeContent(@RequestParam int writeNo, Model model) {
		ns.noticeContent(model, writeNo);
		return "notice/noticeContent";
	}
	
	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int writeNo) {
		ns.upViews(writeNo);
		return "redirect:noticeContent?writeNo=" + writeNo;
	}
	
	@RequestMapping("deleteNotice")
	public void deleteNotice(@RequestParam int writeNo,
				HttpServletRequest request, HttpServletResponse response) throws IOException {
		String message = ns.deleteNotice(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@RequestMapping("noticeModifyForm")
	public String noticeModifyForm(Model model, @RequestParam int writeNo) {
		ns.noticeContent(model, writeNo);
		return "notice/noticeModifyForm";
	}
	
	@RequestMapping("modifyNotice")
	public void modifyNotice(@RequestParam int writeNo, MultipartHttpServletRequest mul,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = ns.modifyNotice(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@RequestMapping(value= "noticeSearch")
	public String noticeSearch(MultipartHttpServletRequest mul, Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		ns.noticeSearch(mul, model, num);
		
		return "notice/noticeAllList";
	}
	
	@GetMapping("download")
	public void download(@RequestParam String imgName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; fileName=" + imgName);
		File file = new File(FileService.IMAGE_CHALLENGE + "\\" + imgName);
		file.setWritable(true);
		file.setReadable(true);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
}
