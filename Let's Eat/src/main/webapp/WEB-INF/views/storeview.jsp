<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 업체 상세보기</title>
 	 <!--datepicker  -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
 	 <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

<style>
	.div1 {
		margin: 0px auto;
	}

	.d1 {
		width : 200px;
		margin:0 auto;
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




	
	.reserbody {
  		width: 960px;
  		margin: 20px auto;
 		float: right;
	}
	.calandiv {
		float: left;
		margin-left: 150px;
	}
	.slot {
	
		  width: 200px;
		  height: 120px;
		  float: left;
		  margin-right: 2px;
		  display: table;
 		 position: relative;
 		 box-shadow: inset 0 0px 1px #222;
	}
	.slot:before {
 		 content: "";
 		 position: absolute;
		  top: 0;
 		 right: 0;
 		 bottom: 0;
 		 left: 0;
 		 box-shadow: inset 0 0px 1px #222;
	}
	.slot:hover {
 		 color: #fff;
	}
	.slot:hover:before {
		  background-color: #333;
		  box-shadow: inset 0 0px 1px #222;
	}
	.slot.disabled, .slot.disabled:hover {
		  color: #ccc;
		  cursor: not-allowed;
	}
	.slot.disabled:before, .slot.disabled:hover:before {
  		background-color: #eee;
  		box-shadow: none;
	}
	.slot span {
 		 position: relative;
 		 display: table-cell;
 		 vertical-align: middle;
 		 text-align: center;
 		 z-index: 1;
	}
	.slot span b {
		  display: block;
		}

	.slot input[type=radio]:after {
 		 content: "";
 		 width: 100%;
 		 height: 100%;
 		 position: absolute;
 		 left: 0;
 		 top: 0;
 		 box-shadow: none;
	}
	.slot input[type=radio]:checked:after {
		  color: #fff;
 		 background-color: #81F79F;
 		 box-shadow: none;
	}
	.slot input[type=radio]:disabled:after {
		  background-color: #eee;
 		 box-shadow: none;
	}
	.slot:hover input[type=radio] {
 		 display: none;
	}	
</style>


 <style>
    * {
      box-sizing: border-box;
      font-family: 'NanumGothic, sans-serif';
    }

    /* placeholder color */
    input:-ms-input-placeholder {
      color: #000;
    }
    input::-webkit-input-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
    .wrapper {
      position: relative;
      width: 445px;
      height: 45px;
      margin: 10px;
    }
    .ion-calendar {
      position: absolute;
      right: 20px;
      top: 14px;
    }
    /* input */
    #datepicker {
      border: 1px solid #c6e2f7;
      border-radius: 5px;
      width: 100%;
      height: 100%;
      font-size: 16px;
      text-align: center;
      cursor: pointer;
    }
    #datepicker:hover {
      background-color: #eaf7ff;
    }
    #datepicker:focus {
      outline: none;
    }
    /* calendar table */
    .ui-datepicker {
      display: none;
      background-color: #fff;
      border-radius: 5px;
      border: 3px solid #c6e2f7;
      margin-top: 10px;
      margin-left: 42.5px;
      margin-right: 42.5px;
      padding: 20px;
      width: 360px;
    }
    #datepicker:focus>.ui-datepicker {
      display: block;
    }
    .ui-datepicker-prev,
    .ui-datepicker-next {
      cursor: pointer;
    }
    .ui-datepicker-next {
      float: right;
    }
    .ui-state-disabled {
      cursor: auto;
      color: hsla(0, 0%, 80%, 1);
    }
    .ui-datepicker-title {
      text-align: center;
      padding: 10px;
      font-weight: 100;
      font-size: 20px;
    }
    .ui-datepicker-calendar {
      width: 100%;
    }
    /* day of week cell */
    .ui-datepicker-calendar>thead>tr>th {
      padding: 5px;
      font-size: 20px;
      font-weight: 400;
    }
    /* day cell */
    .ui-datepicker-calendar>tbody>tr>td {
      border-radius: 100%;
      width: 44px;
      height: 44px;
      cursor: pointer;
      padding: 5px;
      font-weight: 100;
      text-align: center;
    }
    .ui-datepicker-calendar>tbody>tr>td:hover {
      background-color: #c6e2f7;
    }
    .ui-datepicker-calendar>tbody>tr>td>a {
      color: #000;
      font-size: 18px;
      font-weight: 400;
      text-decoration: none;
    }
    /* past days */
    .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
      cursor: auto;
      background-color: #fff;
    }
    
    /*  주말 색깔 바꾸기 */
    .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: #F5A9BC; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: #8181F7; }



    
    /* media */
    @media(max-width: 445px) {
      .wrapper {
        width: calc(100vw - 20px);
      }
      .ui-datepicker {
        margin-right: 0;
        margin-left: 0;
        padding: 10px;
        width: calc(100vw - 20px);
        margin: 10px auto;
      }
      .ui-datepicker-calendar>tbody>tr>td {
        width: 38px;
        height: 38px;
      }
    }


