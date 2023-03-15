<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<aside class="write-form-aside">
		<div class="aside_wrap">
			<div class="aside-title">
				<span class="small-title">NOTICE</span>
			</div>
		</div>
	</aside>
	
	<main class="write">
		<div class="write-form-wrap">
			<form action="${contextPath }/notice/modifyNotice" enctype="multipart/form-data" method="post">
				<input type="hidden" name="writeNo" value="${noticeContent.writeNo }">
				<input type="hidden" name="originFileName" value="${noticeContent.imgName }">
				<ul class="write-ul">
					<li class="write-input">
						<span class="write-index">제목</span> 
						<input type="text" name="title" size="50" value="${noticeContent.title }"><br>
					</li>
					<li class="write-input">
						<span class="write-index">작성자</span>
						<input type="hidden" value="${loginUser}" name="id">
						<input type="text" name="nickName" readonly="readonly" value="${noticeContent.nickName }" />
					</li>
					<li class="write-input content">
						<span class="write-index">내용</span>
						<textarea maxlength="999" name="content">${noticeContent.content }</textarea>
					</li>
					<li class="write-input upload-file">
						<span class="write-index">사진 첨부</span>
						<input type="hidden" name="originFileName" value="${noticeContent.imgName }"> <!-- 기존파일삭제시 -->
						<input type="file" name="imgName" onchange="readURL(this)"><br>
						<c:if test="${noticeContent.imgName != 'nan'}">
							<img src="${contextPath }/download?imgName=${noticeContent.imgName}" id="preview" width="100px">
						</c:if>
						<c:if test="${noticeContent.imgName == 'nan'}">
							<img src="#" id="preview" width="100px">
						</c:if>
					</li>
				</ul>

				<input type="submit" value="수정">
				<input type="button" value="목록" onclick="location.href='${contextPath}/notice/noticeAllList'">
			</form>
		</div>
	</main>

	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>		
	
</body>
</html>