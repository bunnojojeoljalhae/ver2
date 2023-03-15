package com.web.honbab.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.dto.ReviewDTO;
import com.web.honbab.dto.ReviewReplyDTO;

public interface ReviewMapper {

	public List<ReviewDTO> reviewAllList(@Param("s") int start, @Param("e") int end);
	
	public int reviewCount();

	public void upViews(int writeNo);

	public ReviewDTO reviewContent(int writeNo);

	public int saveReview(ReviewDTO dto) ;

	public int modifyReview(ReviewDTO dto);

	public int deleteReview(int writeNo);

	public List<ReviewDTO> reviewBestList();
	
	public int likeChk(@Param("likeId") String likeId, @Param("writeNo") int writeNo); 
	public int likeUp(@Param("writeNo") int writeNo);
	public int likeDown(@Param("writeNo") int writeNo);
	public int like(@Param("likeId") String likeId, @Param("writeNo") int writeNo);
	public int unlike(@Param("likeId") String likeId, @Param("writeNo") int writeNo);
	
	public int reviewSearchCount();
	public List<ReviewDTO> searchByTitle(@Param("keyword") String keyword, @Param("s") int start, @Param("e") int end);
	public List<ReviewDTO> searchByNick(@Param("keyword") String keyword, @Param("s") int start, @Param("e") int end);

	public void addReply(ReviewReplyDTO reply);
	
	public List<ReviewReplyDTO> getReply(int writeNo);

	public boolean deleteReply(int writeNo);



}
