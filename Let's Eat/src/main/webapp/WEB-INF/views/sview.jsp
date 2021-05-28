<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체관리 - 상세정보 (점주)</title>
<style>
	table,tr,td{
		border : 2px solid black;
		text-align: center;
		border-collapse :collapse;
		margin: auto;
	}
	.reviewdiv {
		border : 2px solid black;
		border-radius : 10px;
		width : 40%;
		padding : 10px;
		padding-left : 20px;
		margin : auto;
	}
	.star {
		width : 90px;
	}

</style>
</head>
<body>

	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='upform'">업체등록</button>
	<button onclick="location.href='c_myQnAList?cQnAcId=${sessionScope.cloginId}'">문의현황</button>
	<button onclick="window.history.back();">뒤로가기</button>
	
	<input type="hidden" value="${sView.storeCode}" id="storeCode">
	
<div id ="storemodify">
	<table>
		<tr>
			<td colspan="2">
			<img src="resources/fileUpload/${sView.sFileName1}" width="200px">
			외관사진</td>
			<td colspan="2">
			<img src="resources/fileUpload/${sView.sFileName2}" width="200px">
			내부사진</td>
			<td colspan="2">
			<img src="resources/fileUpload/${sView.sFileName3}" width="200px">
			메뉴사진</td>
		</tr>
		<tr>
			<td>업체명</td>
			<td>영업시간</td>
			<td>홈페이지 url</td>
			<td>업체 주소</td>
			<td>업체 전화번호</td>
			<td>단체석여부</td>
		</tr>
		
		<tr>
			<td>${sView.sName}</td>
			<td>${sView.sTime}</td>
			<td>${sView.sUrl}</td>
			<td>${sView.sAddr}</td>
			<td>${sView.sPhone}</td>
			<td>${sView.sSeat}</td>
		</tr>
		<tr>
			<td>주차가능여부</td>
			<td rowspan="2">업체소개</td>
			<td colspan="4" rowspan="5">${sView.sContents} 
				<input type="button" onclick="storemodify()" value="업체정보 수정">
				<input type="button" onclick="" value="업체 삭제">
			</td>

		</tr>
		<tr>
			<td>${sView.sPark}</td>
		</tr>
		
		<tr>
			<td>사업자 번호</td>
			<td>${sView.sbNum}</td>
		
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${sView.sFood}</td>		
		</tr>
		<tr>
			<td>키워드</td>
			<td>${sView.sKeyword}</td>
		</tr>
	
	
	</table>
	<br><br>



</div>	
<div>
	<table>
		<tr>
			<td><input type="button" onclick="location.href='booklist?bsCode=${sView.storeCode}'" value="예약 목록 "></td>
			<td><input type="button" onclick="location.href='mngBook?booksCode=${sView.storeCode}'" value="예약 관리"></td>
			<td><input type="button" onclick="review()" value="리뷰 보기"></td>
			
		</tr>
		
	</table>
	
	<br><br>
</div>

	<div id="table"></div>
	

</body>

