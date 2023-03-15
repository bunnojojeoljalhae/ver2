<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/join.css?ver=2" rel="stylesheet"/>	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">$.getScript( '../resources/js/modify.js');</script>
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
	  	<div class="title-join">회원 정보 수정</div>
	
			<div class="join-form-wrap">
				<form class="join-form" id="modify-form" action="modifyMemInfo" enctype="multipart/form-data" method="post">
					<ul>
						<li class="join-input">
							<span class="index">Id</span>
							<input type="text" id="id" class="modify-input" name="id"value="${info.id}" readonly>
						</li>
						<li class="join-input">
							<span class="index">Password</span>
							<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
						</li>
						<li class="join-input">
							<span class="index">Name</span>
								<input type="text" id="name" class="modify-input" name="name" value="${info.name}" readonly> 
						</li>
						<li class="join-input">
							<span class="index">Nick Name</span>
							<input type="text" id="nickName" name="nickName" value="${info.nickName}">
							<button type="button" class="repeat-chk" name="check" onclick="nickNameChk(); return false;">중복확인</button>
						</li>
						<li class="join-input">
							<span class="index">Tel</span>
							<input type="tel" id="tel" class="modify-input" name="tel" value="${info.tel}" readonly>
						</li>
<%-- 						<li class="join-input address">
							<span class="index">Address</span>
							<c:import url="../member/region.jsp"/>
						</li> --%>
						<li class="join-input">
							<span class="index">Gender</span>
<!-- 							<select id="gender" name="gender" size="1">
								<option value="">성별</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select> -->
							<input type="tel" id="tel" class="modify-input" name="tel" value="${info.gender}" readonly>
						</li>
						<li class="join-input">
							<span class="index">Email</span>
							<input type="text" id="email" class="modify-input" name="email" value="${info.email}" readonly>
						</li>
					</ul>
					
					<button type="button" name="modify" onclick="infoModifyChk(); return false;"> 수정</button>
				</form>
			</div>
	
		</div>
	</main>	
	
<%-- 	<c:import url="../main/footer.jsp"/> --%>
</body>
</html>