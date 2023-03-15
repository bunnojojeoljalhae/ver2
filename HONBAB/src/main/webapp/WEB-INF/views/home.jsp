<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<!-- 수정ㅋㅋㅋ -->
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Main</title>
<link
	href="${contextPath}/resources/css/main.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet" />
</head>
<body>
	<!-- header -->
	<c:import url="main/header.jsp" />

	<main>
		<div class="main_wrap">
			<div id="alone">
				<span><b>*EAT ALONE</b></span>
			</div>
			<img src="${contextPath}/resources/img/main_img_mono.jpg" width="1720px" />
		</div>
	</main>
	
	<article>
		<!-- challenge best -->
		<div class="article-wrap">
			<c:import url="challenge/challengeBest.jsp" />
		</div>

		<!-- review best -->
		<div class="article-wrap">
			<c:import url="review/reviewBest.jsp" />
		</div>
	</article>

	<section class="main-section">
		<div class="section-wrap">
			<span class="main-title">‘혼자 있는 시간’의 힘</span>
			<div class="main-article">
				의도치 않게 외로운 혼밥족이 되었든,<br>
				스스로 원해서 혼밥족이 되었든 홀로 차린 밥상도 밥상이다.<br>
				모두가 맛있고 즐거운 식사를 포기하지 않았으면 한다.
			</div>
			<div class="main-from">
				<span>from. 매일경제 </span>
				<span>혼자의 시대, 나는 무엇으로 사는가…혼밥! 혼술! 혼영!</span>
			</div>
		</div>	
	</section>
	
	<!-- footer -->
	<div class="footer">
		<c:import url="main/footer.jsp" />
	</div>
	
</body>
</html>