</style>

</head>

<body>

	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index'">메인페이지 이동</button>
	<button onclick="window.history.back();">뒤로가기</button>
	
	

		<h3 style="text-align:center;">${storeView.sName}</h3>
		<div class="d1">
			<img src="resources/fileUpload/${storeView.sFileName1}" width="200px"><br>
		</div>
		
		
		<div class="d1">
			업체명 : ${storeView.sName} <br>
			<input type="hidden" value="${storeView.storeCode}" name="storeCode" id="storeCode">
			<input type="hidden" value="${sessionScope.mloginCode}" name="mCode" id="mCode">
			평점 : ${resaView.rStarAVG} <br>
			카테고리 : ${storeView.sFood} <br>
			키워드 : ${storeView.sKeyword} <br><br>

			<c:if test="${not empty resaView1.ssCode}">
				<div id="save">
					<img src="resources/img/like.png" width="30px"
						onclick="likexbutton()"><br>
				</div>

			</c:if>

			<c:if test="${empty resaView1.ssCode}">
				<div id="save">
					<img src="resources/img/likex.png" width="30px"
						onclick="likebutton()"><br>
				</div>
			</c:if>
		
			<br>
			
			<input type="button" onclick="reserForm()" value="예약">
			<input type="button" onclick="review()" value="리뷰">
			<input type="button" onclick="sDetail(),map_1()" value="상세정보">
			
		</div>


		<br>
		
