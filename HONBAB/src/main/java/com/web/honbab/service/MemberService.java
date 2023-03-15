package com.web.honbab.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.MemberDTO;

public interface MemberService {
	
	public int joinMember(MemberDTO member);
	
	public int idChk(MemberDTO member) throws Exception;

	public int nickNameChk(MemberDTO member) throws Exception;

	public int emailChk(MemberDTO member) throws Exception;

	public int joinNaver(MemberDTO member, HttpServletRequest request) throws IOException, ParseException;

	public int userChk(HttpServletRequest request);
	
	public void getMemberInfo(String id, Model model);

	public String modifyMemInfo(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String dropMember(String id, HttpServletRequest request);
	
	public String getMessage(HttpServletRequest request, String msg, String url);

}
