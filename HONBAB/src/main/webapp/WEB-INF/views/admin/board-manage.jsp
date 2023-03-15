<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 관리</title>
<link href="${contextPath}/resources/css/admin/board-manage.css?ver=4" rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(
	function(){
		$('#review-board').hide();
		$("input[name='board_name']").change(
			function(){
				if($("input[name='board_name']:checked").val() == 'Challenge'){
					$('#challenge-board').show();
					$('#review-board').hide();
				}
				else if($("input[name='board_name']:checked").val() == 'Review'){
					$('#review-board').show();
					$('#challenge-board').hide();
				} 
		});
});

function deletion(writeNo){
		var chk = confirm("삭제");
		if(chk){
			location.href='admin/deleteChallenge?writeNo='+writeNo;
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<c:import url="../main/header.jsp" />
	
  <main class="board-manage-main">
  	<div class="board-part">
<!--   		<div class="title-board-manage">글 관리</div> -->
	    <div class="board-select">
	      <label>
	        <span class="board-label">Challenge 글</span>
	        <input type="radio" name="board_name" value="Challenge" checked="checked" />
	      </label>
	      <label>
	        <span class="board-label">Review 글</span>
	        <input type="radio" name="board_name" value="Review" />
	      </label>
	    </div>
		
			<section>
			<div class="search-wrap">
		    <form id="challenge-search" name="boardSearch" action="${contextPath }/challenge/challengeSearch"	enctype="multipart/form-data" method="post" autocomplete="off">
		        <div class="search">
		          <div id="searchForm">
		          <select id="level" name="level">
		            <option value="challenge">Challenge</option>
		            <option value="review">Review</option>
		          </select>
			          <input type="text" id="keyword" name="keyword" class="searchKey" placeholder="검색어를 입력하세요." />
		    	      <input type="submit" value="검색" />
		          </div>
					</div>
				</form>
			</div>
		</section>
		
		<!-- challenge -->
		<div id="challenge-board">
			<div class="allList-index">
	      <ul class="index-list">
	        <li class="challenge-list write-no"><span>NO</span></li>
	        <li class="challenge-list title"><span>TITLE</span></li>
	        <li class="challenge-list content"><span>CONTENT</span></li>
	        <li class="challenge-list writer"><span>WRITER</span></li>
	        <li class="challenge-list date"><span>DATE</span></li>
	      </ul>
	    </div>
	    
			<c:if test="${challengeBoard.size() == 0 }">
				<tr>
					<td colspan="6">작성된 글이 없습니다.</td>
				</tr>
			</c:if>
	
			<c:forEach var="challenge" items="${challengeList }" varStatus="status">
				<div class="allList-content">
			    <ul class="index-list">
			      <li class="challenge-list write-no">
			      	<c:set var="number" value="${allCount - ((currentPg-1) * pageLetter + status.index)}"/>
			        <span>${number}</span>
			      </li>
			      <li class="challenge-list title">
			        <a onclick="upView(${challenge.writeNo}); return false" href="${contextPath }/challenge/challengeContent?writeNo=${challenge.writeNo }" target="blank">${challenge.title }</a>
			      </li>
			      <li class="challenge-list content">
			      	<span>${challenge.content }</span>
			      </li>
			      <li class="challenge-list writer">
			      	<span>${challenge.nickName }</span>
			      </li>
			      <li class="challenge-list date">
			      	<span>${challenge.writeDate }</span>
			      </li>
			      <li class="challenge-list delete-btn">
							<input type="button" value="삭제" id="delete_btn"
							onclick="location.href='${contextPath}/admin/deleteChallenge?writeNo=${challenge.writeNo}&imageFileName=${challenge.imgName}'">
			      </li>
			    </ul>
			  </div>
			</c:forEach>
		</div>	
		
		<!-- review -->
		<div id="review-board">
			<div class="allList-index">
	      <ul class="index-list">
					<li class="review-list write-no"><span>NO</span></li>
					<li class="review-list title"><span>TITLE</span></li>
	        <li class="review-list content"><span>CONTENT</span></li>					
					<li class="review-list writer"><span>WRITER</span></li>
					<li class="review-list date"><span>DATE</span></li>
				</ul>
			</div>		
			
			<c:forEach var="review" items="${reviewList }">
				<div class="allList-content">
			    <ul class="index-list">
						<li class="review-list write-no">
			      	<c:set var="number" value="${allCount - ((currentPg-1) * pageLetter + status.index)}"/>					
			        <span>${number}</span>
						</li>
						<li class="review-list title">
							<a onclick="upViews(${review.writeNo}); return false" href="${contextPath }/review/reviewContent?writeNo=${review.writeNo }" target="blank">${review.title}</a>
						</li>
						<li class="review-list content"><span>${review.content }</span></li>
						<li class="review-list writer"><span>${review.nickName }</span></li>
						<li class="review-list date"><span>${review.writeDate }</span></li>
						<li class="review-list delete-btn">
							<input type="button" value="삭제" id="del"
								onclick="location.href='${contextPath}/admin/deleteReview?writeNo=${review.writeNo}&imgName=${review.imgName}'">
			      </li>
					</ul>
				</div>
			</c:forEach>		
		</div>

   </div>
	</main>
	
</body>
</html>