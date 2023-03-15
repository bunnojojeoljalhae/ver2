package com.web.honbab.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ChallengeService {
	
	public void challengeAllList(Model model, int num);

	public void challengeContent(Model model, int writeNo);

	public String saveChallenge(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String modifyChallenge(MultipartHttpServletRequest mul, HttpServletRequest request);

	public String deleteChallenge(int writeNo, HttpServletRequest request);
	
	public void challengeBestList(Model model);
	
	public int challengeLike(int writeNo, Model model);
	
	public void challengeSearch(MultipartHttpServletRequest mul, Model model, int num);

}
