<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 삭제</title>
<link href="${contextPath}/resources/css/admin/user-ban.css?ver=4" rel="stylesheet" />
<%-- <link href="${contextPath}/resources/css/admin/board-manage.css?ver=4" rel="stylesheet" /> --%>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deleteId() {
		if (!confirm("작성한 아이디의 회원을 탈퇴시키겠습니까?")) {
			alert("취소");
		} else {			
			alert("탈퇴 완료");
			let form = document.getElementById("form");
			form.submit();
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

  <main class="board-manage-main">
  	<div class="board-part">
			<section>
  		<div class="user-find">
  			<span>회원 찾기</span>
  		</div>
				<div class="search-wrap">
			    <form id="challenge-search" name="userSearch" action="${contextPath}/admin/userSearch" method="post" autocomplete="off">
			      <div class="search">
							<input type="text" name="id" id="keyword" placeholder="회원 아이디로 찾기">
		    	    <input type="submit" value="검색" />
						</div>
					</form>
				</div>
			</section>
		
		<div class="result">
			<div class="re-t">
				<span>검색 결과</span>
			</div>
			<c:if test="${info.id == null }">
				해당 아이디가 없습니다.
			</c:if>	
			<c:if test="${info.id != null }">
			<ul class="user-info">
				<li class="result-id">
					<a title="회원 상세 정보 확인" onclick="window.open('${contextPath }/member/memberInfo?id=${info.id}','상세 회원 정보','width=1500, height=850, top=100, left=180, location=no,status=no,scrollbars=yes, toolbar=no, resize=no');">${info.id}</a>
				</li>
				<li class="btn" onclick="deleteId();">
					<form action="${contextPath}/admin/userBan" id="form" method="get">
						<input type="button" value="탈퇴" id="drop"> 
					</form>
				</li>			
			</ul>
			</c:if>	
		</div>
		
		<%-- <div class="cd1">
			<table border="1" width="500px">
				<tr>
					<td><br><span style="color: green; font-weight: bold;">
							회원 강제 탈퇴(${generalDelete.id })</span>
						<form action="${contextPath}/admin/userBan" id="form"  method="get">
							<br> -회원 아이디- 
							<input type="text" name="id" placeholder="탈퇴시킬 아이디입력">
							<br>
							<br> 
							<input type="button" value="삭제" onclick="deleteId();"> 
							<br>
							<br>
						</form></td>
				</tr>
			</table>
		
			</div> --%>
	</div>
	</main>

	<!-- footer -->
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	
	
</body>
</html>