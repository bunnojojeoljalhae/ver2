<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 글 작성</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
<script type="text/javascript">
	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어옴
			reader.onload = function(e) { // 파일 읽은 결과 표시(성공 시)
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<aside class="write-form-aside">
		<div class="aside_wrap">
			<div class="aside-title">
				<span class="small-title">NOTICE</span>
			</div>
			<div>
			</div>
		</div>
	</aside>

	<main class="write">
		<div class="write-form-wrap">	
			<form id="noticeWrite" name="saveNotice" action="${contextPath }/notice/saveNotice" enctype="multipart/form-data" method="post">
				<ul class="write-ul">
					<li class="write-input">
						<span class="write-index">제목</span>
						<input type="text" placeholder="제목 작성" name="title" />
					</li>
					<li class="write-input">
						<span class="write-index">작성자</span> 
						<input type="hidden" value="${adminUser}" name="id"> 
						<input type="text" name="nickName" readonly="readonly" value="${adminNick}" /> <!-- 임시로 value 닉네임 넣어논 것이니 나중에 로그인 유저 닉네임 받아서 넣을 수 있도록 -->
					</li>
						<li class="write-input content">
						<span class="write-index">내용</span> 
						<textarea maxlength="999" name="content"></textarea>
					</li>
					<li class="write-input upload-file">
						<span class="write-index">사진 첨부</span> 
						<input type="file" name="imgName" onchange="readURL(this)">
						<img src="#" id="preview" width="100px">
					</li>
				</ul>
				<input type="submit" value="저장">
				<input type="button" value="목록" onclick="location.href='${contextPath}/notice/noticeAllList'">
			</form>
		</div>
	</main>	
	
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	
		
</body>
</html>