<div id="table">
		
	<div class="calandiv">
	<!--  캘랜더  시작-->
		<form action="storeViewD"  name="dateForm" method="GET">
	 		${storeView.storeCode} ${sessionScope.mCode}
	 		<input type="hidden" value="${storeView.storeCode}" name="storeCode">
	 		<input type="hidden" name="mCode" value="${sessionScope.mCode}">
	 								
	 								
			<%-- 예약날짜<input type="date" name="bookDate" id="date1">  --%>
	 		
			<div class="wrapper">
   				<input type="text" id="datepicker" placeholder="예약하실 날짜를 선택해주세요." name="bookDate" readonly="true" />
    			<i class="ion-calendar"></i>
  			</div>

	 	</form>
	 	
	 		<br><br><br><br><br><br><br>
	 		
	 		
	 	<c:if test="${reservation.book9 != null}">
	 	
	 		<div style="text-align:center; "><h1>${reservation.bookDate}</h1> 날짜에 예약합니다!</div>
	 		
	 		<c:if test="${sessionScope.mloginPoint != 0 && not empty sessionScope.mloginId}">
	 			<h3 style="text-align:center;">현재 잔여 포인트는 ${sessionScope.mloginPoint} 원 입니다!</h3>
	 		</c:if>
	 		
	 		<c:if test="${sessionScope.mloginPoint == 0 && not empty sessionScope.mloginId}">
	 			<h3 style="text-align:center;">현재 잔여 포인트는 0원 입니다!</h3>
	 		</c:if>
	 		
	 		<c:if test="${empty sessionScope.mloginId}">
      			 <h3 style="text-align:center; color:red;">로그인 후 이용해주세요</h3>
      		 </c:if>
      		 
      	</c:if>
	 		
	 </div>
	 	
	 	
	 <div class="reserbody">
	 <!-- 예약 폼 시작  -->
	 
	 <c:if test="${reservation.book9 == null}">
	 	<h1 style="color:red;">해당 날짜에 예약이 불가능 합니다.</h1> 
	 </c:if>
	 
	 	
	<c:if test="${reservation.book9 != null}">
	
		<form action="reser" method="GET" name="reser">
		
		<input type="hidden" value="${reservation.bookDate}" name="bDate">
		<br><br>
		
	 	
		<label class="slot">
  			<c:if test="${reservation.book9 !='0'}">
 				<span style="color:#5FB404;"><b style="color:black;">9:00</b><br> 예약가능 : ${reservation.book9} 개</span>
 				<input type="radio" value="9:00" name="bTime"/>
 			</c:if>
 		 
  			<c:if test="${reservation.book9=='0'}">
  				<span><b>9:00</b><br> <a style="color:red;">예약마감!</a></span>
 				<input type="radio" value="9:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
 			<c:if test="${reservation.book10 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">10:00</b><br> 예약가능 : ${reservation.book10} 개</span>
  				<input type="radio" value="10:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book10=='0'}">
  				<span><b>10:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="10:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
			 <c:if test="${reservation.book11 !='0'}">
 				<span style="color:#5FB404;"><b style="color:black;">11:00</b><br> 예약가능 : ${reservation.book11} 개</span>
  				<input type="radio" value="11:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book11=='0'}">
  				<span ><b>11:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="11:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
	 		<c:if test="${reservation.book12 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">12:00</b><br> 예약가능 : ${reservation.book12} 개</span>
  				<input type="radio" value="12:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book12=='0'}">
  				<span><b>12:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="12:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
			<c:if test="${reservation.book13 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">13:00</b><br> 예약가능 : ${reservation.book13} 개</span>
  				<input type="radio" value="13:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book13=='0'}">
  				<span><b>13:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="13:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
			<c:if test="${reservation.book14 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">14:00</b><br> 예약가능 : ${reservation.book14} 개</span>
  				<input type="radio" value="14:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book14=='0'}">
  				<span><b>14:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="14:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
  			<c:if test="${reservation.book15 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">15:00</b><br> 예약가능 : ${reservation.book15} 개</span>
  				<input type="radio" value="15:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book15=='0'}">
  				<span><b>15:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="15:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
  			<c:if test="${reservation.book16 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">16:00</b><br> 예약가능 : ${reservation.book16} 개</span>
  				<input type="radio" value="16:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book16=='0'}">
  				<span><b>16:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="16:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
  			<c:if test="${reservation.book17 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">17:00</b><br> 예약가능 : ${reservation.book17} 개</span>
  				<input type="radio" value="17:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book17=='0'}">
  				<span><b>17:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="17:00" name="bTime" disabled/>
 			</c:if>
		</label>

		<label class="slot">
  			<c:if test="${reservation.book18 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">18:00</b><br> 예약가능 : ${reservation.book18} 개</span>
  				<input type="radio" value="18:00" name="bTime"/>
 			</c:if>
  
  			<c:if test="${reservation.book18=='0'}">
  				<span><b>18:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="18:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
 			<c:if test="${reservation.book19 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">19:00</b><br> 예약가능 : ${reservation.book19} 개</span>
  				<input type="radio" value="19:00" name="bTime"/>
 			</c:if>
  
  			<c:if test="${reservation.book19=='0'}">
  				<span><b>19:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="19:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
 			<c:if test="${reservation.book20 !='0'}">
 				<span style="color:#5FB404;"><b style="color:black;">20:00</b><br> 예약가능 : ${reservation.book20} 개</span>
  				<input type="radio" value="20:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book20=='0'}">
  				<span><b>20:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="20:00" name="bTime" disabled/>
  			</c:if>
		</label>

		<label class="slot">
  			<c:if test="${reservation.book21 !='0'}">
  				<span style="color:#5FB404;"><b style="color:black;">21:00</b><br> 예약가능 : ${reservation.book21} 개</span>
  				<input type="radio" value="21:00" name="bTime"/>
  			</c:if>
  
  			<c:if test="${reservation.book21=='0'}">
  				<span><b>21:00</b><br> <a style="color:red;">예약마감!</a></span>
  				<input type="radio" value="21:00" name="bTime" disabled/>
  			</c:if>
		</label>
		

		<br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br>	
			
			
			인원수 : <select name="bmCount">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select><br>
		
		<input type="hidden" name="bmCode" id="bmCode" value="${sessionScope.mloginCode}">
		
		<input type="hidden" name="bsCode" value="${storeView.storeCode}">
	
		<input type="hidden" name="bmPhone" value="${sessionScope.mloginPhone}">
		
		<input type="hidden" id="point" value="${sessionScope.mloginPoint}">
		
		<input type="hidden" id="mngBook9" value="${reservation.book9}">
		
		<input type="hidden" id="mloginId" value="${sessionScope.mloginId}">
		
		<br>
		
		<c:if test="${not empty sessionScope.mloginId}">
			<input type="button" onclick="reser1()" value="예약하기">
		</c:if>
		
		<c:if test="${empty sessionScope.mloginId}">
			<input type="button" onclick="reser2()" value="예약하기">
		</c:if>
		
		<input type="reset" value="리셋">

		</form>
	</c:if>
		
	</div>
	
