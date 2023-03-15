package com.web.honbab.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.honbab.dto.MemberDTO;
import com.web.honbab.service.ChallengeService;
import com.web.honbab.service.MemberService;
import com.web.honbab.service.NaverLoginBO;
import com.web.honbab.service.ReviewService;
import com.web.honbab.session.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private ReviewService rs;
	@Autowired
	private ChallengeService cs;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	//------------------------------------------
	// 회원가입
	//------------------------------------------
	@RequestMapping("/join")
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "/naver_login", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinNaverForm(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		System.out.println(naverAuthUrl);
		
		return "member/loginForm";
	}
	
	@RequestMapping("/joinMember")
	public String joinMember(MemberDTO member) {
		int result = ms.joinMember(member);
		if(result == 1) {
			return "redirect:login";
		}
		return "redirect:join";
	}
	
	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberDTO member) throws Exception {
	  int result = ms.idChk(member);
	  return result;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value="/nickNameChk", method = RequestMethod.POST)
	public int nickNameChk(MemberDTO member) throws Exception {
	  int result = ms.nickNameChk(member);
	  return result;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailChk", method = RequestMethod.POST)
	public int emailChk(MemberDTO member) throws Exception {
		int result = ms.emailChk(member);
		return result;
	}

	@RequestMapping(value = "/naver_login/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinNaver(MemberDTO member, HttpServletRequest request) throws Exception {
		int result = ms.joinNaver(member, request);
		if(result == 1) {
			return "redirect:login";
		}
		return "redirect:join";
	}

	//------------------------------------------
	// 로그인 (일반 회원)
	//------------------------------------------
	@GetMapping("login")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("userChk")
	public String login(HttpServletRequest request, RedirectAttributes ra) {
		int result = ms.userChk(request);
		if(result == 0) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, HttpSession session, Model model) {
		session.setAttribute(LOGINUSER, id);
		rs.reviewBestList(model);
		cs.challengeBestList(model);
		return "home";
	}

	//------------------------------------------
	// 로그아웃
	//------------------------------------------
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		} 
		return "redirect:/home";
	}
	
	//------------------------------------------
	// 회원 정보
	//------------------------------------------
	@RequestMapping("/memberInfo")
	public String getMemberInfo(@RequestParam("id") String id, Model model) {
		ms.getMemberInfo(id, model);
		return "member/memberInfo";
	}

	@RequestMapping("modify")
	public String modifyForm(@RequestParam("id") String id, Model model) {
		ms.getMemberInfo(id, model);
		model.addAttribute("id", id);
		return "member/modifyForm";
	}
	
	@PostMapping("modifyMemInfo")
	public void modifyMemInfo(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException{
		String message = ms.modifyMemInfo(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("dropMember")
	public void dropMember(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request) throws IOException{
		String message = ms.dropMember(id, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@RequestMapping("/callback")
	public String callback() {
		return "redirect:join";
	}


}
