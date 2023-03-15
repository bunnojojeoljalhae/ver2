<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link
	href="${contextPath}/resources/css/challenge/allList.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function reviewWirte() {
		var user = '${loginUser}';
		if(user != ''){
			location.href="reviewWriteForm";			
		} else{
			alert("로그인 후 작성 가능합니다.")
		} 
	}
	
	function upViews(writeNo){
		location.href="upViews?writeNo=" + writeNo;
	}
	
	function getSearchValue() {
		reviewSearch.option.value = "<%=request.getParameter("option")%>";
		reviewSearch.keyword.value = "<%=request.getParameter("keyword")%>";
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />

	<section>
		<div class="search-wrap">	
			<form id="review-search" name="reviewSearch" action="${contextPath }/review/reviewSearch"	enctype="multipart/form-data" method="post">
				<div class="search">
					<div id="searchForm">
							<select id="option" name="option">
								<option value="title">제목으로 검색</option>
								<option value="nickName">닉네임으로 검색</option>
							</select>
							<input type="text" name="keyword" id="text" class="searchKey" placeholder="검색어를 입력하세요." autocomplete="off">
							<input type="submit" value="검색">
					</div>
				</div>
			</form>
		</div>		
	</section>
	
	<main>
		<div class="allList-index">
      <ul class="index-list">
				<li class="write-no"><span>NO</span></li>
				<li class="ch-title"><span>TITLE</span></li>
				<li class="writer"><span>WRITER</span></li>
				<li class="date"><span>DATE</span></li>
				<li class="view"><span>VIEWS</span></li>
			</ul>
		</div>

		<c:if test="${reviewAllList.size() == 0}">
			<tr>
				<td colspan="6">작성된 글이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="review" items="${reviewList}" varStatus="status">
			<div class="allList-content">
		    <ul class="index-list">
					<li class="write-no">
		      	<c:set var="number" value="${allCount - ((currentPg-1) * pageLetter + status.index)}"/>					
		        <span>${number}</span>
					</li>
					<li class="ch-title">
						<a onclick="upViews(${review.writeNo}); return false" href="${contextPath }/review/reviewContent?writeNo=${review.writeNo }">
							${review.title}
						</a>
					</li>
					<li class="writer"><span>${review.nickName }</span></li>
					<li class="date"><span>${review.writeDate }</span></li>
					<li class="view"><span>${review.views }</span></li>
				</ul>
			</div>
		</c:forEach>

		<c:set var="no" value="${no - 1}"></c:set>
		<c:set var="loginUser" value="${loginUser}" />
		<c:if test="${loginUser != null}">
			<div id="write-btn">
				<input type="button" value="글쓰기" onclick="reviewWirte()">
			</div>
		</c:if>
		
		<div class="paging">
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="${contextPath }/review/reviewAllList?num=${num}">${num}</a>
			</c:forEach>
		</div>
	</main>
	
	<!-- footer -->
	<c:import url="../main/footer.jsp" />
	
</body>
</html>