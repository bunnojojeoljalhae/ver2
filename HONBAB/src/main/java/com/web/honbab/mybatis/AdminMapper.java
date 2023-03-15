package com.web.honbab.mybatis;

import com.web.honbab.dto.AdminDTO;

public interface AdminMapper {

	public AdminDTO adminLogin(String adminId);

	public int userCount();
	
	public int userBan(String id);

}
