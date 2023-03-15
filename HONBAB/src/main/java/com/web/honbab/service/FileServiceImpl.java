package com.web.honbab.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceImpl implements FileService {
	
	@Override
	public String getMessage(HttpServletRequest request, String msg, String url) {
		String message = null;
		String path = request.getContextPath();
		message = "<script>alert('" + msg + "');";
		message += "location.href='" + path + url + "';</script>";
		
		return message;
	}

	@Override
	public String saveFile(MultipartFile file) {
		//파일이름에 저장날짜 삽입하기
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = format.format(calendar.getTime());
		if(!file.isEmpty())
		sysFileName += file.getOriginalFilename();
		File saveFile = new File(IMAGE_CHALLENGE  + "/" + sysFileName);
		saveFile.setWritable(true);
		saveFile.setReadable(true);
		
		//실제로 파일이 저장되는 명령문 arg로는 파일 경로와 이름을 전달
		try {
			
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}

	@Override
	public void deleteImage(String originFileName) {
		File file = new File(IMAGE_CHALLENGE + "\\" + originFileName);
		file.delete();
	}

}
