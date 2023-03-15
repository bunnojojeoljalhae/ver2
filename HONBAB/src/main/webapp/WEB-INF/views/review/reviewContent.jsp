<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 글</title>
<link
	href="${pageContext.request.contextPath}/resources/css/review/view.css?ver=4"
	rel="stylesheet" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;700&family=Nunito+Sans:wght@400;600;700&family=Ramabhadra&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function rep() {
 		var repTest = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{10,300}$/;
 		//유효성 검사
 		if(!repTest.test(document.form.comment.value)){
 			alert("댓글 내용을 10자 이상 작성해주세요.");
 			document.form.comment.focus();
 		}
 		else{
 			let form = {};
 			let arr = $("#reply-form").serializeArray(); //해당데이터 직렬화 처리 //[{name: "", value:""}, {name: "", value:""}]
 			for(i=0; i<arr.length; i++){
 				form[arr[i].name] = arr[i].value;
 			}
 			$.ajax({
 				url: "addReply",
 				type: "POST",
 				data: JSON.stringify(form), 	//Ajax 사용하려면 의존성 추가
 									<!-- JSON.stringify(문자열 json타입 변경) -->
 				contentType: "application/json; charset=utf-8",
 				success: function(){
 					alert("댓글이 등록되었습니다.");
 					get_reply();
 				}, error:function(){
 					alert("문제 발생");
 				}
 			})		
 		}	
 	}

 	function get_reply() {
		$.ajax({
			url: "getReply?no="+${reviewContent.writeNo },
/* 			url: "getReply?"+${reviewContent.writeNo }, */
			type: "GET",
			dataType: "json",
			success: function(rep) {	
				let html = "";
				rep.forEach(function(redata) {
					let date = new Date(redata.writeDate)
					let writeDate = date.getFullYear()+"년" +
									(date.getMonth()+1)+"월" +
									date.getDate()+"일"
					html += "<div class='re_wrap'><div id='re' align='left'><b>by. </b>" + redata.replyNick + "님 / "
					html += writeDate + "<br>" 
					html += redata.reply + "</div>"
					html += "<a id='re_del' onclick=del(${reviewContent.writeNo})>댓글 삭제</a></div>";
				/* 	html += "<input type= button value='댓글삭제' id='re_del' onclick=del(${reviewContent.writeNo})></div>"; */
				})
				$("#reply").html(html)
			}, error:function(){
				alert("데이터를 가져올 수 없습니다.");
			}
		})
	} 

	function isLogin(writeNo) {
		var user = '${loginUser}';
		if(user != ''){
			location.href="${contextPath}/review/reviewLike?writeNo="+writeNo;
			return true;	
		} else{
			var goLogin = confirm("로그인이 필요합니다.");
			
			if(goLogin){
				alert("로그인하러 가기");
				location.href="${contextPath}/member/login";
				return false;
				
			}else{
				alert("취소");
				location.href="${contextPath}/review/reviewContent?writeNo="+writeNo;
				return false;
			}
		} 
	}
	
	function del(writeNo){
 		var chk = confirm("삭제");
 		if(chk){
 			location.href='review/deleteReply?writeNo='+writeNo;
 		}
 	}
</script>
</head>
<body onload="get_reply()">

	<c:import url="../main/header.jsp" />

	<main class="read">
		<div class="read-wrap">	
			<ul class="read-ul">
				<li class="read-title">			
					<span id="challenge-title">${reviewContent.title}</span>
				</li>	
				<li class="read-content sec-line">
					<span id="writer">작성자. ${reviewContent.nickName}</span> 
					<span id="write-date">${reviewContent.writeDate}</span> 
				</li>
				<li class="read-content content">
					<textarea class="text" maxlength="999" name="content" disabled="disabled">
						${reviewContent.content}"
					</textarea>
				</li>	
				
				<c:if test="${reviewContent.imgName == 'nan'}">
					<div>
					</div>
				</c:if>
				<c:if test="${reviewContent.imgName != 'nan'}">
					<img
						src="${contextPath }/review/download?imageFileName=${reviewContent.imgName}"
						width="400px" style="float: right" />
				</c:if>
			</ul>
		
			<ul class="read-btn-ul">
				<li class="read-btn like-btn">
					<input type="hidden" id="likeChk" value="${reviewContent.likes }">
					<a class="text-dark heart" style="text-decoration-line: none;" onclick="isLogin(${reviewContent.writeNo})">
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
						<c:out value="${reviewContent.likes}"/> 
					</a>
				</li>
				<li class="read-btn submit-btn">					
					<input type="button" value="목록" onclick="location.href='${contextPath}/review/reviewAllList'">
					<c:if test="${loginUser == reviewContent.id}">
						<!-- 로그인되어있고 , reviewContent.uNickname 과 일치하면 노출-->
						<input type="button" value="삭제" id="delete_btn"
							onclick="location.href='${contextPath}/review/deleteReview?writeNo=${reviewContent.writeNo}&imageFileName=${reviewContent.imgName}'">
						<input type="button" value="수정" id="modify_btn"
							onclick="location.href='${contextPath}/review/reviewModifyForm?writeNo=${reviewContent.writeNo}'">
					</c:if>
				</li>					
			</ul>
		</div>
	</main>

	<section class="reply-sec">
<!-- 		<div class="plus">
			<a>+ 댓글</a>
		</div> -->
		<c:if test="${loginUser != null}">
<!-- 			<div class="panel"> -->
				<form id="reply-form" name="form" method="post" enctype="multipart/form-data">
					<input type="hidden" name="writeNo"	value="${reviewContent.writeNo}">
					<input type="hidden" name="replyId" value="${loginUser}">					
<%-- 					<input type="hidden" name="id" value="${reviewContent.id}">					 --%>
					<div class="rep">
						<span>by. ${loginNick}</span>
						<!-- <span>savedate</span> -->
						<input type="text" id="comment" name="comment"placeholder="10글자 이상 작성" />
						<button type="button" onclick="rep()">
							<img id="enter" src="${contextPath}/resources/img/icon/arrow-return-left.svg">
						</button>
					</div>
					<div class="rep">
						<div id="reply">
							<!-- 해당글에 답변이 있으면 노출 -->
						</div>
					</div>
				</form>
<!-- 			</div> -->
		</c:if>
	</section>

<%-- 	<c:if test="${loginUser != null}">
		<!-- 로그인되어있으면 노출 -->
		<form id="form">
			<input type="hidden" name="writeNo" value="${reviewContent.writeNo}">
			<input type="hidden" name="id" value="${reviewContent.id}">
			<b>작성자 : ${reviewContent.nickName}</b><br> <b>내용</b>
			<textarea id="coment" name="coment" rows="5" cols="30"></textarea>
			<br>
			<button type="button" onclick="rep()">답글 달기</button>
			&nbsp;
		</form>
	</c:if>
 --%>
	<!-- footer -->
<%-- 	<div class="footer">
		<c:import url="../main/footer.jsp" />
	</div>	 --%>
	
<!-- 	<script>
      var plus = document.getElementsByClassName("plus");
      var i;

      for (i = 0; i < plus.length; i++) {
        plus[i].addEventListener("click", 
        	function () {
		      	this.classList.toggle("active");
		        var panel = this.nextElementSibling;
		        if (panel.style.maxHeight) {
		          panel.style.maxHeight = null;
		        } else {
		          panel.style.maxHeight = panel.scrollHeight + "px";
		        }
       		}
        );
      }
  </script> -->

</body>
</html>