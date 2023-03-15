package com.web.honbab.dto;

/*
<id property="writeNo" column="WRITE_NO" />
<result property="chLevel" column="CH_LEVEL" />
<result property="title" column="TITLE" />
<result property="content" column="CONTENT" />
<result property="nickName" column="NICKNAME" />
<result property="saveDate" column="SAVE_DATE" />
<result property="views" column="VIEWS" />
<result property="imgName" column="IMGNAME" />
<result property="likes" column="LIKES" />
<result property="id" column="ID" />
*/

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChallengeDTO {
	
	private int writeNo;
	private String id;
	private String nickName;
	private String chLevel;
	private String title;
	private String content;
	private int views;
	private String writeDate;
	private String imgName;
	private int likes;
	private char idx;
	
	private ChallengeLikeDTO challengeLikeDTO;

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

	public String getChLevel() {
		return chLevel;
	}

	public void setChLevel(String chLevel) {
		this.chLevel = chLevel;
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

	public ChallengeLikeDTO getChallengeLikeDTO() {
		return challengeLikeDTO;
	}

	public void setChallengeLikeDTO(ChallengeLikeDTO challengeLikeDTO) {
		this.challengeLikeDTO = challengeLikeDTO;
	}


}
