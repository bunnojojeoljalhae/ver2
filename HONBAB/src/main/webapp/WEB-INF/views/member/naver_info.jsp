<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜 로그인 info</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/home.css?ver=4" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<c:import url="../main/header.jsp"/>
	
	<div class="join_form_wrap">
	<h1 align="center">소셜 로그인 회원 정보</h1>
		<form class="join_form">
			<ul>
<%-- 				
					<span class="index">비밀번호</span>
					<input type="text" value="${info.pw }" disabled>
				</li> --%>
				<li>
					<span class="index">아이디</span>
					<input type="text" value="${info.id }" readonly>
				</li>
				<li>
				<li>
					<span class="index">이름</span>
					<input type="text" value="${info.name }" disabled>
				</li>
				<li>
					<span class="index">닉네임</span>
					<input type="text" value="${info.nickName }" disabled>
				</li>
				<li>
					<span class="index">전화번호</span>
					<input type="text" value="${info.tel }" disabled>
				</li>
				<li>
					<span class="index">출생년도</span>
					<input type="text" value="${info.region }" disabled>
				</li>
				<li>
					<span class="index">생일</span>
					<input type="text" value="${info.region }" disabled>
				</li>
				<li>
					<span class="index">성별</span>
					<input type="text" value="${info.gender }" disabled>
				<li>
					<span class="index">이메일</span>
					<input type="text" value="${info.email }" disabled>
				</li>
				<li>
				
				<button onclick="window.open('${contextPath}/member/modifyForm?id=${loginUser}');">수정</button>
				
				<button type="button" onclick="test();">삭제</button>
				</li>
			</ul>
		</form>
	</div>

	<c:import url="../main/footer.jsp"/>


</body>
</html>