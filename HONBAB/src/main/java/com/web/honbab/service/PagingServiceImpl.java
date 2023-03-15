package com.web.honbab.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PagingServiceImpl implements PagingService {
	
	// 페이징 함수 쿼리에 쓰일 START값, END값 int[1] 배열로 반환, num은 페이지 넘버
	public int[] paging(Model model, int num, int allCount) {
		// page부여
		int pageLetter = 8; // 한 페이지당 글 목록수
		int repeat = allCount / pageLetter; // 마지막 페이지 번호 jsp에서 foreach에 사용할 값, 2/3=0
		if (allCount % pageLetter != 0) // 2/3일 때 마지막 페이지는 1, 5/3일때 마지막페이지는 2
			repeat += 1;
		int end = num * pageLetter; // numDefault는 1, pageLetter는 3 이면 end는 3 // 3의 배수만 나옴
		int start = end + 1 - pageLetter; // 끝번호가 15면 첫번호는 13 이런식

		// block처리
		int block = 3;
		int startPage = (num - 1) / block * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > repeat)
			endPage = repeat;

		model.addAttribute("block", block); // jsp파일에 보낼값
		model.addAttribute("startPage", startPage); // jsp파일에 보낼값
		model.addAttribute("endPage", endPage); // jsp파일에 보낼값
		model.addAttribute("repeat", repeat); // jsp파일에 보낼값

		return new int[] { start, end };
	}
}
