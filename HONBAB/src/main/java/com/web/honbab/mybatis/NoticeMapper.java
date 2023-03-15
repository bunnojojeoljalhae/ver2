package com.web.honbab.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.honbab.dto.NoticeDTO;

public interface NoticeMapper {
	
	public List<NoticeDTO> noticeAllList(@Param("s")int start, @Param("e")int end);

	public int noticePgCount();
	
	public NoticeDTO noticeContent(int writeNo);
	
	public void upViews(int writeNo);
	
	public int saveNotice(NoticeDTO dto);

	public int modifyNotice(NoticeDTO dto);

	public int deleteNotice(int writeNo);
	
	public int noticeSearchCount();
	
	public List<NoticeDTO> noticeSearch(@Param("keyword") String keyword); 	
	
}
