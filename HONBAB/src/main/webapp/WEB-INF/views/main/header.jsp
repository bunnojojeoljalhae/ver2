<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link
	href="${contextPath}/resources/css/header.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet" />
</head>
<body>
	<header>
		<div class="user-header">
		
			<div class="logo">
				<span>
					<a href="${contextPath}/home">HONBOB</a>
				</span>
			</div>
			
			<ul class="nav">
				<!-- 공통 메뉴 -->
				<li class="board">
					<a class="eng" id="challenge" href="${contextPath}/challenge/challengeAllList">도전</a>
				</li>
				<li class="board">
					<a class="eng" id="review" href="${contextPath}/review/reviewAllList">리뷰</a>
				</li>
				<li class="board">
					<a class="eng" id="notice" href="${contextPath}/notice/noticeAllList">공지</a>
				</li>
				
				<c:set var="loginUser" value="${loginUser}" />
				<c:set var="adminUser" value="${adminUser}" />
				<c:choose>
					<c:when test="${not empty loginUser || not empty adminUser}">
						<c:if test="${adminUser == null}">
						<li class="user">
							<a id="logout" href="${contextPath }/member/logout">로그아웃</a>
						</li>
						<li class="user">
							<a id="mypage" href="${contextPath }/member/memberInfo?id=${loginUser}">마이페이지</a>
						</li>
							<li class="admin">
								<p id="logout">${loginUser } 님</p>
							</li>		
						</c:if>
						<c:if test="${loginUser == null}">
							<li class="admin">
								<a id="logout" href="${contextPath }/admin/logout">로그아웃</a>
							</li>
							<li class="admin">
								<a id="mypage" href="${contextPath }/admin/userManage">회원 관리</a>
							</li>				
							<li class="admin">
								<a id="logout" href="${contextPath }/admin/boardManage">글 관리</a>
							</li>		
							<li class="admin">
								<p id="logout">${adminUser } 관리자님</p>
							</li>		
						</c:if>						
					</c:when>
					<c:otherwise>
						<li class="user">
							<a id="join" href="${contextPath }/member/join">회원가입</a>
						</li>
						<li class="user">
							<a id="login" href="${contextPath }/member/login">로그인</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 관리자, 회원, 네이버 회원 로그인 안되어있을 때 -->
<%-- 				<c:if test="${loginUser == null || loginUser.equals('')} ">
					<c:if test="${adminUser == null || adminUser == ''} ">
						<li class="user">
							<a id="join" href="${contextPath }/member/join">회원가입</a>
						</li>
						<li class="user">
							<a id="login" href="${contextPath }/member/login">로그인</a>
						</li>
					</c:if>
				</c:if>
					<li class="user">
						<a id="join" href="${contextPath }/member/join">회원가입</a>
					</li>
					<li class="user">
						<a id="login" href="${contextPath }/member/login">로그인</a>
					</li>
			
				<c:if test="${loginUser != null}">
					<li class="user">
						<a id="mypage" href="${contextPath }/member/memberInfo?id=${loginUser}">마이페이지</a>
					</li>
					<li class="user">
						<a id="logout" href="${contextPath }/member/logout">로그아웃</a>
					</li>
				</c:if>
					
				<!-- admin 헤더 -->
				<c:if test="${adminUser != null}">
					<li class="admin">
						<a id="logout" href="${contextPath }/admin/logout">로그아웃</a>
					</li>
					<li class="admin">
						<a id="mypage" href="${contextPath }/admin/userManage">회원 관리</a>
					</li>				
					<li class="admin">
						<a id="logout" href="${contextPath }/admin/boardManage">글 관리</a>
					</li>		
					<li class="admin">
						<a id="logout">관리자 로그인</a>
					</li>		
				</c:if> --%>
			</ul>
				
		</div>
	</header>

</body>
</html>