<script>
	function storemodify(){
		var output = "";
		
		output +="	<table>					";
		output +="	<caption>업체 정보 수정</caption>					";
		output +="		<tr>				";
		output +="			<td>업체 이름</td>			";
		output +="						";
		output +="			<td><input type='text' name='sName' placeholder='업체 이름'>			";
		output +="			<input type='hidden' value='${sessionScope.cloginId}' name='scCode'>			";
		output +="			<input type='hidden' value='${sView.storeCode}' name='storeCode'>			";
		output +="			</td>			";
		output +="		</tr>				";
		output +="		<tr>				";
		output +="			<td>영업시간</td>			";
		output +="			<td><input type='text' name='sTime' placeholder='ex) 12:00~20:00'></td>			";
		output +="		</tr>				";
		output +="		<tr>				";
		output +="			<td>업체홈페이지</td>			";
		output +="			<td><input type='text' name='sUrl' placeholder='홈페이지 url'></td>			";
		output +="		</tr>				";
		output +="		<tr>				";
		output +="			<td>업체주소</td>			";
		output +="			<!-- <td><input type='text' name='sAddr' placeholder='업체 주소'></td> -->			";
		output +="						";
		output +="	        <td>					";
		output +="	        	<input type='text' id='sample6_postcode' placeholder='우편번호' name='postcode' class='form-control form-control-user'>				";
		output +="				<input type='button' onclick='sample6_execDaumPostcode()' value='우편번호 찾기' class='form-control form-control-user'>		";
		output +="				<br>		";
		output +="				<input type='text' id='sample6_address' placeholder='주소' name='addr1' class='form-control form-control-user'><br>";
		output +="				<input type='text' id='sample6_extraAddress' placeholder='참고항목' name='addr3' class='form-control form-control-user'>		";
		output +="				<br>		";
		output +="				<input type='text' id='sample6_detailAddress' placeholder='상세주소' name='addr2' class='form-control form-control-user'>  		";
		output +="	        </td>					";
		output +="	                           					";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="			<td>업체 전화번호</td>			";
		output +="			<td><input type='text' name='sPhone' placeholder='ex) 02-1111-2222'></td>			";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="			<td>단체석 여부</td>			";
		output +="			<td><input type='radio' name='sSeat' id='sSeat' value='단체석 있음'>단체석 있음<br>			";
		output +="				<input type='radio' name='sSeat' id='sSeat' value='단체석 없음'>단체석 없음</td>		";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="					<td>업체 소개</td>	";
		output +="					<td><textarea rows='20' cols='38' name='sContents' placeholder='우리 가게를 소개 합니다.'></textarea></td>	";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="			<td>사업자 번호</td>			";
		output +="			<td><input type='text' name='sbNum' placeholder='사업자 번호를 입력하세요.'></td>			";
		output +="		</tr>				";
		output +="		<tr>				";
		output +="			<td>주차 여부</td>			";
		output +="			<td><input type='radio' name='sPark' id='sPark' value='주차 가능'>주차 가능<br>			";
		output +="				<input type='radio' name='sPark' id='sPark' value='주차 불가능'>주차 불가능</td>		";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="			<td>카테고리</td>			";
		output +="			<td><select name='sFood'>			";
		output +="				<option value=''>음식분류</option>		";
		output +="				<option value='양식'>양식</option>		";
		output +="				<option value='한식'>한식</option>		";
		output +="				<option value='일식'>일식</option>		";
		output +="				<option value='중식'>중식</option>		";
		output +="				<option value='분식'>분식</option>		";
		output +="				<option value='카페'>카페</option>		";
		output +="				<option value='패스트푸드'>패스트푸드</option>		";
		output +="				<option value='기타'>기타</option>		";
		output +="			</select></td>			";
		output +="		</tr>				";
		output +="						";
		output +="		<tr>				";
		output +="			<td>키워드</td>			";
		output +="			<td><input type='text' name='keyword1' placeholder='1번 키워드를 입력하세요.'><br>			";
		output +="			<input type='text' name='keyword2' placeholder='2번 키워드를 입력하세요.'><br>			";
		output +="			<input type='text' name='keyword3' placeholder='3번 키워드를 입력하세요.'><br>			";
		output +="			<input type='text' name='keyword4' placeholder='4번 키워드를 입력하세요.'><br>			";
		output +="			<input type='text' name='keyword5' placeholder='5번 키워드를 입력하세요.'></td>			";
		output +="		</tr>				";
		output +="		<tr>				";
		output +="				<td>외관 사진</td>		";
		output +="					<td><input type='file' name='sFile1'></td>	";
		output +="				</tr>		";
		output +="		<tr>				";
		output +="		<tr>				";
		output +="				<td>내부 사진</td>		";
		output +="					<td><input type='file' name='sFile2'></td>	";
		output +="				</tr>		";
		output +="		<tr>				";
		output +="		<tr>				";
		output +="				<td>메뉴 사진</td>		";
		output +="					<td><input type='file' name='sFile3'></td>	";
		output +="				</tr>		";
		output +="						";
		output +="		<tr>				";
		output +="			<td colspan='2'><input type='submit' value='변경'></td>			";
		output +="		</tr>				";
		output +="	</table><br><br>					";

		document.getElementById("storemodify").innerHTML = output;
		
		
	}

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
	


