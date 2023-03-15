function id_check() {
  window.open("idCheck", "", "width=600, height=200, left=200, top=100");
//  window.open("", "", "width=600, height=200, left=200, top=100");
};

function idChk(){
  $.ajax({
    url : "/honbab/member/idChk",
    type : "post",
    dataType : "json",
    data : {"id" : $("#id").val()},
    success : function(data){
      if(data == 1){
        alert("이미 사용 중인 아이디 입니다.");
      }else if(data == 0 || data == ""){
        $("#idChk").attr("value", "Y");
        alert("사용 가능한 아이디입니다.");
      }else {
        alert("아이디를 입력하세요.");
      }
    }
  })
}

function nickNameChk(){
  $.ajax({
    url : "/honbab/member/nickNameChk",
    type : "post",
    dataType : "json",
    data : {"nickName" : $("#nickName").val()},
    success : function(data){
      if(data == 1){
        alert("이미 사용 중인 닉네임 입니다.");
        console.log("중복");
      }else if(data == 0){
        $("#nickNameChk").attr("value", "Y");
        alert("사용 가능한 닉네임입니다.");
        console.log("사용가능");
      }else {
        alert("닉네임을 입력하세요.");
      }
    }
  })
}

function emailChk(){
  $.ajax({
    url : "/honbab/member/emailChk",
    type : "post",
    dataType : "json",
    data : {"email" : $("#email").val()},
    success : function(data){
      if(data == 1){
        alert("이미 사용 중인 이메일입니다.");
      }else if(data == 0){
        $("#emailChk").attr("value", "Y");
        alert("사용 가능한 이메일입니다.");
      }else {
        alert("이메일을 입력하세요.");
      }
    }
  })
}



function joinForm() {
  let id = document.getElementById("id");
  let pw = document.getElementById("pw");
  let repw = document.getElementById("repw");
  let name = document.getElementById("name");
  let nickName = document.getElementById("nickName");
  let tel = document.getElementById("tel");
  let gender = document.getElementById("gender");
  let email = document.getElementById("email");
 
  let idRule = /^[a-zA-Z0-9]+$/;
	let idWordFilter = new Array("admin", "ADMIN", "Admin", "ADmin", "ADMin", "ADMIn", "admiN", "admIN", "adMIN", "aDMIN", "aDMIn", "adMIn", "admIn");
  let pwRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
  let telRule = /^[0-9]+$/;
  let genderRule = gender.options[gender.selectedIndex].value;
  let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  
  if(id.value == "") {
    alert("아이디를 입력하세요.");
    id.focus();
    return false;
  } else if  (!idRule.test(id.value)) {
    alert("아이디는 특수문자를 사용할 수 없습니다.");
    id.focus();
    return false;
  } else if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  }  else if (!pwRule.test(pw.value)) {
    alert("숫자, 문자, 특수 문자 포함한 형태의 8~15자리 이내로 입력하세요.");
    pw.focus();
    return false;
  } else if (repw.value !== pw.value) {
    alert("입력하신 비밀번호가 일치하지 않습니다.");
    repw.focus();
    return false;
  } else if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  } else if (nickName.value == "") {
    alert("닉네임을 입력하세요.");
    name.focus();
    return false;
  } else  if (tel.value == "") {
    alert("전화번호를 입력하세요.");
    tel.focus();
    return false;
  } else if (!telRule.test(tel.value)) {
    alert("숫자만 입력해주세요.");
    tel.focus();
    return false;
  } else if (genderRule == "") {
    alert("성별을 선택하세요.");
    return false;
  } else if (email.value == "") {
    alert("이메일 주소를 입력하세요.");
    email.focus();
	return false;
	};

  //입력 값 전송
  document.getElementById('register_form').submit();
  //유효성 검사의 포인트   
};