<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="${contextPath}/resources/css/login.css?ver=4.4" rel="stylesheet" />
<script type="text/javascript">
function adminLogin(){
	$.ajax({
	  url : "${contextPath}/admin/adminLogin",
	  type : "post",
	  dataType : "json",
	  data : {"adminId" : $("#adminId").val()},
	  success : function(data){
	    if(data == 1){
	      alert("아이디를 다시 입력하세요.");
	      adminId.focus();
	      return false;
	    }else if(data == 0 || data == ""){
	      $("#adminLogin").attr("value", "Y");
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
	
	<div class="login-aside"></div>
	
  <main class="login-main">
  	<div class="login-part">
  		<div class="title-login">관리자 로그인</div>

	    <div id="admin">
	      <form class="login-form-a" action="${contextPath }/admin/adminLogin" method="post" autocomplete="off">
	        <ul>
	          <li class="login-input-wrap">
	            <span class="index_en">Id</span>
	            <input type="text" name="adminId" id="adminId" class="login" placeholder="관리자 아이디 입력" />
	          </li>
	          <li class="login-input-wrap">
	            <span class="index_en">Password</span>
	            <input type="password" name="adminPw" class="login" placeholder="관리자 비밀번호 입력" />
	          </li>
	        </ul>
	        <input type="submit" class="login-btn" value="LOGIN" onclick="adminLogin()" />
	      </form>
	    </div>
   </div>
	</main>
    

</body>
</html>