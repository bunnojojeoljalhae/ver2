package com.web.honbab.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.web.honbab.dto.MemberDTO;
import com.web.honbab.mybatis.MemberMapper;
import com.web.honbab.session.MemberSession;

@Service
public class MemberServiceImpl implements MemberService, MemberSession {
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private HttpSession session;
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Override
	public int joinMember(MemberDTO member) {
		try {
			return mapper.joinMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int idChk(MemberDTO id) throws Exception {
		int result = mapper.idChk(id);
		return result;
	}

	@Override
	public int nickNameChk(MemberDTO nickName) throws Exception {
		int result = mapper.nickNameChk(nickName);
		return result;
	}

	@Override
	public int emailChk(MemberDTO email) throws Exception {
		int result = mapper.emailChk(email);
		return result;
	}

//	@Override
//	public String naverLogin(HttpServletRequest request) throws IOException, ParseException {
//	    HttpSession session = request.getSession();
//	    String code = request.getParameter("code");
//	    String state = request.getParameter("state");
//	    
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		apiResult = naverLoginBO.getUserProfile(oauthToken);
//		
//		JSONParser jsonParser = new JSONParser();
//		JSONObject jsonObj;
//		
//		jsonObj = (JSONObject) jsonParser.parse(apiResult);
//		JSONObject responseObj = (JSONObject) jsonObj.get("response");
//		
//		String naverId = (String) responseObj.get("id").toString();
//		String name = (String) responseObj.get("name");
//		String nickName = (String) responseObj.get("nickname");
//		String tel = (String) responseObj.get("mobile");
//		String gender = (String) responseObj.get("gender");
//		String email = (String) responseObj.get("email");
//		
//		session.setAttribute("signIn", apiResult);
//		
////		MemberDTO member = new MemberDTO();
////		int userChk = 0;
////		try {
////			userChk = idChk(member.getId());
////		} catch (Exception e) {
////			e.printStackTrace();
////		}
////			member.setId(naverId);
////			member.setPw("naver-login");
////			member.setName(name);
////			member.setNickName(nickName);
////			member.setTel(tel);
////			member.setGender(gender);
////			member.setEmail(email);
//		
//		try {
////			return mapper.joinMember(member);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return 0;
//		}
//	}
	
	@Override
	public int userChk(HttpServletRequest request) {
		MemberDTO member = mapper.userChk(request.getParameter("id"));
		if(member != null) {
			if(request.getParameter("pw").equals(member.getPw())) {
				session.setAttribute(LOGINNICK, member.getNickName());
				return 0;
			} else {
				request.setAttribute("fail", 1);
			}
		} else if(member == null) {
			if(request.getParameter("pw").equals(""));
				request.setAttribute("pwErr", 1);
		}
		return 1;
	}
	
	@Override
	public void getMemberInfo(String id, Model model) {
		MemberDTO member = mapper.getMemberInfo(id);
		model.addAttribute("info", member);
	}
	
	@Override
	public String modifyMemInfo(MultipartHttpServletRequest mul, HttpServletRequest request) {
		MemberDTO member = new MemberDTO();
		member.setId(mul.getParameter("id"));
		member.setPw(mul.getParameter("pw"));
		member.setName(mul.getParameter("name"));
		member.setNickName(mul.getParameter("nickName"));
		member.setEmail(mul.getParameter("email"));
		member.setGender(mul.getParameter("gender"));
		member.setTel(mul.getParameter("tel"));
		
		int result = 0;
		try {
			result = mapper.modifyMemInfo(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg = "회원 정보를 수정하였습니다.";
			url = "/member/info?id="+member.getId();
		} else {
			msg ="회원 정보 수정에 실패하였습니다. 다시 시도해주세요.";
			url = "/member/modify?id="+member.getId();
		}
		return getMessage(request,msg,url);
	}

	@Override
	public String dropMember(String id, HttpServletRequest request) {
		int result = mapper.dropMember(id);
		String msg, url;
		
		if(result == 1) {
			msg = "회원 탈퇴가 완료되었습니다.";
			url = "/home";
		} else {
			msg ="오류 발생, 탈퇴가 완료되지 않았습니다.";
			url = "/member/memberInfo?id="+id;
		}
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