</div>
			
			
		<br><br><br>


</body>

<script>
	
function reserForm(){
		
		console.log("test: reserForm");
	   
	      var book9 = '${reservation.book9}';
	      var book10 = '${reservation.book10}';
	      var book11 = '${reservation.book11}';
	      var book12 = '${reservation.book12}';
	      var book13 = '${reservation.book13}';
	      var book14 = '${reservation.book14}';
	      var book15 = '${reservation.book15}';
	      var book16 = '${reservation.book16}';
	      var book17 = '${reservation.book17}';
	      var book18 = '${reservation.book18}';
	      var book19 = '${reservation.book19}';
	      var book20 = '${reservation.book20}';
	      var book21 = '${reservation.book21}';
	      
	      var mloginId = '${sessionScope.mloginId}';
	      var mPoint = '${sessionScope.mloginPoint}';
	      
	      console.log("mloginId : " + mloginId);
	      console.log("mPoint : " + mPoint);

		
		var table = document.getElementById("table");
	      
	    var output ="";

		
		output +="	<div class='calandiv'>						";
		output +="		<!--  캘랜더  시작-->					";
		output +="			<form action='storeViewD'  name='dateForm' method='GET'>				";
		output +="		 		${storeView.storeCode} ${sessionScope.mCode}			";
		output +="		 		<input type='hidden' value='${storeView.storeCode}' name='storeCode'>			";
		output +="		 		<input type='hidden' name='mCode' value='${sessionScope.mCode}'>			";


		output +="				<div class='wrapper'>			";
		output +="	   				<input type='text' id='datepicker' placeholder='예약하실 날짜를 선택해주세요.' name='bookDate' readonly='true' />		";
		output +="	    			<i class='ion-calendar'></i>			";
		output +="	  			</div>			";
		output +="							";
		output +="		 	</form>				";
		output +="		 					";
		output +="		 		<br><br><br><br><br><br><br>			";


		if(book9 != "") {
		
			output +="		 		<div style='text-align:center; '><h1>${reservation.bookDate}</h1> 날짜에 예약합니다!</div>			";
		
			
			if(mPoint != 0 && mloginId != "" ){
				output +="		 			<h3 style='text-align:center;'>현재 잔여 포인트는 ${sessionScope.mloginPoint} 원 입니다!</h3>		";
				
			} else if(mPoint == 0 && mloginId != "" ){
				output +="		 			<h3 style='text-align:center;'>현재 잔여 포인트는 0원 입니다!</h3>		";
				
			} else if(mloginId == "" ){
				output +="	      			 <h3 style='text-align:center; color:red;'>로그인 후 이용해주세요</h3>			";
			}
		
		
		}
		
	
		output +="		 </div>					";
		
		
		output +="		 <div class='reserbody'>					";
		output +="		 <!-- 예약 폼 시작  -->					";

		
		
	if(book9 != "") {

			output +="			<form action='reser' method='GET' name='reser'>				";

			output +="			<input type='hidden' value='${reservation.bookDate}' name='bDate'>				";
			output +="			<br><br>				";

			
			output +="			<label class='slot'>				";
			
			if(book9 != 0){
				output +="	 				<span style='color:#5FB404;'><b style='color:black;'>9:00</b><br> 예약가능 : ${reservation.book9} 개</span>		";
				output +="	 				<input type='radio' value='9:00' name='bTime'/>		";
			}
			

			if(book9 == 0){
				output +="	  				<span><b>9:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	 				<input type='radio' value='9:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";


			output +="			<label class='slot'>				";
			
			if(book10 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>10:00</b><br> 예약가능 : ${reservation.book10} 개</span>		";
				output +="	  				<input type='radio' value='10:00' name='bTime'/>		";
			}

			if(book10 == 0){
				output +="	  				<span><b>10:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='10:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";


			output +="			<label class='slot'>				";
			
			if(book11 != 0){
				output +="	 				<span style='color:#5FB404;'><b style='color:black;'>11:00</b><br> 예약가능 : ${reservation.book11} 개</span>		";
				output +="	  				<input type='radio' value='11:00' name='bTime'/>		";
			}

			if(book11 == 0){
				output +="	  				<span ><b>11:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='11:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";
			
			output +="			<label class='slot'>				";
			
			if(book12 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>12:00</b><br> 예약가능 : ${reservation.book12} 개</span>		";
				output +="	  				<input type='radio' value='12:00' name='bTime'/>		";
			}

			if(book12 == 0){
				output +="	  				<span><b>12:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='12:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book13 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>13:00</b><br> 예약가능 : ${reservation.book13} 개</span>		";
				output +="	  				<input type='radio' value='13:00' name='bTime'/>		";
			}

			if(book13 == 0){
				output +="	  				<span><b>13:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='13:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book14 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>14:00</b><br> 예약가능 : ${reservation.book14} 개</span>		";
				output +="	  				<input type='radio' value='14:00' name='bTime'/>		";
			}

			if(book14 == 0){
				output +="	  				<span><b>14:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='14:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book15 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>15:00</b><br> 예약가능 : ${reservation.book15} 개</span>		";
				output +="	  				<input type='radio' value='15:00' name='bTime'/>		";
			}

			if(book15 == 0){
				output +="	  				<span><b>15:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='15:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book16 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>16:00</b><br> 예약가능 : ${reservation.book16} 개</span>		";
				output +="	  				<input type='radio' value='16:00' name='bTime'/>		";
			}

			if(book16 == 0){
				output +="	  				<span><b>16:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='16:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book17 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>17:00</b><br> 예약가능 : ${reservation.book17} 개</span>		";
				output +="	  				<input type='radio' value='17:00' name='bTime'/>		";
			}

			if(book17 == 0){
				output +="	  				<span><b>17:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='17:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book18 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>18:00</b><br> 예약가능 : ${reservation.book18} 개</span>		";
				output +="	  				<input type='radio' value='18:00' name='bTime'/>		";
			}
			
			if(book18 == 0){
				output +="	  				<span><b>18:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='18:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";
			
			output +="			<label class='slot'>				";
			
			if(book19 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>19:00</b><br> 예약가능 : ${reservation.book19} 개</span>		";
				output +="	  				<input type='radio' value='19:00' name='bTime'/>		";
			}

			if(book19 == 0){
				output +="	  				<span><b>19:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='19:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book20 != 0){
				output +="	 				<span style='color:#5FB404;'><b style='color:black;'>20:00</b><br> 예약가능 : ${reservation.book20} 개</span>		";
				output +="	  				<input type='radio' value='20:00' name='bTime'/>		";
			}

			if(book20 == 0){
				output +="	  				<span><b>20:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='20:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			output +="			<label class='slot'>				";
			
			if(book21 != 0){
				output +="	  				<span style='color:#5FB404;'><b style='color:black;'>21:00</b><br> 예약가능 : ${reservation.book21} 개</span>		";
				output +="	  				<input type='radio' value='21:00' name='bTime'/>		";
			}

			if(book21 == 0){
				output +="	  				<span><b>21:00</b><br> <a style='color:red;'>예약마감!</a></span>		";
				output +="	  				<input type='radio' value='21:00' name='bTime' disabled/>		";
			}
			
			output +="			</label>				";

			
		output +="			<br><br><br><br><br><br><br><br><br><br><br><br>				";
		output +="			<br><br><br><br><br><br><br><br><br><br><br><br>				";


		output +="				인원수 : <select name='bmCount'>			";
		output +="						<option value='1'>1</option>	";
		output +="						<option value='2'>2</option>	";
		output +="						<option value='3'>3</option>	";
		output +="						<option value='4'>4</option>	";
		output +="						<option value='5'>5</option>	";
		output +="						<option value='6'>6</option>	";
		output +="						<option value='7'>7</option>	";
		output +="						<option value='8'>8</option>	";
		output +="						<option value='9'>9</option>	";
		output +="						<option value='10'>10</option>	";
		output +="					</select><br>		";


		output +="			<input type='hidden' name='bmCode' id='bmCode' value='${sessionScope.mloginCode}'>				";

		output +="			<input type='hidden' name='bsCode' value='${storeView.storeCode}'>				";

		output +="			<input type='hidden' name='bmPhone' value='${sessionScope.mloginPhone}'>				";

		output +="			<input type='hidden' id='point' value='${sessionScope.mloginPoint}'>				";

		output +="			<input type='hidden' id='mngBook9' value='${reservation.book9}'>				";

		output +="			<input type='hidden' id='mloginId' value='${sessionScope.mloginId}'>				";

		output +="			<br>				";

		
		if(mloginId != ""){
			output +="				<input type='button' onclick='reser1()' value='예약하기'>			";
		}

		if(mloginId == ""){
			output +="				<input type='button' onclick='reser2()' value='예약하기'>			";
		}

		output +="			<input type='reset' value='리셋'>				";

		output +="			</form>				";
		
		output +="		</div>					";
		
	} else if(book9 == "") {
			output +="		 	<h1 style='color:red;'>해당 날짜에 예약이 불가능 합니다.</h1> 				";
			output +="		</div>					";
	}
	
	table.innerHTML = output;
		
		
} // end reserForm() 

</script>



<script>
 // 예약하기 함수
 function reser1(){
	 
	 var point = document.getElementById("point").value;
	 var mngBook9 = document.getElementById("mngBook9").value;
	 
	 var bTimeArray = document.getElementsByName("bTime");
	 
	 var bTime = "";

		for(var i=0; i<bTimeArray.length; i++){
			if(bTimeArray[i].checked==true){
				bTime = bTimeArray[i].value;
			}
		}
	 
	 console.log(mngBook9);
	 console.log(bTime);
	
	 
	if(bTime != "" && point >= 1000){
		
		 reser.submit();
		 
	} else if(bTime == ""){
		alert("시간을 선택해주세요!");
		
	} else {
		 alert("포인트 충전 후 이용해 주세요.");
	} 
	 
 } // end reser1()
 
 
 // 예약하기 전 로그인 확인
 function reser2(){
	 alert("로그인 후 이용해주세요!");
 } // end reser2()
 
</script>



 <script>
    $.datepicker.setDefaults({
      closeText: "닫기",
      prevText: "이전달",
      nextText: "다음달",
      currentText: "오늘",
      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      weekHeader: "주",
      dateFormat: "yy-mm-dd",
      firstDay: 0,
      isRTL: false,
      showMonthAfterYear: true,
      yearSuffix: "년"
    })
    $("#datepicker").datepicker({
    	minDate : "bDate", //당일 부터 예약(선택) 가능
		maxDate : "+14", // 100일 까지 예약 가능 (선택가능)
      
      /* to use in wix */
      onSelect: function (selected, event) {
        console.log(selected);
        
        
        dateForm.submit();
        

        /*
         * wix-send-messages from html component
         * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
         *
         *        
         
         
         */
        window.parent.postMessage(selected, "*");
      }
    })
  </script>


<script>
	// 좋아요 버튼
	function likebutton() {
		console.log("test");

		var storeCode = document.getElementById("storeCode").value;
		var mCode = document.getElementById("mCode").value;
		var confirmId = document.getElementById("save");
		console.log("storeCode : " + storeCode);
		console.log("mCode : " + mCode);
		$
				.ajax({
					type : "GET",
					url : "storesave",
					data : {
						"storeCode" : storeCode,
						"mCode" : mCode

					},
					dataType : "text",

					success : function(data) {
						if (data == "OK") {
							output = "";

							output += "<img src='resources/img/like.png' width='30px' onclick='likexbutton()'>";

							document.getElementById("save").innerHTML = output;
						} else {

							output = "";
							output += "<img src='resources/img/likex.png' width='30px' onclick='likebutton()'>";

							document.getElementById("save").innerHTML = output;

						}//end if
					}, // end success

					error : function() {
						alert('함수 통신 실패!');
					}//end error

				});//end ajax

	}

	// 좋아요 빈 버튼
	function likexbutton() {
		console.log("test");

		var storeCode = document.getElementById("storeCode").value;
		var mCode = document.getElementById("mCode").value;
		var confirmId = document.getElementById("save");
		console.log("storeCode : " + storeCode);
		console.log("mCode : " + mCode);
		$
				.ajax({
					type : "GET",
					url : "storesavex",
					data : {
						"storeCode" : storeCode,
						"mCode" : mCode

					},
					dataType : "text",

					success : function(data) {
						if (data == "OK") {
							output = "";

							output += "<img src='resources/img/likex.png' width='30px' onclick='likebutton()'>";

							document.getElementById("save").innerHTML = output;
						} else {

							output = "";
							output += "<img src='resources/img/likex.png' width='30px' onclick='likebutton()'>";

							document.getElementById("save").innerHTML = output;

						}//end if
					}, // end success

					error : function() {
						alert('함수 통신 실패!');
					}//end error

				});//end ajax

	}
</script>

<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7079bba1dd97a6de15f366a1524f4ad5&libraries=services"></script>
<script>
	function map_1(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 2
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					'${storeView.sAddr}',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${storeView.sName}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
	}
</script>

<script>
	// 업체 상세보기
	function sDetail(){
		console.log("test");
		console.log("test");
		
		var table = document.getElementById("table");
		
		var output = "";
		
		output+="	<table class='div1'>";
		output+="	<tr>					";
		output+="					<td>영업시간</td>	";
		output+="					<td>${storeView.sTime}</td>	";
		output+="				</tr>		";
		output+="				<tr>		";
		output+="					<td>홈페이지</td>	";
		output+="					<td>${storeView.sUrl}</td>	";
		output+="				</tr>		";
		output+="				<tr>		";
		output+="					<td>전화번호</td>	";
		output+="					<td>${storeView.sPhone}</td>	";
		output+="				</tr>		";
		output+="				<tr>		";
		output+="					<td>단체석 여부</td>	";
		output+="					<td>${storeView.sSeat}</td>	";
		output+="				</tr>		";
		output+="				<tr>		";
		output+="					<td>주차가능 여부</td>	";
		output+="					<td>${storeView.sPark}</td>	";
		output+="				</tr>		";
		output+="				<tr>		";
		output+="					<td>업체 주소</td>	";
		output+="					<td>${storeView.sAddr}</td>	";
		output+="				</tr>		";
		output+=" </table>";
		output+="	<br><br>";
		output+="	<div id='map' style='width: 30%; height: 350px;' class='div1'></div>";
		
		
		document.getElementById("table").innerHTML = output;
	
	
	} // end sDetail()

</script>



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
						
						var mloginId = '${sessionScope.mloginId}';
						var rmId = data[i].rmId;
					
						output +="			<div class='reviewdiv'>		";
						output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
						output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
						output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
						output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
						
						
						if(rmId==mloginId){
							output +="				<span style='position: absolute; left : 68%;'><a href='#none' onclick='storeReviewDel(`"+ data[i].rCode + "`)'><img src='resources/img/trash1.png'></a></span>	";
						}
						
						output +="			 <br><br></div><br>		";
						output +="					";
						output +="			<input type='hidden' id='mloginId' value='${sessionScope.mloginId}'>		";
						
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
					
					var mloginId = '${sessionScope.mloginId}';
					var rmId = data[i].rmId;
				
					output +="			<div class='reviewdiv'>		";
					output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
					output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
					output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
					output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
					
					
					if(rmId==mloginId){
						output +="				<span style='position: absolute; left : 68%;'><a href='#none' onclick='storeReviewDel(`"+ data[i].rCode + "`)'><img src='resources/img/trash1.png'></a></span>	";
					}
					
					output +="			 <br><br></div><br>		";
					output +="					";
					output +="			<input type='hidden' id='mloginId' value='${sessionScope.mloginId}'>		";
					
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
					
					var mloginId = '${sessionScope.mloginId}';
					var rmId = data[i].rmId;
				
					output +="			<div class='reviewdiv'>		";
					output +="				<b style='font-size: 20px'>" + data[i].rmId + "</b><br><br>";
					output +="				<div><img src='resources/img/"+ data[i].rStar + ".png' class='star'>&nbsp;&nbsp;<b>" + data[i].rStar + "</b></div><br>	";
					output +="				<div style='word-break:break-all'>" + data[i].rContents + "</div><br>	";
					output +="				<span style='color:#8F8F8F'>" + data[i].rBook + "</span>	";
					
					
					if(rmId==mloginId){
						output +="				<span style='position: absolute; left : 68%;'><a href='#none' onclick='storeReviewDel(`"+ data[i].rCode + "`)'><img src='resources/img/trash1.png'></a></span>	";
					}
					
					output +="			 <br><br></div><br>		";
					output +="					";
					output +="			<input type='hidden' id='mloginId' value='${sessionScope.mloginId}'>		";
					
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


// 리뷰 삭제
function storeReviewDel(rCode){
	
	var storeCode = document.getElementById("storeCode").value;
	var mCode = document.getElementById("mCode").value;
	
	$.ajax({
		type : "GET",
		url : "storeReviewDel",
		data : {
			"rCode" : rCode
		},
		dataType : "text",
	
		success : function(data){
					
				if(data == "OK") {
					alert('리뷰가 삭제되었습니다.');
					review();
				} else {
					alert('본인이 작성한 리뷰가 아닙니다!');
					location.href="storeView?storeCode=" + storeCode + "&mCode=" + mCode;
				}
						
		}, // end success
	
		error : function(){
			alert('함수 통신 실패!');
		} // end error
	
	}); // end ajax
	
	
} // end storeReviewDel()
</script>


<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>




</html>


