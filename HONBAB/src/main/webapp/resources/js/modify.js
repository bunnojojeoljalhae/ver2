function nickNameChk(){
  $.ajax({
    url : "/honbab/member/nickNameChk",
    type : "post",
    dataType : "json",
    data : {"nickName" : $("#nickName").val()},
    success : function(data){
      if(data == 1){
        alert("중복된 닉네임입니다.");
        console.log("중복");
      }else if(data == 0){
        $("#nickNameChk").attr("value", "Y");
        alert("사용가능한 닉네임입니다.");
        console.log("사용가능");
      }else {
        alert("닉네임을 입력해주세요.");
      }
    }
  })
}

function infoModifyChk() {
  var pw = document.getElementById("pw");
  var nickName = document.getElementById("nickName");
 
  var pwCheck = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
  
  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  } else if (!pwCheck.test(pw.value)) {
    alert("숫자, 문자, 특수 문자 포함한 형태의 8~15자리 이내로 입력하세요.");
    id.focus();
    return false;
  } else if (nickName.value == "") {
    alert("닉네임을 입력하세요.");
    name.focus();
    return false;
	};

  //입력 값 전송
  document.getElementById('modify-form').submit(); //유효성 검사의 포인트   
};