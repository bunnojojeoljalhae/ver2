package com.web.honbab.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.ReviewReplyDTO;

public interface ReviewService {

	public void reviewAllList(Model model, int num);
	
	public void upViews(int writeNo);

	public void reviewContent(int writeNo, Model model);

	String saveReview(MultipartHttpServletRequest mul, HttpServletRequest request);

	String modifyReview(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	String deleteReview(int writeNo, String imageFileName, HttpServletRequest request);

	public void reviewBestList(Model model);

	public void addReply(@RequestBody Map<String, Object> map);

	public List<ReviewReplyDTO> getReply(int writeNo);
	
	public int reviewLike(int writeNo, Model model);

	public void reviewSearch(MultipartHttpServletRequest mul, Model model, int num);
	
	public boolean deleteReply(int writeNo);

}
