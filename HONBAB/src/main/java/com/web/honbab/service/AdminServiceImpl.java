package com.web.honbab.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.honbab.dto.AdminDTO;
import com.web.honbab.mybatis.AdminMapper;
import com.web.honbab.mybatis.ChallengeMapper;
import com.web.honbab.mybatis.ReviewMapper;
import com.web.honbab.session.AdminSession;

@Service
public class AdminServiceImpl implements AdminService, AdminSession {
	
	@Autowired
	FileService fs;
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private HttpSession session;
	@Autowired
	private ChallengeMapper cMapper;
	@Autowired
	private ReviewMapper rMapper;

	@Override
	public int adminLogin(HttpServletRequest request) {
		AdminDTO admin = mapper.adminLogin(request.getParameter("adminId"));
		if(admin != null) {
			if(request.getParameter("adminPw").equals(admin.getAdminPw())) {
				session.setAttribute(ADMINNICK, admin.getAdminNickName());
				return 0;
			}
		}
		return 1;
	}

	@Override
	public String deleteChallenge(int writeNo, HttpServletRequest request) {
		int result = 0;
		try {
			result = cMapper.deleteChallenge(writeNo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제 완료";
			url = "/admin/boardManage";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/admin/boardManage?writeNo=" + writeNo;
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public String deleteReview(int writeNo, String imgName, HttpServletRequest request) {
		int result = 0;
		try {
			result = rMapper.deleteReview(writeNo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			if (imgName != null) {
				fs.deleteImage(imgName);
			}
			msg = "글 삭제 완료";
			url = "/admin/boardManage";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/admin/boardManage?writeNo=" + writeNo;
		}
		return fs.getMessage(request, msg, url);
	}
	
	@Override
	public String userBan(String id, HttpServletRequest request) {
		int result = mapper.userBan(id);
		String msg, url;
		
		if(result == 1) {
			msg = "회원 삭제";
			url = "/admin/userManage";
		} else {
			msg ="오류 발생, 작업이 완료되지 않았습니다.";
			url = "/admin/userManage";
		}
		mapper.userBan(id);
		return getMessage(request, msg, url);
	}
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		
		return message;
	}

}
