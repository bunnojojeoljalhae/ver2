package com.web.honbab.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.honbab.dto.ChallengeDTO;
import com.web.honbab.mybatis.ChallengeMapper;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	ChallengeMapper mapper;
	@Autowired
	FileService fs;
	@Autowired
	PagingService paging;
	@Autowired
	private HttpSession session;	
	
	@Override
	public void challengeAllList(Model model, int num) {
		int currentPg = num;
		int pageLetter = 8;
		int allCount = mapper.challengePgCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
		model.addAttribute("challengeList", mapper.challengeAllList(start, end));
	}
	
	public void upViews(int writeNo) {
		mapper.upViews(writeNo);
	}
	
	@Override
	public void challengeContent(Model model, int writeNo) {
		model.addAttribute("challengeData", mapper.challengeContent(writeNo));
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
	public String saveChallenge(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ChallengeDTO challenge = new ChallengeDTO();
		challenge.setId(mul.getParameter("id"));
		challenge.setNickName(mul.getParameter("nickName"));
		challenge.setChLevel(mul.getParameter("chLevel"));
		challenge.setTitle(mul.getParameter("title"));
		challenge.setContent(mul.getParameter("content"));
		challenge.setIdx('C');

		MultipartFile file = mul.getFile("imgName");
		if(file.getSize() != 0) {
			challenge.setImgName(fs.saveFile(file));
		} 
		else if(file.isEmpty()) {
			challenge.setImgName("nan");	
		}
		
		int result = 0;
		try {
			result = mapper.saveChallenge(challenge);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "새 글 등록 완료";
			url = "/challenge/challengeAllList";
		} else {
			msg = "새 글 등록 중 문제 발생";
			url = "/challenge/challengeWriteForm";
		}
		return fs.getMessage(request, msg, url);
	}
	
	@Override
	public int challengeLike(int writeNo, Model model) {
		String likeId = (String) session.getAttribute("loginUser");
		int liked = mapper.likeChk(likeId, writeNo);
		int result = 0;

		// 아직 좋아요를 안눌렀고
		if ((liked) == 0) {
			result = mapper.likeUp(writeNo);
			if (result == 1)
				mapper.like(likeId, writeNo);
			// 이미 좋아요를 눌렀고
		} else if ((liked) == 1) {
			result = mapper.likeDown(writeNo);
			if (result == 1)
				mapper.unlike(likeId, writeNo);
		} else
			System.out.println("알 수 없는 오류");
		return result;
	}	

	@Override
	public String modifyChallenge(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ChallengeDTO challenge = new ChallengeDTO();
		challenge.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		challenge.setChLevel(mul.getParameter("chLevel"));
		challenge.setTitle(mul.getParameter("title"));
		challenge.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("imgName");
		
		if(file.getSize() != 0) {	//이미지 변경
			challenge.setImgName(fs.saveFile(file));
			fs.deleteImage(mul.getParameter("originFileName"));
		} else if(file.isEmpty()) { 
			challenge.setImgName(mul.getParameter("originFileName"));
			/* dto.setImgName("nan"); */
		}
		
		int result = 0;
		try { 
			result = mapper.modifyChallenge(challenge);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글 수정 완료";
			url = "/challenge/challengeAllList";
		} else {
			msg = "글 수정 중 문제 발생";
			url = "/challenge/challengeModifyForm?writeNo=" + challenge.getWriteNo();
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public String deleteChallenge(int writeNo, HttpServletRequest request) {
		int result = 0;
		try {
			result = mapper.deleteChallenge(writeNo);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result == 1) {
			msg = "글 삭제 완료";
			url = "/challenge/challengeAllList";
		} else {
			msg = "글 삭제 중 문제 발생";
			url = "/challenge/challengeContent?writeNo=" + writeNo;
		}
		return fs.getMessage(request, msg, url);
	}

	@Override
	public void challengeBestList(Model model) {		
		model.addAttribute("challengeBestList", mapper.challengeBestList());
	}

	@Override
	public void challengeSearch(MultipartHttpServletRequest mul, Model model, int num) {
		int chLevel = Integer.parseInt(mul.getParameter("chLevel"));
		String keyword = mul.getParameter("keyword");
		List<ChallengeDTO> challList = new ArrayList<>();
		
		switch(chLevel) {
		case 1:
			challList = mapper.searchLevelOne(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 2:
			challList = mapper.searchLevelTwo(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 3:
			challList = mapper.searchLevelThree(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 4:
			challList = mapper.searchLevelFour(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 5:
			challList = mapper.searchLevelFive(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 6:
			challList = mapper.searchLevelSix(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 7:
			challList = mapper.searchLevelSeven(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 8:
			challList = mapper.searchLevelEight(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		case 9:
			challList = mapper.searchLevelNine(keyword, chLevel);
			model.addAttribute("challengeList", challList);
			break;
		default:
			System.out.println("검색 중 오류");
			break;
		}
		
		int currentPg = num;
		int pageLetter = 8;
		int allCount = challList.size();
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		
		model.addAttribute("pageLetter", pageLetter);	// 한 페이지당 최대 글 갯수
		model.addAttribute("currentPg", currentPg);		// 현재 페이지
		model.addAttribute("allCount", allCount);		// 작성된 글의 총 갯수
		model.addAttribute("repeat", repeat);			// 마지막 페이지 번호
	}

}
