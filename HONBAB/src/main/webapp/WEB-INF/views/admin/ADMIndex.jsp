<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--우상  -->
<c:set var="contextPath" value="${pageContext.request.contextPath }"/> <!-- 우상 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<style type="text/css">
.cd1 {
  padding-top: 2rem;
}
</style>
</head>

<body>
<div class="cd1">

  <h1>사용자 관리</h1>
  <h2>${loginUser} 님 관리자로 로그인하셨습니다.</h2>
  <p>관리자 계정은</p>
  <p>1. 유저 ID 및 사업자 ID삭제가 가능합니다.</p>
  <p>&nbsp;&nbsp;&nbsp;유저 ID 및 사업자 ID삭제시, 해당 ID로 작성한 게시글이 모두 삭제됩니다.</p>
  <p>2. 관리자 ID로 접속시, 사용자의 글과 댓글을 삭제할 수 있습니다.</p>
	
	<div class="logo"><span><a href="${contextPath}/index">HONBOB</a></span></div>
	<div class="logo"><span><a href="${contextPath}/admin/adminBan">User</a></span></div>
	<div class="logo"><span><a href="${contextPath}/admin/board-manage">Board</a></span></div>
	

</div>
</body>
</html>