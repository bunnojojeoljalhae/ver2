package com.web.honbab.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.dto.ChallengeDTO;

public interface ChallengeMapper {
	
	public List<ChallengeDTO> challengeAllList(@Param("s")int start, @Param("e")int end);

	public int challengePgCount();

	public int upViews(int writeNo);

	public ChallengeDTO challengeContent(int writeNo);

	public int saveChallenge(ChallengeDTO dto);
	
	public int modifyChallenge(ChallengeDTO dto);
	
	public int deleteChallenge(int writeNo);
	
	public List<ChallengeDTO> challengeBestList(); 
	
	public int likeChk(@Param("likeId") String likeId, @Param("writeNo") int writeNo); 
	public int likeUp(@Param("writeNo") int writeNo);
	public int likeDown(@Param("writeNo") int writeNo);
	public int like(@Param("likeId") String likeId, @Param("writeNo") int writeNo);
	public int unlike(@Param("likeId") String likeId, @Param("writeNo") int writeNo);	
	
	public int challengeSearchCount();
	
	public List<ChallengeDTO> searchLevelOne(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelTwo(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelThree(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelFour(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelFive(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelSix(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelSeven(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelEight(@Param("keyword") String keyword, @Param("chLevel") int level); 
	public List<ChallengeDTO> searchLevelNine(@Param("keyword") String keyword, @Param("chLevel	") int level);

}
