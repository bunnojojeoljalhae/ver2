	//유효성 검사
	function AllChk() {
		if (!titleChk(ReviewWriteForm.title.value)) {
			return false;
		}
		if (!contentChk(ReviewWriteForm.content.value)) {
			return false;
		}
		return true;
	}

	function titleChk(chkValue) {
		var isTitleRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,100}$/;

		if (chkValue == "") {
			alert("제목을 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		if (!isTitleRegExp.test(chkValue)) {
			alert("제목을 2글자 이상 작성해주세요");
			ReviewWriteForm.title.focus();
			return false;
		}
		return true;
	}

	function contentChk(chkValue) {
		var isContentRegExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,1000}$/;

		if (chkValue == "") {
			alert("내용을 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
		if (!isContentRegExp.test(chkValue)) {
			alert("내용을 2글자 이상 작성해주세요");
			document.ReviewWriteForm.content.focus();
		}
	}// 유효성검사 끝

	function readURL(input) {
		var file = input.files[0]; // 파일 정보
		if (file != "") {
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e) {// 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}