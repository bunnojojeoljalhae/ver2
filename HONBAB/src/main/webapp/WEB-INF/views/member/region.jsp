<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function disabled(){
	$("#Seoul").prop('disabled',true);
	$("#Gyeonggi").prop('disabled',true);
	$("#Incheon").prop('disabled',true);
	$("#Busan").prop('disabled',true);
	$("#Daegu").prop('disabled',true);
	$("#Gwangju").prop('disabled',true);
	$("#Daejeon").prop('disabled',true);
	$("#Ulsan").prop('disabled',true);
	$("#Sejong").prop('disabled',true);
	$("#Gangwon").prop('disabled',true);
	$("#Gyeongnam").prop('disabled',true);
	$("#Gyeongbuk").prop('disabled',true);
	$("#Jeonnam").prop('disabled',true);
	$("#Jeonbuk").prop('disabled',true);
	$("#Chungnam").prop('disabled',true);
	$("#Chungbuk").prop('disabled',true);
	$("#Jeju").prop('disabled',true);
}
function hide(){
	$('#Seoul').hide(); 
	$('#Gyeonggi').hide(); 
	$('#Incheon').hide(); 
	$('#Busan').hide(); 
	$('#Daegu').hide(); 
	$('#Gwangju').hide(); 
	$('#Daejeon').hide(); 
	$('#Ulsan').hide(); 
	$('#Sejong').hide(); 
	$('#Gangwon').hide(); 
	$('#Gyeongnam').hide(); 
	$('#Gyeongbuk').hide();  
	$('#Jeonnam').hide();  
	$('#Jeonbuk').hide();  
	$('#Chungnam').hide(); 
	$('#Chungbuk').hide(); 
	$('#Jeju').hide(); 
}

$(document).ready(function(){
		hide();
		$("select[name='city']").change(function(){
			disabled();
			hide();
			if($("select[name='city']").val() == 'Seoul'){
				$("#Seoul").prop('disabled',false);
				$('#Seoul').show();
			} else if($("select[name='city']").val() == 'Gyeonggi'){
				$("#Gyeonggi").prop('disabled',false);
				$('#Gyeonggi').show(); 
			}  else if($("select[name='city']").val() == 'Incheon'){
				$("#Incheon").prop('disabled',false);
				$('#Incheon').show(); 
			}  else if($("select[name='city']").val() == 'Busan'){
				$("#Busan").prop('disabled',false);
				$('#Busan').show(); 
			}  else if($("select[name='city']").val() == 'Daegu'){
				$("#Daegu").prop('disabled',false);
				$('#Daegu').show(); 
			}  else if($("select[name='city']").val() == 'Gwangju'){
				$("#Gwangju").prop('disabled',false);
				$('#Gwangju').show(); 
			}  else if($("select[name='city']").val() == 'Daejeon'){
				$("#Daejeon").prop('disabled',false);
				$('#Daejeon').show(); 
			}  else if($("select[name='city']").val() == 'Ulsan'){
				$("#Ulsan").prop('disabled',false);
				$('#Ulsan').show(); 
			}  else if($("select[name='city']").val() == 'Sejong'){
				$("#Sejong").prop('disabled',false);
				$('#Sejong').show(); 
			}  else if($("select[name='city']").val() == 'Gangwon'){
				$("#Gangwon").prop('disabled',false);
				$('#Gangwon').show(); 
			} else if($("select[name='city']").val() == 'Gyeongnam'){
				$("#Gyeongnam").prop('disabled',false);
				$('#Gyeongnam').show(); 
			} else if($("select[name='city']").val() == 'Gyeongbuk'){
				$("#Gyeongbuk").prop('disabled',false);
				$('#Gyeongbuk').show();  
			} else if($("select[name='city']").val() == 'Jeonnam'){
				$("#Jeonnam").prop('disabled',false);
				$('#Jeonnam').show();  
			} else if($("select[name='city']").val() == 'Jeonbuk'){
				$("#Jeonbuk").prop('disabled',false);
				$('#Jeonbuk').show();  
			} else if($("select[name='city']").val() == 'Chungnam'){
				$("#Chungnam").prop('disabled',false);
				$('#Chungnam').show(); 
			} else if($("select[name='city']").val() == 'Chungbuk'){
				$("#Chungbuk").prop('disabled',false);
				$('#Chungbuk').show(); 
			} else if($("select[name='city']").val() == 'Jeju'){
				$("#Jeju").prop('disabled',false);
				$('#Jeju').show(); 
			} else {
				disabled();
				hide();
			}
		});
});
</script>
<style type="text/css">
#city {
	margin-left: 80px;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
}

