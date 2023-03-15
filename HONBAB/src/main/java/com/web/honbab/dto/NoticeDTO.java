package com.web.honbab.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	
	private int writeNo;
	private String id;
	private String nickName;
	private String title;
	private String content;
	private int views;
	private String writeDate;
	private String imgName;
	private char idx;

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getWriteDate() {
		return writeDate;
	}
	
	public void setWriteDate(Timestamp writeDate) {
		SimpleDateFormat smallFormat = new SimpleDateFormat("YYYY-MM-dd");
		this.writeDate = smallFormat.format(writeDate);
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public char getIdx() {
		return idx;
	}

	public void setIdx(char idx) {
		this.idx = idx;
	}

}