<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>

<script>

// 리뷰 보기 (최신순)
function review(){
	
	var table = document.getElementById("table");
	var storeCode = document.getElementById("storeCode").value;
	
	console.log("storeCode : " + storeCode);
	
	$.ajax({
				type : "GET",
				url : "storeRList",
				data : {
					"storeCode" : storeCode
				},
				
				dataType : "json",

				success :  function(data){
					
					var output = "";
					
					output +="		<select onchange='sort()' name='reviewSort' id='reviewSort' style='position: absolute; left : 15%;'>			";
					output +="			<option value='최신순' selected>최신순</option>		";
					output +="			<option value='평점 높은순'>평점 높은순</option>		";
					output +="			<option value='평점 낮은순'>평점 낮은순</option>		";
					output +="		</select>			";
					
					
					for(var i in data){
					
						output +="			<div class='reviewdiv'>		";
						output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
						output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
						output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
						output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
						output +="			 <br><br></div><br>		";
						
					}

					document.getElementById("table").innerHTML = output;


				},// end success

				error : function() {
					alert('함수 통신 실패!');
				}//end error

			});//end ajax
			
} // end review()


//리뷰 정렬
function sort(){
	var reviewSort = document.getElementById("reviewSort").value;

	if(reviewSort == "평점 높은순"){
	
		var table = document.getElementById("table");
		var storeCode = document.getElementById("storeCode").value;
	
		$.ajax({
			type : "GET",
			url : "storeRList_high",
			data : {
				"storeCode" : storeCode
				},
			
			dataType : "json",

			success :  function(data){
				
				var output = "";
				
				output +="		<select onchange='sort()' name='reviewSort' id='reviewSort' style='position: absolute; left : 15%;'>			";
				output +="			<option value='최신순'>최신순</option>		";
				output +="			<option value='평점 높은순' selected>평점 높은순</option>		";
				output +="			<option value='평점 낮은순'>평점 낮은순</option>		";
				output +="		</select>			";
				
				
				for(var i in data){
				
					output +="			<div class='reviewdiv'>		";
					output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
					output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
					output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
					output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
					output +="			 <br><br></div><br>		";
					
				}

				document.getElementById("table").innerHTML = output;


			},// end success

			error : function() {
				alert('함수 통신 실패!');
			}//end error

		});//end ajax
	
	
	} else if(reviewSort == "평점 낮은순") {
	
		var table = document.getElementById("table");
		var storeCode = document.getElementById("storeCode").value;
	
		$.ajax({
			type : "GET",
			url : "storeRList_low",
			data : {
				"storeCode" : storeCode
				},
		
			dataType : "json",

			success :  function(data){
				
				var output = "";
				
				output +="		<select onchange='sort()' name='reviewSort' id='reviewSort' style='position: absolute; left : 15%;'>			";
				output +="			<option value='최신순'>최신순</option>		";
				output +="			<option value='평점 높은순'>평점 높은순</option>		";
				output +="			<option value='평점 낮은순' selected>평점 낮은순</option>		";
				output +="		</select>			";
				
				
				for(var i in data){
				
					output +="			<div class='reviewdiv'>		";
					output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
					output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
					output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
					output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
					output +="			 <br><br></div><br>		";
					
				}

				document.getElementById("table").innerHTML = output;


			},// end success

			error : function() {
				alert('함수 통신 실패!');
			}//end error

		});//end ajax
	
	// 최신순 일때	
	} else {
		review();
	}

} // end sort()

</script>



</html>