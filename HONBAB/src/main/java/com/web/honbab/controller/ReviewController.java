package com.web.honbab.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.ReviewReplyDTO;
import com.web.honbab.service.FileService;
import com.web.honbab.service.ReviewService;
import com.web.honbab.session.MemberSession;
import com.web.honbab.session.FindSession;

@Controller
@RequestMapping("review")
public class ReviewController implements MemberSession, FindSession {

	@Autowired
	private ReviewService rs;

	@RequestMapping(value = "reviewAllList")
	public String reviewAllList(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			HttpSession session) {
		session.removeAttribute(SEARCHOPTION);
		session.removeAttribute(SEARCHKEYWORD);
		rs.reviewAllList(model, num);
		return "review/reviewAllList";
	}

	@RequestMapping(value = "upViews")
	public String upViews(@RequestParam int writeNo) {
		rs.upViews(writeNo);
		return "redirect:reviewContent?writeNo=" + writeNo;
	}

	@RequestMapping(value = "reviewWriteForm")
	public String reviewWriteForm(Model model) {
		return "review/reviewWriteForm";
	}

	@PostMapping("/saveReview")
	public void saveReview(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String message = rs.saveReview(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	@RequestMapping(value = "reviewContent")
	public String reviewContent(@RequestParam int writeNo, Model model) {
		rs.reviewContent(writeNo, model);
		return "review/reviewContent";
	}

	@GetMapping("reviewModifyForm")
	public String reviewModifyForm(@RequestParam int writeNo, Model model) {
		rs.reviewContent(writeNo, model);
		return "review/reviewModifyForm";
	}

	@PostMapping("modifyReview")
	public void modifyReview(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String message = rs.modifyReview(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@GetMapping("deleteReview")
	public void deleteReview(@RequestParam int writeNo, @RequestParam String imgName, HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		String message = rs.deleteReview(writeNo, imgName, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}

	@GetMapping("download")
	public void download(@RequestParam String imgName, HttpServletResponse response) throws Exception {
		response.addHeader("Context-disposition", "attachment; fileName=" + imgName);
		File file = new File(FileService.IMAGE_REVIEW + "\\" + imgName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}


	@GetMapping(value = "reviewLike")
	public String reviewLike(@RequestParam int writeNo, Model model) {
		int result = rs.reviewLike(writeNo, model);
		if (result == 1)
			return "redirect:reviewContent?writeNo=" + writeNo;
		else
			return "redirect:reviewContent?writeNo=" + writeNo;
	}

	@RequestMapping(value = "reviewSearch")
	public String reviewSearch(MultipartHttpServletRequest mul, Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num) throws IOException {
		rs.reviewSearch(mul, model, num);
		return "review/reviewAllList";
	}
	
	@PostMapping(value = "addReply", produces = "applacition/json; charset=utf-8")
	@ResponseBody // JSON{\"result\":true} 요거쓰려면 상단에 @RestController 작성하거나 아니면 해당메서드에
	// @ResponeseBody 요거작성해야함
	public String addReply(@RequestBody Map<String, Object> map) {
		
		rs.addReply(map);
		return "{\"result\":true}";
	}
	
	@GetMapping(value = "getReply?no={writeNo}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ReviewReplyDTO> getReply(@PathVariable int writeNo) {
		return rs.getReply(writeNo);
	}
	
	@GetMapping(value = "deleteReply")
	// @ResponseBody
	public String deleteReply(@RequestParam(value = "writeNo") int writeNo, Model model) {
		model.addAttribute("writeNo", writeNo);
		rs.deleteReply(writeNo);
		return "redirect:/review/reviewContent?writeNo=" + writeNo;
	}

}
