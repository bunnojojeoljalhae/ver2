<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review best</title>
<link
	href="${pageContext.request.contextPath}/resources/css/best.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript">
	function upViews(writeNo){
		location.href="${contextPath}/review/upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<div class="main">
<!-- 		<div class="line"></div> -->
		<div class="best_wrap">
			<div class="head">
				<a href="${contextPath }/reviewAllList">혼밥 리뷰
					<span class="eng_title"> [HONBAB REVIEW]</span>
				</a>
			</div>
			
			<aside>
				<div class="text">Best Review</div>
			</aside>

			<section class="">
<!-- 				<ul class="index" id="first">
					<li class="no">NO</li>
					<li class="title">TITLE</li>
					<li class="writer">WRITER</li>
					<li class="date">DATE</li>
					<li class="view">VIEWS</li>
				</ul> -->
				<c:if test="${reviewBestList.size() == 0}">
					<li class="">혼밥 식당 후기</li>
				</c:if>
				<c:forEach var="best" items="${reviewBestList }">
					<form>
						<ul class="index">
							<li class="no"></li>
							<li class="title">
								<a onclick="upViews(${best.writeNo}); return false">
									${best.title}
								</a>
							</li>
<%-- 							<li class="writer">${best.nickName}</li> --%>
<%-- 							<li class="date">${best.writeDate}</li>
							<li class="view">${best.views}</li> --%>
							<li class="content">${best.content}</li>
							<li class="go">
				        <div class="content-more">
					        <a href="${contextPath }/noticeView?writeNo=${best.writeNo }">
						        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
										</svg>
					        </a>
				        </div>								
							</li>
														
						</ul>
					</form>
				</c:forEach>
				  
			</section>
		</div>
	</div>
</body>
</html>
