package com.web.honbab.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.NoticeDTO;
import com.web.honbab.mybatis.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	@Autowired
	private FileService fs;

	@Override
	public void noticeAllList(Model model, int num) {
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper.noticePgCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
		model.addAttribute("noticeList", mapper.noticeAllList(start, end));
	}

	@Override
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}

	@Override
	public void noticeContent(Model model, int writeNo) {
		model.addAttribute("noticeContent", mapper.noticeContent(writeNo));
		upViews(writeNo);
	}

	@Override
	public String saveNotice(MultipartHttpServletRequest mul, HttpServletRequest request) {
		NoticeDTO notice = new NoticeDTO();
		notice.setId(mul.getParameter("id"));
		notice.setNickName(mul.getParameter("nickName"));
		notice.setTitle(mul.getParameter("title"));
		notice.setContent(mul.getParameter("content"));
		notice.setIdx('N');

		MultipartFile file = mul.getFile("imgName");
		if(file.getSize() != 0) {
			notice.setImgName(fs.saveFile(file));
		} 
		else if(file.isEmpty()) {
			notice.setImgName("nan");	
		}
		
		int result =  0;
		try {
			result = mapper.saveNotice(notice);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지 등록 완료";
			url ="/notice/noticeAllList";
		} else {
			msg ="공지 등록 중 문제 발생";
			url ="/notice/noticeWriteForm";
		}
		return getMessage(request, msg, url);
	}
	
	@Override
	public String modifyNotice(MultipartHttpServletRequest mul, HttpServletRequest request) {
		NoticeDTO notice = new NoticeDTO();
		notice.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));

		MultipartFile file = mul.getFile("imgName");
		if(file.getSize() != 0) {	//이미지 변경
			notice.setImgName(fs.saveFile(file));
			fs.deleteImage(mul.getParameter("originFileName"));
		} else if(file.isEmpty()) { 
			notice.setImgName(mul.getParameter("originFileName"));
			/* dto.setImgName("nan"); */
		}
		
		int result =  0;
		try {
			result = mapper.modifyNotice(notice);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지 수정 완료";
			url ="/notice/noticeAllList";
		} else {
			msg ="공지 수정 중 문제 발생";
			url ="/notice/noticeContent?writeNo=" + notice.getWriteNo();
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public String deleteNotice(int writeNo, HttpServletRequest request) {
		int result =  0;
		try {
			result = mapper.deleteNotice(writeNo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg,url;
		if(result == 1) {
			msg ="공지 삭제 완료";
			url ="/notice/noticeAllList";
		} else {
			msg ="공지 삭제 중 문제 발생";
			url ="/notice/noticeContent?writeNo=" + writeNo;
		}
		return getMessage(request, msg, url);
	}

	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script> alert('" + msg +"');";
		message += "location.href='" + path + url + "';</script>";
		return message;
	}
	
	@Override
	public void noticeSearch(MultipartHttpServletRequest mul, Model model, int num) {
		String keyword = mul.getParameter("keyword");
		List<NoticeDTO> noticeList = new ArrayList<>();
		noticeList = mapper.noticeSearch(keyword);
		model.addAttribute("noticeList", noticeList);
		
		int allCount = mapper.noticeSearchCount();
		int currentPg = num;
		int pageLetter = 8;
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호		
	}
	
}
