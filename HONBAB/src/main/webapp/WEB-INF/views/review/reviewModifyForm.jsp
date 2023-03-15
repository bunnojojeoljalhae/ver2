<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글 수정</title>
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
	//유효성 검사
	function AllChk() {
		if (!titleChk(ReviewWriteForm.title.value)) {
			return false;
		}
		if (!contentChk(ReviewWriteForm.content.value)) {
			return false;
		}
		return true;
	}

	function titleChk(chkValue) {
		var isTitleRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,100}$/;

		if (chkValue == "") {
			alert("제목을 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		if (!isTitleRegExp.test(chkValue)) {
			alert("제목을 2글자 이상 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		return true;
	}

	function contentChk(chkValue) {
		var isContentRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,1000}$/;

		if (chkValue == "") {
			alert("내용을 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
		if (!isContentRegExp.test(chkValue)) {
			alert("내용을 2글자 이상 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
	}// 유효성검사 끝

	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e) {// 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
</head>
<body>

	<c:import url="../main/header.jsp" />

	<aside>
		<div class="aside_wrap">
		<div class="honbab">
			<span>REVIEW</span>
		</div>
			<div class="text">
				<span>리뷰</span>
				<div>글쓰세요</div>
				<div>글은 알아서 쓰세요 설명같은 짧은 글임</div>
			</div>
		</div>
		<div class="innerfooter">
			<c:import url="../main/footer.jsp" />
		</div>
	</aside>

	<main>
		<div class="main_wrap">
			<form name="ReviewWriteForm"
				action="${contextPath}/review/review_modify"
				enctype="multipart/form-data" method="post" onsubmit="AllChk()">
				<ul>
					<li>
						<span class="index_kr">작성자</span>
						<input type="hidden" name="writeNo" value="${reviewContent.writeNo}"> <!-- 쿼리문(where)에 쓸거 -->
						<input type="text" name="nickname" value="${reviewContent.nickname}" readonly>
					</li>
					<hr />
					<div class="line"></div>
					
					<li>
						<span class="index_kr">제목</span>
						<input type="text" name="title" value="${reviewContent.title}">
					</li>
					<hr />
					<div class="line"></div>
					
					<li class="content">
						<span class="index_kr">내용</span>
						<textarea maxlength="999" name="content">${reviewContent.content}</textarea>
					</li>
					<hr />
					<div class="line"></div>
					
					
					<li class="upload_file">
						<span class="index_kr">사진 첨부</span>
					 	<input type="hidden" name="originFileName" value="${reviewContent.imgName }"> <!-- 기존파일삭제시 -->
					 	<input type="file" name="image_file_name" onchange="readURL(this)">
						<img src="${contextPath }/download?imageFileName=${reviewContent.imgName}"
						id=preview width="100px" height="100px"></li>
						
					<hr />
					<div class="line"></div>
				</ul>
				<input type="submit" value="수정"> 
				<input type="button"
					value="목록" onclick="location.href='${contextPath }/review/reviewAllList'">
				
			</form>
		</div>
	</main>


	<%-- <b>작성자 not null</b>
	<br>
	<input type="text" name="nickname" value="${reviewContent.nickname}"
		readonly>
	<br>
	<b>제 목 not null</b>
	<br>
	<input type="text" name="title" value="${reviewContent.title}">
	<br>
	<br>
	<b>내 용 not null</b>
	<br>
	<textarea cols="20" rows="5" name="content">${reviewContent.content}</textarea>
	<br>
	<b>파일 첨부</b>
	<br>
	<input type="file" name="image_file_name" onchange="readURL(this)">
	<b>이미지 미리보기</b>
	<img
		src="${contextPath }/download?imageFileName=${reviewContent.imgName}"
		id=preview width="100px" height="100px">
	<br>
	<br>
	<input type="submit" value="수정완료">
	<input type="button" value="글목록"
		onclick="location.href='${contextPath }/boardAllList'">
 --%>
</body>
</html>