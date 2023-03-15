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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.service.FileService;
import com.web.honbab.service.ChallengeService;
import com.web.honbab.session.MemberSession;

@Controller
@RequestMapping("challenge")
public class ChallengeController implements MemberSession {
	
	@Autowired
	ChallengeService cs;
	
	@RequestMapping(value= "challengeAllList")
	public String challengeAllList(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeAllList(model, num);
		
		return "challenge/challengeAllList";
	}
	
	@GetMapping("challengeContent")
	public String challengeContent(Model model, @RequestParam int writeNo) {
		cs.challengeContent(model, writeNo);
		
		return "challenge/challengeContent";
	}
	
	@RequestMapping("challengeWriteForm")
	public String challengeWriteForm() {
		
		return "challenge/challengeWriteForm";
	}
	
	@GetMapping(value = "challengeLike")
	public String challengeLike(@RequestParam int writeNo, Model model) {
		int result = cs.challengeLike(writeNo, model);
		if (result == 1)
			return "redirect:challengeContent?writeNo=" + writeNo;
		else
			return "redirect:challengeContent?writeNo=" + writeNo;
	}	

	@PostMapping("/saveChallenge")
	public void saveChallenge(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = cs.saveChallenge(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);		
	}


	@GetMapping("challengeModifyForm")
	public String challengeModifyForm(Model model, @RequestParam int writeNo) {
		cs.challengeContent(model, writeNo);
		
		return "challenge/challengeModifyForm";
	}
	
	@PostMapping("modifyChallenge")
	public void modifyChallenge(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = cs.modifyChallenge(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("deleteChallenge")
	public void deleteChallenge(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = cs.deleteChallenge(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
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
	
	@RequestMapping("challengePop")
	public String challengePopup() {
		
		return "challenge/challengePop";
	}
	
	@RequestMapping(value= "challengeSearch")
	public String challengeSearch(MultipartHttpServletRequest mul, Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeSearch(mul, model, num);
		
		return "challenge/challengeAllList";
	}

}
