package com.web.honbab.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.ReviewDTO;
import com.web.honbab.dto.ReviewReplyDTO;
import com.web.honbab.mybatis.ReviewMapper;
import com.web.honbab.session.FindSession;

@Service
public class ReviewServiceImpl implements ReviewService, FindSession {

	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private FileService fs;
	@Autowired
	private HttpSession session;

	@Override
	public void reviewAllList(Model model, int num) {
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper.reviewCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;		
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
		model.addAttribute("reviewList", mapper.reviewAllList(start, end));
	}

	@Override
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}

	@Override
	public void reviewContent(int writeNo, Model model) {
		model.addAttribute("reviewContent", mapper.reviewContent(writeNo));
		upViews(writeNo);
		model.addAttribute("likeIt", "no");
		String likeId = (String) session.getAttribute("loginUser");

		if (likeId != null) {
			int liked = mapper.likeChk(likeId, writeNo);

			if ((liked) == 1) {
				model.addAttribute("likeIt", "yes");
			}
		}
	}

	@Override
	public int reviewLike(int writeNo, Model model) {
		String likeId = (String) session.getAttribute("loginUser");
		int liked = mapper.likeChk(likeId, writeNo);
		int result = 0;

		if ((liked) == 0) {
			result = mapper.likeUp(writeNo);
			if (result == 1)
				mapper.like(likeId, writeNo);
		} else if ((liked) == 1) {
			result = mapper.likeDown(writeNo);
			if (result == 1)
				mapper.unlike(likeId, writeNo);
		} else
			System.out.println("알 수 없는 오류");
		return result;
	}

	@Override
	public String saveReview(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ReviewDTO review = new ReviewDTO();
		review.setId(mul.getParameter("id"));
		review.setNickName(mul.getParameter("nickName"));
		review.setTitle(mul.getParameter("title"));
		review.setContent(mul.getParameter("content"));
		review.setIdx('R');

		MultipartFile file = mul.getFile("imgName");
		if (file.getSize() != 0) {
			review.setImgName(fs.saveFile(file));
			System.out.println("이미지 저장");
		} else {
			review.setImgName("nan");
			System.out.println("이미지 없음");
		}

		int result = 0;
		try {
			result = mapper.saveReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg, url;
		if (result == 1) {
			msg = "새 글 등록 완료";
			url = "/review/reviewAllList";
		} else {
			msg = "새 글 등록 중 문제 발생";
			url = "/review/reviewWriteForm";
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public String modifyReview(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ReviewDTO review = new ReviewDTO();
		review.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		review.setTitle(mul.getParameter("title"));
		review.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("imgName");

		if (file.getSize() != 0) {
			review.setImgName(fs.saveFile(file));
			fs.deleteImage(mul.getParameter("originFileName"));
		} else {
			review.setImgName(mul.getParameter("originFileName"));
		}
		System.out.println(review.getImgName());
		int result = 0;
		try {
			result = mapper.modifyReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg, url;
		if (result == 1) {
			msg = "글 수정 완료";
			url = "/review/reviewContent?writeNo=" + review.getWriteNo();
		} else {
			msg = "글 수정 중 문제 발생";
			url = "/review/reviewModifyForm?writeNo=" + review.getWriteNo();
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public String deleteReview(int writeNo, String imgName, HttpServletRequest request) {
		int result = mapper.deleteReview(writeNo);
		String msg, url;

		if (result == 1) {
			if (imgName != null) {
				fs.deleteImage(imgName);
			}
			msg = "글 삭제 완료";
			url = "/review/reviewAllList";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/review/reviewContent?writeNo=" + writeNo;
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public void reviewBestList(Model model) {
		model.addAttribute("reviewBestList", mapper.reviewBestList());
	}

	@Override
	public void reviewSearch(MultipartHttpServletRequest mul, Model model, int num) {
		String keyword = mul.getParameter("keyword");
		String select = mul.getParameter("option");
		List<ReviewDTO> reviewList = new ArrayList<>();
		
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper.reviewSearchCount(); // 전체 글수
		int repeatTitle = allCount/pageLetter; // 마지막 페이지 번호
		int repeatNick = allCount/pageLetter; // 마지막 페이지 번호
		
		if(allCount % pageLetter != 0)
			repeatTitle += 1;
		if(allCount % pageLetter != 0)
			repeatNick += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;

		switch (select) {
		case "title":
			reviewList = mapper.searchByTitle(keyword, start, end); // Title로 설정해서 검색한 전체 글수
			model.addAttribute("reviewContent", reviewList);
			model.addAttribute("repeat", repeatTitle);			// 마지막 페이지 번호
			break;
		case "nickName":
			reviewList = mapper.searchByNick(keyword, start, end); // Nick으로 설정해서 검색한 전체 글수
			model.addAttribute("reviewContent", reviewList);
			model.addAttribute("repeat", repeatNick);			// 마지막 페이지 번호
			break;
		default:
			System.out.println("검색 중 오류");
			break;
		}
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
	}
	
	@Override
	public void addReply(@RequestBody Map<String, Object> map) {
		ReviewReplyDTO reply = new ReviewReplyDTO();
		reply.setIdx('R');
		System.out.println(reply.getIdx());
		reply.setReplyId((String) session.getAttribute("loginUser"));
		System.out.println(reply.getReplyId());
		reply.setReplyNick((String) session.getAttribute("loginNick"));
		System.out.println(reply.getReplyNick());
		reply.setReply((String) map.get("comment"));
		System.out.println(reply.getReply());
		reply.setWriteNo(Integer.parseInt((String) (map.get("writeNo"))));
		System.out.println(reply.getWriteNo());
		
		mapper.addReply(reply);
	}
	
	@Override
	public List<ReviewReplyDTO> getReply(int writeNo) {
		return mapper.getReply(writeNo);
	}

	@Override
	public boolean deleteReply(int writeNo) {
		return mapper.deleteReply(writeNo);
	}

}
