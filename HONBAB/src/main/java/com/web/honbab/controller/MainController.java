package com.web.honbab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.honbab.service.ChallengeService;
import com.web.honbab.service.ReviewService;

@Controller
public class MainController {
	
	@Autowired
	private ReviewService rs;
	@Autowired
	private ChallengeService cs;
	
	@RequestMapping(value = "/home")
	public String defalutHome(Model model) {
		rs.reviewBestList(model);
		cs.challengeBestList(model);
		
		return "home";
	}

	
}