.region {
	margin-left: 20px;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
}

</style>
</head>
<body>
		<select id="city" name="city" size="1">
			<option value="">시, 도</option>
			<option value="Seoul">서울</option>
			<option value="Gyeonggi">경기</option>
			<option value="Incheon">인천</option>
			<option value="Busan">부산</option>
			<option value="Daegu">대구</option>
			<option value="Gwangju">광주</option>
			<option value="Daejeon">대전</option>
			<option value="Ulsan">울산</option>
			<option value="Sejong">세종</option>
			<option value="Gangwon">강원</option>
			<option value="Gyeongnam">경남</option>
			<option value="Gyeongbuk">경북</option>
			<option value="Jeonnam">전남</option>
			<option value="Jeonbuk">전북</option>
			<option value="Chungnam">충남</option>
			<option value="Chungbuk">충북</option>
			<option value="Jeju">제주</option>
		</select>
		<select id="Seoul" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="서울 강남구">강남구</option>
			<option value="서울 강동구">강동구</option>
			<option value="서울 강북구">강북구</option>
			<option value="서울 강서구">강서구</option>
			<option value="서울 관악구">관악구</option>
			<option value="서울 광진구">광진구</option>
			<option value="서울 구로구">구로구</option>
			<option value="서울 금천구">금천구</option>
			<option value="서울 노원구">노원구</option>
			<option value="서울 도봉구">도봉구</option>
			<option value="서울 동대문구">동대문구</option>
			<option value="서울 동작구">동작구</option>
			<option value="서울 마포구">마포구</option>
			<option value="서울 서대문구">서대문구</option>
			<option value="서울 서초구">서초구</option>
			<option value="서울 성동구">성동구</option>
			<option value="서울 성북구">성북구</option>
			<option value="서울 송파구">송파구</option>
			<option value="서울 양천구">양천구</option>
			<option value="서울 영등포구">영등포구</option>
			<option value="서울 용산구">용산구</option>
			<option value="서울 은평구">은평구</option>
			<option value="서울 종로구">종로구</option>
			<option value="서울 중구">중구</option>
			<option value="서울 중랑구">중랑구</option>
		</select>
		<select id="Gyeonggi" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="경기 가평군">가평군</option>
			<option value="경기 고양시">고양시</option>
			<option value="경기 과천시">과천시</option>
			<option value="경기 광명시">광명시</option>
			<option value="경기 광주시">광주시</option>
			<option value="경기 구리시">구리시</option>
			<option value="경기 군포시">군포시</option>
			<option value="경기 김포시">김포시</option>
			<option value="경기 남양주시">남양주시</option>
			<option value="경기 동두천시">동두천시</option>
			<option value="경기 부천시">부천시</option>
			<option value="경기 상록구">상록구</option>
			<option value="경기 성남시">성남시</option>
			<option value="경기 수원시">수원시</option>
			<option value="경기 시흥시">시흥시</option>
			<option value="경기 안산시">안산시</option>
			<option value="경기 안성시">안성시</option>
			<option value="경기 안양시">안양시</option>
			<option value="경기 양주시">양주시</option>
			<option value="경기 양평군">양평군</option>
			<option value="경기 여주시">여주시</option>
			<option value="경기 연천군">연천군</option>
			<option value="경기 오산시">오산시</option>
			<option value="경기 용인시">용인시</option>
			<option value="경기 의왕시">의왕시</option>
			<option value="경기 의정부시">의정부시</option>
			<option value="경기 이천시">이천시</option>
			<option value="경기 파주시">파주시</option>
			<option value="경기 평택시">평택시</option>
			<option value="경기 포천시">포천시</option>
			<option value="경기 하남시">하남시</option>
			<option value="경기 화성시">화성시</option>
		</select>
		<select id="Incheon" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="인천 강화군">강화군</option>
			<option value="인천 계양구">계양구</option>
			<option value="인천 남동구">남동구</option>
			<option value="인천 동구">동구</option>
			<option value="인천 미추홀구">미추홀구</option>
			<option value="인천 부평구">부평구</option>
			<option value="인천 서구">서구</option>
			<option value="인천 연수구">연수구</option>
			<option value="인천 옹진군">옹진군</option>
			<option value="인천 중구">중구</option>				
		</select>
		<select id="Busan" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="부산 강서구">강화군</option>
			<option value="부산 금정구">계양구</option>
			<option value="부산 기장군">남동구</option>
			<option value="부산 남구">동구</option>
			<option value="부산 동구">미추홀구</option>
			<option value="부산 동래구">부평구</option>
			<option value="부산 부산진구">서구</option>
			<option value="부산 북구">연수구</option>
			<option value="부산 사상구">옹진군</option>
			<option value="부산 사하구">중구</option>
			<option value="부산 서구">부천시</option>
			<option value="부산 수영구">상록구</option>
			<option value="부산 연제구">성남시</option>
			<option value="부산 영도구">수원시</option>
			<option value="부산 중구">시흥시</option>
			<option value="부산 해운대구">안산시</option>
		</select>
		<select id="Daegu" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="대구 남구">남구</option>
			<option value="대구 달서구">달서구</option>
			<option value="대구 달성군">달성군</option>
			<option value="대구 동구">동구</option>
			<option value="대구 북구">북구</option>
			<option value="대구 서구">서구</option>
			<option value="대구 수성구">수성구</option>
			<option value="대구 중구">중구</option>
		</select>
		<select id="Gwangju" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="광주 광산구">광산구</option>
			<option value="광주 남구">남구</option>
			<option value="광주 동구">동구</option>
			<option value="광주 북구">북구</option>
			<option value="광주 서구">서구</option>	
		</select>
		<select id="Daejeon" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="대전 대덕구">대덕구</option>
			<option value="대전 동구">동구</option>
			<option value="대전 서구">서구</option>
			<option value="대전 유성구">유성구</option>
			<option value="대전 중구">중구</option>	
		</select>
		<select id="Ulsan" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="울산 남구">남구</option>
			<option value="울산 동구">동구</option>
			<option value="울산 북구">북구</option>
			<option value="울산 울주군">울주군</option>
			<option value="울산 중구">중구</option>			
		</select>
		<select id="Sejong" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="세종시">세종시</option>		
		</select>
		<select id="Gangwon" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="강원 강릉시">강릉시</option>
			<option value="강원 고성군">고성군</option>
			<option value="강원 동해시">동해시</option>
			<option value="강원 삼척시">삼척시</option>
			<option value="강원 속초시">속초시</option>
			<option value="강원 양구군">양구군</option>
			<option value="강원 양양군">양양군</option>
			<option value="강원 영월군">영월군</option>
			<option value="강원 원주시">원주시</option>
			<option value="강원 인제군">인제군</option>
			<option value="강원 정선군">정선군</option>
			<option value="강원 철원군">철원군</option>
			<option value="강원 춘천시">춘천시</option>
			<option value="강원 태백시">태백시</option>
			<option value="강원 평창군">평창군</option>
			<option value="강원 홍천군">홍천군</option>
			<option value="강원 화천군">화천군</option>
			<option value="강원 횡성군">횡성군</option>
		</select>
		<select id="Gyeongnam" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="경남 거제시">거제시</option>
			<option value="경남 거창군">거창군</option>
			<option value="경남 고성군">고성군</option>
			<option value="경남 김해시">김해시</option>
			<option value="경남 남해군">남해군</option>
			<option value="경남 밀양시">밀양시</option>
			<option value="경남 사천시">사천시</option>
			<option value="경남 산청군">산청군</option>
			<option value="경남 양산시">양산시</option>
			<option value="경남 의령군">의령군</option>
			<option value="경남 진주시">진주시</option>
			<option value="경남 창녕군">창녕군</option>
			<option value="경남 창원시">창원시</option>
			<option value="경남 통영시">통영시</option>
			<option value="경남 하동군">하동군</option>
			<option value="경남 함안군">함안군</option>
			<option value="경남 함양군">함양군</option>
			<option value="경남 합천군">합천군</option>
		</select>
		<select id="Gyeongbuk" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="경북 경산시">경산시</option>
			<option value="경북 경주시">경주시</option>
			<option value="경북 고령군">고령군</option>
			<option value="경북 구미시">구미시</option>
			<option value="경북 군위군">군위군</option>
			<option value="경북 김천시">김천시</option>
			<option value="경북 문경시">문경시</option>
			<option value="경북 봉화군">봉화군</option>
			<option value="경북 상주시">상주시</option>
			<option value="경북 성주군">성주군</option>
			<option value="경북 안동시">안동시</option>
			<option value="경북 영덕군">영덕군</option>
			<option value="경북 영양군">영양군</option>
			<option value="경북 영주시">영주시</option>
			<option value="경북 영천시">영천시</option>
			<option value="경북 예천군">예천군</option>
			<option value="경북 울릉군">울릉군</option>
			<option value="경북 울진군">울진군</option>
			<option value="경북 의성군">의성군</option>
			<option value="경북 청도군">청도군</option>
			<option value="경북 청송군">청송군</option>
			<option value="경북 칠곡군">칠곡군</option>
			<option value="경북 포항시">포항시</option>
		</select>
		<select id="Jeonnam" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="전남 강진군">강진군</option>
			<option value="전남 고흥군">고흥군</option>
			<option value="전남 곡성군">곡성군</option>
			<option value="전남 광양시">광양시</option>
			<option value="전남 구례군">구례군</option>
			<option value="전남 나주시">나주시</option>
			<option value="전남 담양군">담양군</option>
			<option value="전남 목포시">목포시</option>
			<option value="전남 무안군">무안군</option>
			<option value="전남 보성군">보성군</option>
			<option value="전남 순천시">순천시</option>
			<option value="전남 신안군">신안군</option>
			<option value="전남 여수시">여수시</option>
			<option value="전남 영광군">영광군</option>
			<option value="전남 영암군">영암군</option>
			<option value="전남 완도군">완도군</option>
			<option value="전남 장성군">장성군</option>
			<option value="전남 장흥군">장흥군</option>
			<option value="전남 진도군">진도군</option>
			<option value="전남 함평군">함평군</option>
			<option value="전남 해남군">해남군</option>
			<option value="전남 화순군">화순군</option>
		</select>
		<select id="Jeonbuk" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="전북 고창군">고창군</option>
			<option value="전북 군산시">군산시</option>
			<option value="전북 김제시">김제시</option>
			<option value="전북 남원시">남원시</option>
			<option value="전북 무주군">무주군</option>
			<option value="전북 부안군">부안군</option>
			<option value="전북 순창군">순창군</option>
			<option value="전북 완주군">완주군</option>
			<option value="전북 익산시">익산시</option>
			<option value="전북 임실군">임실군</option>
			<option value="전북 장수군">장수군</option>
			<option value="전북 전주시">전주시</option>
			<option value="전북 정읍시">정읍시</option>
			<option value="전북 진안군">진안군</option>
		</select>
		<select id="Chungnam" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="충남 계룡시">계룡시</option>
			<option value="충남 공주시">공주시</option>
			<option value="충남 금산군">금산군</option>
			<option value="충남 논산시">논산시</option>
			<option value="충남 당진시">당진시</option>
			<option value="충남 보령시">보령시</option>
			<option value="충남 부여군">부여군</option>
			<option value="충남 서산시">서산시</option>
			<option value="충남 서천군">서천군</option>
			<option value="충남 아산시">아산시</option>
			<option value="충남 예산군">예산군</option>
			<option value="충남 천안시">천안시</option>
			<option value="충남 청양군">청양군</option>
			<option value="충남 태안군">태안군</option>
			<option value="충남 홍성군">홍성군</option>
		</select>
		<select id="Chungbuk" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="충북 괴산군">괴산군</option>
			<option value="충북 단양군">단양군</option>
			<option value="충북 보은군">보은군</option>
			<option value="충북 영동군">영동군</option>
			<option value="충북 옥천군">옥천군</option>
			<option value="충북 음성군">음성군</option>
			<option value="충북 제천시">제천시</option>
			<option value="충북 증평군">증평군</option>
			<option value="충북 진천군">진천군</option>
			<option value="충북 청주시">청주시</option>
			<option value="충북 충주시">충주시</option>
		</select>
		<select id="Jeju" class="region" name="region" size="1">
			<option value="">선택하세요</option>
			<option value="제주 제주시">제주시</option>
			<option value="제주 서귀포시">서귀포시</option>
		</select>
</body>
</html>