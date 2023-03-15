package com.web.honbab.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
CREATE TABLE REPLY (
WRITE_GROUP VARCHAR(1) NOT NULL,
REPLY_NO NUMBER(10) PRIMARY KEY,
NICKNAME VARCHAR2(20) NOT NULL,
REPLY VARCHAR2(1000) NOT NULL,
REPLY_DATE DATE DEFAULT SYSDATE NOT NULL
CONSTRAINT FK_REPLY FOREIGN KEY(WRITE_GROUP) REFERENCES REVIEW(IDX) ON DELETE CASCADE
);
*/

public class ReviewReplyDTO {

	private char idx;
	private String replyId;
	private String replyNick;
	private String reply;
	private String writeDate;
	private String replyNo;
	private int writeNo;
	
	
	public char getIdx() {
		return idx;
	}

	public void setIdx(char idx) {
		this.idx = idx;
	}
	
	public String getReplyId() {
		return replyId;
	}
	
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}


	public String getReplyNick() {
		return replyNick;
	}

	public void setReplyNick(String replyNick) {
		this.replyNick = replyNick;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReply() {
		return reply;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		SimpleDateFormat smallFormat = new SimpleDateFormat("YYYY-MM-dd");
		this.writeDate = smallFormat.format(writeDate);
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

}
