package com.web.honbab.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	
	public static final String IMAGE_CHALLENGE = "D:\\proj\\IMG_REPO\\challenge";
	public static final String IMAGE_REVIEW = "D:\\proj\\IMG_REPO\\review";
	public static final String IMAGE_NOTICE = "D:\\proj\\IMG_REPO\\notice";
	
	public String getMessage(HttpServletRequest request, String msg, String url);

	public String saveFile(MultipartFile file);
	
	public void deleteImage(String originFileName);

}
