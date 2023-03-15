package com.web.honbab.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {

	private int userNo;
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String tel;
	private String gender;
	private String email;
	private String joinDate;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY년 MM월 dd일");
		this.joinDate = dateFormat.format(joinDate);
	}

}
