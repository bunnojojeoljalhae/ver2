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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.honbab.service.AdminService;
import com.web.honbab.service.ChallengeService;
import com.web.honbab.service.MemberService;
import com.web.honbab.service.ReviewService;
import com.web.honbab.session.AdminSession;

@Controller
@RequestMapping("admin")
public class AdminController implements AdminSession {
	
	@Autowired
	private AdminService as;
	@Autowired
	private MemberService ms;
	@Autowired
	private ChallengeService cs;
	@Autowired
	private ReviewService rs;

	@RequestMapping
	public String goAdmin(Model model) {
		return "admin/admin-login";
	}
	
	@RequestMapping("adminHome")
	public String adminHome(@RequestParam("adminId") String adminId, HttpSession session) {
		session.setAttribute(ADMINUSER, adminId);
		return "admin/ADMIndex";
	}
	
	//------------------------------------------
	// 로그인 (관리자)
	//------------------------------------------
	@RequestMapping("adminLogin")
	public String adminLogin(HttpServletRequest request, RedirectAttributes rs) {
		int result = as.adminLogin(request);
		if(result == 0) {
			rs.addAttribute("adminId", request.getParameter("adminId"));
//			return "redirect:successADMLogin";
			return "redirect:successADMLogin";
		}
		return "redirect:adminLogin";
	}
	
	@RequestMapping("successADMLogin")
	public String successADMLogin(@RequestParam("adminId") String adminId, HttpSession session) {
		session.setAttribute(ADMINUSER, adminId);
		return "home";
	}

	//------------------------------------------
	// 회원 정보
	//------------------------------------------
	
	@RequestMapping("userManage")
	public String userManage() {
		return "admin/userBan";
	}
	
	@RequestMapping("userSearch")
	public String userSearch(@RequestParam("id") String id, Model model) {
		ms.getMemberInfo(id, model);
		return "admin/userBan";
	}
	
	@GetMapping("userBan") //회원탈퇴권한 페이지
	public void userBan(@RequestParam("id") String id, HttpServletResponse response, HttpServletRequest request) throws IOException{
		String message = as.userBan(id, request);
		response.setContentType("text/html; charset=utf-8");
		as.userBan(id, request);
		PrintWriter out = response.getWriter();		
		out.println(message);
	}	
	
	@RequestMapping(value = "boardManage") //회원탈퇴권한 페이지
	public String boardManage(Model model, @RequestParam(value="num", required=false, defaultValue="1")int num) {
		cs.challengeAllList(model, num);
		rs.reviewAllList(model, num);
		return "admin/board-manage";
	}	
	
	@GetMapping("deleteChallenge")
	public void deleteChallenge(@RequestParam int writeNo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = as.deleteChallenge(writeNo, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@GetMapping("deleteReview")
	public void deleteReview(@RequestParam int writeNo, @RequestParam String imgName, HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		String message = as.deleteReview(writeNo, imgName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	

	//------------------------------------------
	// 로그아웃
	//------------------------------------------
	@GetMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("adminUser") != null) {
			session.invalidate();
		} 
		return "redirect:/home";
	}	
	
	@RequestMapping("member/info")
	public String info(@RequestParam("id") String id, Model model) {
		ms.getMemberInfo(id, model);
		return "member/info";
	}

}
