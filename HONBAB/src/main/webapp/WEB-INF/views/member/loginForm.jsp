<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${contextPath}/resources/css/login.css?ver=4.4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
function idChk(){
	$.ajax({
	  url : "${contextPath}/member/userChk",
	  type : "post",
	  dataType : "json",
	  data : {"id" : $("#id").val()},
	  success : function(data){
	    if(data == 1){
	      alert("아이디를 다시 입력하세요.");
	      id.focus();
	      return false;
	    }else if(data == 0 || data == ""){
	      $("#userChk").attr("value", "Y");
	      alert("비밀번호를 입력하세요.");
	    } else {
	      alert("아이디를 입력하세요.");
	    }
	  }
	})
}
</script>
</head> 
<body>
	
	<div class="login-header">
		<div class="login-inner-header">
			<div class="logo">
				<span>
					<a href="${contextPath}/home">HONBOB</a>
				</span>
			</div>
		</div>
	</div>
	
<%-- 	<c:import url="../main/header.jsp"/> --%>
	
	<div class="login-aside"></div>
	
  <main class="login-main">
  	<div class="login-part">
  		<div class="title-login">로그인</div>
			
	    <div id="personal">
	      <form class="login-form-p" action="${contextPath }/member/userChk"  method="post" autocomplete="off">
	        <ul>
	          <li class="login-input-wrap">
	            <span class="index_en">Id</span>
	            <input type="text" name="id" id="id" class="login" placeholder="아이디 입력" />
	          </li>
	          <li class="login-input-wrap">
	            <span class="index_en">Password</span>
	            <input type="password" name="pw" id="pw" class="login" placeholder="비밀번호 입력" />
	          </li>
	        </ul>

	      	<input type="submit" class="login-btn" value="LOGIN" onclick="userChk(); return false;" />
	    	</form>
				
				<div class="naver-login-btn" >
					<a onclick="location.href='${naverUrl}'" style="cursor: pointer;">
						<img id="naver-btn" width="34" src="${pageContext.request.contextPath}/resources/img/button/btnG_아이콘사각.png"/>
					</a>
					<a href="${contextPath}/member/naver_login" style="cursor: pointer;">
						<span>네이버로 로그인하기</span>
					</a>
				</div>
<%-- 				<form action="${contextPath }/naver_login" class="naver-login" method="post">
				</form> --%>   
				<div class="go-join">
					<span>아이디가 없으세요? </span>
					<a href="${contextPath}/member/join"> 가입하기</a>
				</div>
	    </div>
   </div>
	</main>
    
	<!-- footer -->
	<c:import url="../main/footer.jsp"/>

</body>
</html>