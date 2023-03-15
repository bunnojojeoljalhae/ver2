<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<link href="${contextPath}/resources/css/challenge/allList.css?ver=4.4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script type="text/javascript">
	function user_check() {
		var user = '${adminUser}';
		if(user != ''){
			location.href="noticeWriteForm";			
		} else{
			alert("공지 작성 불가")
		} 
	}
	
	function upViews(writeNo){
		location.href="upViews?writeNo=" + writeNo;
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp"/>
	
	<section>
		<div class="search-wrap">
	    <form id="challengeSearch" name="noticeSearch" action="${contextPath }/notice/noticeSearch"	enctype="multipart/form-data" method="post" autocomplete="off">
	        <div class="search">
	          <div id="searchForm">
	          	<div id="searchOption">제목으로 검색</div>
		          <input type="text" name="keyword" id="keyword" class="searchKey" placeholder="검색어를 입력하세요." />
	    	      <input type="submit" value="검색" />
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
	
		<c:if test="${noticeList.size() == 0 }">
			<tr>
				<td colspan="6">작성된 글이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="notice" items="${noticeList }" varStatus="status">
			<div class="allList-content">
			  <ul class="index-list">
			    <li class="write-no">
			      <c:set var="number" value="${allCount - ((currentPg-1) * pageLetter + status.index)}"/>
			      <span>${number}</span>
			    </li>
			    <li class="ch-title">
			      <a onclick="upView(${notice.writeNo}); return false" href="${contextPath }/notice/noticeContent?writeNo=${notice.writeNo }">${notice.title }</a>
			    </li>
			    <li class="writer"><span>${notice.nickName }</span></li>
			    <li class="date"><span>${notice.writeDate }</span></li>
			    <li class="view"><span>${notice.views }</span></li>
			  </ul>
			</div>
		</c:forEach>
		
		<c:set var="no" value="${no - 1}"></c:set>
		<!-- 어드민 아이디로만 가능하게 -->
		<c:if test="${adminUser != null}">
			<div id="write-btn">
				<input type="button" onclick="user_check()" value="글쓰기" >
			</div>
		</c:if>
	
		<div class="paging">
			<c:forEach var="num" begin="1" end="${repeat }">
				<a href="${contextPath }/noticeAllList?num=${num}">${num}</a>
			</c:forEach>
		</div>
	</main>
	
	<!-- footer -->
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	

</body>
</html>