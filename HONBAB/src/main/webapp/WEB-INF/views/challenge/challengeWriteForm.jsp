<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도전 글 작성</title>
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

	/*  			function login_chk() {
	 if(true){ //로그인 되어있는지 확인
	 alert("로그인 필수")
	 location.href="${contextPath }/member/login";			
	 }
	 } */
	function showPopUp() {
		let width = 500;
		let height = 500;
			
		let left = (window.screen.width / 2) - (width/2);
		let top = (window.screen.height / 4);
			
		let windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		const url = "${contextPath }/challengePop";
		window.open(url, "hello popup", windowStatus);
	}
</script>
</head>
<!-- <body onload="login_chk()"> -->
<body>

	<!-- header -->
	<c:import url="../main/header.jsp" />

	<aside class="write-form-aside">
		<div class="aside_wrap">
			<div class="aside-title">
				<span class="small-title">CHALLENGE</span>
			</div>
<!-- 			<div>
				<span>'도전 혼밥 레벨'</span>
				<span>여기까지 혼밥 해봤다 </span>
			</div> -->
		</div>
	</aside>

	<main class="write">
		<div class="write-form-wrap">
			<form class="write-form" action="${contextPath }/challenge/saveChallenge" enctype="multipart/form-data" method="post">
				<select id="challengeLV" onchange="changeText(this)" name="chLevel">
					<option selected disabled hidden>레벨 선택</option>
					<option value="1">레벨 1</option>
					<option value="2">레벨 2</option>
					<option value="3">레벨 3</option>
					<option value="4">레벨 4</option>
					<option value="5">레벨 5</option>
					<option value="6">레벨 6</option>
					<option value="7">레벨 7</option>
					<option value="8">레벨 8</option>
					<option value="9">레벨 9</option>
				</select>
				<span id="text"></span>
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
				<input type="button" value="목록" onclick="location.href='${contextPath}/challenge/challengeAllList'">
			</form>
		</div>
	</main>

	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	

</body>
<script type="text/javascript">
	function changeText(e) {
		let level = document.getElementById("challengeLV");
		let value = level.options[level.selectedIndex].value;
		let text;
		if (value == "1") {
			text = "편의점에서 먹기 🥡🍙";
		} else if (value == "2") {
			text = "학생 식당이나 구내 식당에서 먹기 🍱🍛";
		} else if (value == "3") {
			text = "패스트푸드점에서 세트메뉴 먹기 🍔🍟🥤";
		} else if (value == "4") {
			text = "분식집, 김밥X국에서 먹기 🍜🍚";
		} else if (value == "5") {
			text = "중국집, 백반집 등 일반 음식점에서 먹기 🥘🥄";
		} else if (value == "6") {
			text = "SNS 맛집에서 먹기🍝🍲";
		} else if (value == "7") {
			text = "패밀리레스토랑에서 먹기 🍴🧆";
		} else if (value == "8") {
			text = "고기집, 횟집에서 먹기 🥩🦪";
		} else if (value == "9") {
			text = "술집에서 혼자 술 마시기 🍺🥃";
		}
		document.getElementById("text").innerText = text;
	}
</script>
</html>