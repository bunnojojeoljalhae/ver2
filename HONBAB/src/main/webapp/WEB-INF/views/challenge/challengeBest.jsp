<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeBest</title>
<link
	href="${pageContext.request.contextPath}/resources/css/best.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
</head>
<body>
  <div class="main">
    <div class="best_wrap">
      <div class="head">
				<a href="${contextPath }/challenge/challengeAllList">도전 혼밥
      		<span class="eng_title"> [LEVEL CHALLENGE]</span>
      	</a>
      </div>
      <aside>
        <div class="best-title">Best Challenge</div>
			</aside>

      <section class="">
<!--           <ul class="index" id="first">
            <li class="no">NO</li>
            <li class="title">TITLE</li>
            <li class="writer">WRITER</li>
            <li class="date">DATE</li>
            <li class="view">VIEWS</li>
          </ul> -->
	      <c:if test="${challengeBestList.size() == 0}">
					<li class="">혼밥 레벨 도전</li>
				</c:if>
 
				<c:forEach var="best" items="${challengeBestList }" >        
	        <form>
	          <ul class="index">
<%-- 	              <li class="no">${best.writeNo}</li> --%>
	            <li class="no">레벨 ${best.chLevel}</li>
	            <li class="title">
	            	<a href="${contextPath }/challenge/challengeContent?writeNo=${best.writeNo }">
	            		${best.title}
	            	</a>
	            </li>
              <li class="content">${best.content}</li>
<%-- 	            <li class="writer">by. ${best.nickName}</li> --%>
<%--               <li class="date">${best.writeDate}</li> --%>
<%-- 	              <li class="view">${best.views}</li> --%>
							<li class="go">
				        <div class="content-more">
					        <a href="${contextPath }/challenge/challengeContent?writeNo=${best.writeNo }">
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