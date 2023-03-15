<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/join.css?ver=2" rel="stylesheet"/>	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function test() {
    if (!confirm("정말 탈퇴하시겠습니까?")) {
        alert("취소되었습니다.");
    } else {
    	window.location.href ='${contextPath}/member/delete?id=${info.id }';
    }
}
</script>
</head>
<body>
	<!-- header -->
	<div class="join-header">
		<div class="join-inner-header">
			<div class="logo">
				<span>
					<a href="${contextPath}/home">HONBOB</a>
				</span>
			</div>
		</div>
	</div>
	
	<div class="join-aside"></div>
		
  <main class="join-main">
		<div class="join-main-inner">
	  	<div class="title-join">회원 정보</div>
  		
			<div class="join-form-wrap">
				<form class="join_form">
					<ul>
						<li class="join-input">
							<span class="index">아이디</span>
							<input type="text" value="${info.id }" disabled>
						</li>
						<li class="join-input">
							<span class="index">비밀번호</span>
							<input type="password" value="${info.pw }" disabled>
						</li>
						<li class="join-input">
							<span class="index">이름</span>
							<input type="text" value="${info.name }" disabled>
						</li>
						<li class="join-input">
							<span class="index">닉네임</span>
							<input type="text" value="${info.nickName }" disabled>
						</li>
						<li class="join-input">
							<span class="index">전화번호</span>
							<input type="text" value="${info.tel }" disabled>
						</li>
<%-- 						<li class="join-input">
							<span class="index">거주지</span>
							<input type="text" value="${info.region }" disabled>
						</li> --%>
						<li class="join-input">
							<span class="index">성별</span>
							<input type="text" value="${info.gender }" disabled>
						<li class="join-input">
							<span class="index">이메일</span>
							<input type="text" value="${info.email }" disabled>
						</li>
					</ul>
					
					<c:if test="${loginUser == info.id }">
					<button type="button" id="modi" onclick="location.href='${contextPath}/member/modify?id=${loginUser}'">수정</button>
					<button type="button" onclick="test();">탈퇴</button>
					</c:if>
				</form>
			</div>
	
		</div>
	</main>

</body>
</html>