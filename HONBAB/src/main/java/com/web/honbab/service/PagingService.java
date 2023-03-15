package com.web.honbab.service;

import org.springframework.ui.Model;

public interface PagingService {
	
	public int[] paging(Model model, int num, int allCount);

}
