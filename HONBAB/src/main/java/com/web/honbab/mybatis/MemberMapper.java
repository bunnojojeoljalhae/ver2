package com.web.honbab.mybatis;

import java.util.ArrayList;


import com.web.honbab.dto.MemberDTO;

public interface MemberMapper {
	
	public int joinMember(MemberDTO member);
	
	public int idChk(MemberDTO member) throws Exception;

	public int nickNameChk(MemberDTO member) throws Exception;

	public int emailChk(MemberDTO member) throws Exception;

	public int joinNaver(MemberDTO member);
	
	public MemberDTO userChk(String id);
	
	public ArrayList<MemberDTO> memberInfo();

	public MemberDTO getMemberInfo(String id);

	public int modifyMemInfo(MemberDTO dto);

	public int dropMember(String id);

}
