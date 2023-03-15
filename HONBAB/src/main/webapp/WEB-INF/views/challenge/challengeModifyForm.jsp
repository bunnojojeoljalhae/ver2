<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도전 글 수정</title>
<link
	href="${pageContext.request.contextPath}/resources/css/challenge/writeForm.css?ver=4"
	rel="stylesheet" />
<%-- <link
	href="${pageContext.request.contextPath}/resources/css/challenge/modify.css?ver=4"
	rel="stylesheet" /> --%>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	// 레벨 선택시 선택창 옆 텍스트 출력
	function challengeLv(e) {
		let level = document.getElementById("challenge");
		let value = level.options[level.selectedIndex].value;

		let text;
		if (value == "1") {
			text = "편의점에서 먹기 🥡";
		} else if (value == "2") {
			text = "학생 식당이나 구내 식당에서 먹기 🍱";
		} else if (value == "3") {
			text = "패스트푸드점에서 세트메뉴 먹기 🍔🍟🥤";
		} else if (value == "4") {
			text = "분식집, 김밥X국에서 먹기 🍜";
		} else if (value == "5") {
			text = "중국집, 백반집 등 일반 음식점에서 먹기 🥘🥄";
		} else if (value == "6") {
			text = "SNS 맛집에서 먹기🍝";
		} else if (value == "7") {
			text = "패밀리레스토랑에서 먹기 🍴🧆";
		} else if (value == "8") {
			text = "고기집, 횟집에서 먹기 🦪";
		} else if (value == "9") {
			text = "술집에서 혼자 술 마시기 🍺";
		}

		document.getElementById("text").innerText = text;
	}

	// 첨부 파일 파일 미리보기
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
			<form action="${contextPath }/challenge/modifyChallenge" enctype="multipart/form-data" method="post">
				<input type="hidden" name="writeNo" value="${challengeData.writeNo }">
				<input type="hidden" name="originFileName" value="${challengeData.imgName }">
				<ul class="write-ul">
					<li class="write-input">
						<span class="write-index">레벨</span> 
						<input type="text" name="chLevel" size="50" value="${challengeData.chLevel }"><span id="text"></span><br>
					</li>
					<li class="write-input">
						<span class="write-index">제목</span> 
						<input type="text" name="title" size="50" value="${challengeData.title }"><br>
					</li>
					<li class="write-input">
						<span class="write-index">작성자</span>
						<input type="hidden" value="${loginUser}" name="id">
						<input type="text" name="nickName" readonly="readonly" value="${challengeData.nickName }" />
					</li>
					<li class="write-input content">
						<span class="write-index">내용</span>
						<textarea maxlength="999" name="content">${challengeData.content }</textarea>
					</li>
					<li class="write-input upload-file">
						<span class="write-index">사진 첨부</span>
						<input type="hidden" name="originFileName" value="${challengeData.imgName }"> <!-- 기존파일삭제시 -->
						<input type="file" name="imgName" onchange="readURL(this)"><br>
						<c:if test="${challengeData.imgName != 'nan'}">
							<img src="${contextPath }/download?imgName=${challengeData.imgName}" id="preview" width="100px">
						</c:if>
						<c:if test="${challengeData.imgName == 'nan'}">
							<img src="#" id="preview" width="100px">
						</c:if>
					</li>
				</ul>

				<input type="submit" value="수정">
				<input type="button" value="목록" onclick="location.href='${contextPath}/challenge/challengeAllList'">
			</form>
		</div>
	</main>

	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	
	

	<%-- 				<p>제목</p>
				<input type="text" name="title" size="50" value="${challengeData.title }"><br>
				<p>내용</p>
				<textarea rows="10" cols="50" name="content">${challengeData.content }</textarea>
				<br> 
				<b>사진 첨부</b> 
				<input type="file" name="imgName" onchange="readURL(this)"><br> 
				<c:if test="${challengeData.imgName != 'nan'}">
					<img src="${contextPath }/download?imgName=${challengeData.imgName}" id="preview" width="100px"><br> <br>
				</c:if>
				<c:if test="${challengeData.imgName == 'nan'}">
					<img src="#" id="preview" width="100px"><br> <br> 
				</c:if>
		
				<input type="submit" value="수정"> &nbsp; 
				<input type="button" value="글목록" onclick="location.href='${contextPath}/challengeAllList'">
			</form>
		</div>
	</div> --%>

</body>
</html>