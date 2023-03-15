<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글 작성</title>
<!-- 수정 11.09 -->
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

	<!-- header -->
	<c:import url="../main/header.jsp" />

	<aside class="write-form-aside">
		<div class="aside_wrap">
			<div class="aside-title">
				<span class="small-title">REVIEW</span>
			</div>
<!-- 			<div>
				<span>'혼밥 식당 리뷰'</span>
				<span>여기까지 혼밥 해봤다 </span>
			</div> -->
		</div>
	</aside>

	<main class="write">
		<div class="write-form-wrap">
			<form class="write-form" name="ReviewWriteForm" action="${contextPath}/review/saveReview" enctype="multipart/form-data" method="post" onsubmit="AllChk()">
				<!-- input 작성자id(세션), 글쓴이nick(세션), 제목, 게시글내용, 이미지 -->
				<!-- other 조회수(controller), 게시글번호(sql-seq), 작성일자(sql-default), 좋아요(content-button),-->
				<ul class="write-ul">
					<li class="write-input">
						<span class="write-index">제목</span>
						<input type="text" placeholder="제목 작성" name="title" />
					</li>
					<li class="write-input">
						<span class="write-index">작성자</span> 
						<input type="hidden" value="${loginUser}" name="id"> 
						<input type="text" name="nickName" readonly="readonly" value="${loginNick}" /> <!-- 임시로 value 닉네임 넣어논 것이니 나중에 로그인 유저 닉네임 받아서 넣을 수 있도록 -->
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

				<input type="submit" value="저장" /> 
				<input type="button" value="목록" onclick="location.href='${contextPath}/reviewAllList'">
			</form>
		</div>
	</main>
	
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>
		
</body>
</html>