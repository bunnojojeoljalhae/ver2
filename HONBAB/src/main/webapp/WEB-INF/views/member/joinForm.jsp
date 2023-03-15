<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<link href="${contextPath}/resources/css/join.css?ver=8" rel="stylesheet"/> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">$.getScript( '../resources/js/register.js');</script>
</head>
<body>

	<c:import url="../main/form_header.jsp"/>
	
	<div class="join-aside"></div>
	
  <main class="join-main">
	<div class="join-main-inner">
  	<div class="title-join">회원가입</div>
  	
  	<div class="join-form-wrap">
			<form class="join-form" id="register_form" action="joinMember" method="post">
				<ul>
					<li class="join-input">
						<span class="index">Id</span>
						<input type="text" id="id" name="id" placeholder="아이디를 입력하세요." autocomplete="off">
						<button type="button" class="repeat-chk" name="check" onclick="idChk(); return false;">중복확인</button>
					</li>
					<li class="join-input">
						<span class="index">Password</span>
						<input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요." autocomplete="off">
					</li>
					<li class="join-input">
						<span class="index">Password Check</span>
						<input type="password" id="repw" name="repw" placeholder="비밀번호를 재입력하세요." autocomplete="off">
					</li>
					<li class="join-input">
						<span class="index">Name</span>
							<input type="text" id="name" name="name" placeholder="이름을 입력하세요." autocomplete="off"> 
					</li>
					<li class="join-input">
						<span class="index">Nick Name</span>
						<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요." autocomplete="off"> 
						<button type="button" class="repeat-chk" name="check" onclick="nickNameChk(); return false;">중복확인</button>
					</li>
					<li class="join-input">
						<span class="index">Tel</span>
						<input type="tel" id="tel" name="tel" placeholder="01012345678" autocomplete="off">
					</li>
<%-- 					<li class="join-input address">
						<span class="index">Address</span>
						<c:import url="../member/region.jsp"/>
					</li> --%>
					<li class="join-input gender">
						<span class="index">Gender</span>
						<select id="gender" name="gender" size="1">
							<option value="">성별</option>
							<option value="F">여자</option>
							<option value="M">남자</option>
						</select>
					</li>
					<li class="join-input">
						<span class="index">Email</span>
						<input type="text" id="email" name="email" placeholder="example@mail.com" autocomplete="off">
						<button type="button" class="repeat-chk" name="check" onclick="emailChk(); return false;">중복확인</button>
					</li>
				</ul>
				<button type="button" name="join" onclick="joinForm(); return false;"> JOIN</button>
			</form>
  	</div>	
  		
	</div>
	</main>
				
<%-- 	<footer>
		<c:import url="../main/footer.jsp"/>
	</footer> --%>
</body>
</html>