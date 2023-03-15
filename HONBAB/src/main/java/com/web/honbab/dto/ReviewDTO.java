package com.web.honbab.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
CREATE TABLE REVIEW_BOARD(
    WRITE_NO NUMBER(10) PRIMARY KEY,
    NICKNAME VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    VIEWS NUMBER(10) DEFAULT 0,
    WRITE_DATE DATE DEFAULT SYSDATE,
    IMGNAME VARCHAR2(1000),
    LIKES NUMBER(10) DEFAULT 0,
    ID VARCHAR(100) NOT NULL,
    IDX VARCHAR(1) NOT NULL
);

CREATE SEQUENCE REVIEW_BOARD_SEQ INCREMENT BY 1 MAXVALUE 1000;
*/

public class ReviewDTO {

	private int writeNo;
	private String id;
	private String nickName;
	private String title;
	private String content;
	private int views;
	private String writeDate;
	private String imgName;
	private int likes;
	private char idx;

	private ReviewLikeDTO reviewLikeDTO;

	public ReviewLikeDTO getReviewLikeDTO() {
		return reviewLikeDTO;
	}

	public void setReviewLikeDTO(ReviewLikeDTO reviewLikeDTO) {
		this.reviewLikeDTO = reviewLikeDTO;
	}

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

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public char getIdx() {
		return idx;
	}

	public void setIdx(char idx) {
		this.idx = idx;
	}


}
