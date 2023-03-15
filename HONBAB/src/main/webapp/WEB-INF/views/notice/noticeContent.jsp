<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 글</title>
<link href="${pageContext.request.contextPath}/resources/css/review/view.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
  rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp"/>
	
	<main class="read">
		<div class="read-wrap">	
			<ul class="read-ul">
				<li class="read-title">
					<span id="challenge-title">${noticeContent.title }</span>
				</li>
				<li class="read-content sec-line">
					<span id="writer">작성자. ${noticeContent.nickName }</span>
					<span id="write-date">${noticeContent.writeDate }</span>
				</li>
				<li class="read-content content">
					<textarea class="text" maxlength="999" name="content" disabled="disabled">
						${noticeContent.content }
					</textarea>
				</li>
				<c:if test="${noticeContent.imgName == 'nan'}">
					<div>
					</div>
				</c:if>
			</ul>
			
			<ul class="read-btn-ul">
				<li class="read-btn submit-btn">
					<input type="button" value="목록" onclick="location.href='${contextPath}/notice/noticeAllList'">
					<c:if test="${noticeContent.id == adminUser}">
						<input type="button" value="삭제" id="delete_btn" 
							onclick="location.href='${contextPath}/notice/deleteNotice?writeNo=${noticeContent.writeNo }&imgName${noticeContent.imgName }'">
						<input type="button" value="수정" id="modify_btn" 
							onclick="location.href='${contextPath}/notice/noticeModifyForm?writeNo=${noticeContent.writeNo }'">
					</c:if>
				</li>
			</ul>
		</div>
	</main>			
		
	<!-- footer -->
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	
	
</body>
</html>