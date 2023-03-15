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
<title>level individual view</title>
<link href="${pageContext.request.contextPath}/resources/css/challenge/view.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
  rel="stylesheet"/>
<!-- script -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function isLogin(writeNo) {
		var user = '${loginUser}';
		if(user != ''){
			location.href="${contextPath}/challenge/challengeLike?writeNo="+writeNo;
			alert("좋아요.");
			return true;	
		} else{
			var goLogin = confirm("로그인이 필요합니다.");
			if(goLogin){
				alert("로그인하러 가기");
				location.href="${contextPath}/member/login";
				return false;
				
			}else{
				alert("취소");
				location.href="${contextPath}/challenge/challengeContent?writeNo="+writeNo;
				return false;
			}
		} 
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp"/>

	<main class="read">
		<div class="read-wrap">	
			<ul class="read-ul">
				<li class="read-title">
					<span id="challenge-level">LV. ${challengeData.chLevel }</span> 
					<span id="slash">/</span>
					<span id="challenge-title">${challengeData.title }</span>
				</li>
				<li class="read-content sec-line">
					<span id="writer">작성자. ${challengeData.nickName }</span>
					<span id="write-date">${challengeData.writeDate }</span>
				</li>
				<li class="read-content content">
					<textarea class="text" maxlength="999" name="content" disabled="disabled">
						${challengeData.content }
					</textarea>
				</li>
				<c:if test="${challengeData.imgName == 'nan'}">
					<div>
					</div>
				</c:if>
			</ul>
			
			<ul class="read-btn-ul">
				<li class="read-btn like-btn">
					<input type="hidden" id="likeChk" value="${challengeData.likes }">
					<a class="text-dark heart" style="text-decoration-line: none;" onclick="isLogin(${challengeData.writeNo})">
						<c:if test="${likeIt == 'yes'}">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="rgb(240, 73, 15)" class="bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
						</c:if>
						<c:if test="${likeIt == 'no'}">			
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="rgb(240, 73, 15)" class="bi bi-heart" viewBox="0 0 16 16">
							  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
						</c:if>												
						<c:out value="${challengeData.likes}"/> 
					</a>
				</li>
				<li class="read-btn submit-btn">
					<input type="button" value="목록" onclick="location.href='${contextPath}/challengeAllList'">
					<c:if test="${challengeData.id == loginUser}">
						<input type="button" value="삭제" id="delete_btn" 
							onclick="location.href='${contextPath}/challenge/deleteChallenge?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
						<input type="button" value="수정" id="modify_btn" 
							onclick="location.href='${contextPath}/challenge/challengeModifyForm?writeNo=${challengeData.writeNo }'">
					</c:if>
				</li>
			</ul>
		</div>
	</main>

	<!-- footer -->
	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	
	
<%-- 	<form id="frm">
		<ul class="ch_title">
			<li>Title :</li>
			<li><b>${challengeData.title }</b></li>
		</ul>
		<ul>
			<li>작성 일자 :</li>
			<li>${challengeData.saveDate }</li>
		</ul>
		<ul>
			<li>작성자 :</li>
			<!-- 추후 닉네임으로 바꿀것 -->
			<li>${challengeData.nickName }</li>
		</ul>
		<hr>
		<div class="content_wrap">
			작성 글 내용
			<div>${challengeData.content }</div>
		</div>
		<hr>
		<c:if test="${challengeData.imgName == 'nan'}">
			<b>첨부된 이미지가 없음</b>
		</c:if>
		<c:if test="${challengeData.imgName != 'nan'}">
			<img src="${contextPath}/download?imgName=${challengeData.imgName }"
				width="200px"></img>
		</c:if>
	</form>

	<div id="like">
		<c:choose>
			<c:when test="${like == 0 || like == null}">
				<!-- 현재는 아무런 데이터가 없는데.. 왜지  기본값 0 줬는데 -->
				<button type="button" class="btn like-btn" id="likeBtn">🤍</button>
				<input type="hidden" id="likeChk" value="${like }">
			</c:when>
			<c:when test="${like == 1}">
				<button type="button" class="btn notLike-btn" id="notLikeBtn">💢</button>
				<input type="hidden" id="likeChk" value="${like }">
			</c:when>
		</c:choose>

	</div>

	<c:if test="${challengeData.id == loginUser }">
		<input type="button" value="글수정"
			onclick="location.href='${contextPath}/challengeModifyForm?writeNo=${challengeData.writeNo }'">
		<input type="button" value="글삭제"
			onclick="location.href='${contextPath}/challengeDelete?writeNo=${challengeData.writeNo }&imgName${challengeData.imgName }'">
	</c:if>

	<input type="button" value="글목록"
		onclick="location.href='${contextPath}/challengeAllList'">

	<c:import url="../main/footer.jsp" /> --%>

</body>
</html>