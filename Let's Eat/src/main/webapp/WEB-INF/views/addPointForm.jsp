<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>

</head>
<body>
	<h1>포인트 충전</h1>
	<div id="addpoint">
	${sessionScope.mloginId}<br><br>
	<input type="hidden" value="${sessionScope.mloginCode}" id="mCode">
	<input type="button" onclick="addPoint1()" id="Point1" value="1000">
	<input type="button" onclick="addPoint2()" id="Point2" value="5000">
	<input type="button" onclick="addPoint3()" id="Point3" value="10000">
	</div>
	
	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index'">메인페이지 이동</button>
	
</body>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>


<!-- 포인트 충전을 위한 script  -->
<script>
function addPoint1(){
	var mCode = document.getElementById("mCode").value;
	var mPoint = document.getElementById("Point1").value;
	var confirmId = document.getElementById("save");
	console.log("mCode : " + mCode);
	console.log("mPoint : " + mPoint);
	
	 var IMP = window.IMP; // 생략가능
	 IMP.init('imp57676584'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
   pg : 'inicis', // version 1.1.0부터 지원.
   pay_method : 'card',
   merchant_uid : '레츠잇!' + new Date().getTime(),
   name : mPoint + '원 충전',
   amount : 100,
   buyer_name : '구매자 :' + '${sessionScope.mloginName}',
   m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
   if ( rsp.success ) {
       var msg = '결제가 완료되었습니다.';
       msg += '거래ID : ' + rsp.merchant_uid + '\n';
       msg += '결제 금액 : ' + rsp.paid_amount + '원';
       
       $
       .ajax({
			type : "GET",
			url : "addPoint",
			data : {
				"mPoint" : mPoint,
				"mCode" : mCode

			},
			dataType : "text",

			success : function(data) {
				if (data == "OK") {
					output = "";

					output += mPoint + "원 충전 완료";
					output +="<br>";
					output +="<input type='button' value='메인페이지로' onclick='location.href=`index`'>"

					document.getElementById("addpoint").innerHTML = output;
				} else {

					output = "";
					output += "충전이 실패하였습니다.";

					document.getElementById("addpoint").innerHTML = output;

				}//end if
			}, // end success

			error : function() {
				alert('함수 통신 실패!');
			}//end error

		});//end ajax
       
       
       
   } else {
       var msg = '결제에 실패하였습니다.';
       msg += '에러내용 : ' + rsp.error_msg;
   }
   alert(msg);
});
}
</script>
<script>
function addPoint2(){
	var mCode = document.getElementById("mCode").value;
	var mPoint = document.getElementById("Point2").value;
	var confirmId = document.getElementById("save");
	console.log("mCode : " + mCode);
	console.log("mPoint : " + mPoint);
	
	 var IMP = window.IMP; // 생략가능
	 IMP.init('imp57676584'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
   pg : 'inicis', // version 1.1.0부터 지원.
   pay_method : 'card',
   merchant_uid : '레츠잇!' + new Date().getTime(),
   name : mPoint + '원 충전',
   amount : 100,
   buyer_name : '구매자 :' + '${sessionScope.mloginName}',
   
   m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
   if ( rsp.success ) {
       var msg = '결제가 완료되었습니다.';
       msg += '거래ID : ' + rsp.merchant_uid + '\n';
       msg += '결제 금액 : ' + rsp.paid_amount + '원';
       
       $
       .ajax({
			type : "GET",
			url : "addPoint",
			data : {
				"mPoint" : mPoint,
				"mCode" : mCode

			},
			dataType : "text",

			success : function(data) {
				if (data == "OK") {
					output = "";

					output += mPoint + "원 충전 완료";
					output +="<br>";
					output +="<input type='button' value='메인페이지로' onclick='location.href=`index`'>"

					document.getElementById("addpoint").innerHTML = output;
				} else {

					output = "";
					output += "충전이 실패하였습니다.";

					document.getElementById("addpoint").innerHTML = output;

				}//end if
			}, // end success

			error : function() {
				alert('함수 통신 실패!');
			}//end error

		});//end ajax
       
       
       
   } else {
       var msg = '결제에 실패하였습니다.';
       msg += '에러내용 : ' + rsp.error_msg;
   }
   alert(msg);
});
}
</script>
<script>
function addPoint3(){
	var mCode = document.getElementById("mCode").value;
	var mPoint = document.getElementById("Point3").value;
	var confirmId = document.getElementById("save");
	console.log("mCode : " + mCode);
	console.log("mPoint : " + mPoint);
	
	 var IMP = window.IMP; // 생략가능
	 IMP.init('imp57676584'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	IMP.request_pay({
   pg : 'inicis', // version 1.1.0부터 지원.
   pay_method : 'card',
   merchant_uid : '레츠잇!' + new Date().getTime(),
   name : mPoint + '원 충전',
   amount : 100,
   buyer_name : '구매자 :' + '${sessionScope.mloginName}',
   m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
   if ( rsp.success ) {
       var msg = '결제가 완료되었습니다.';
       msg += '거래ID : ' + rsp.merchant_uid + '\n';
       msg += '결제 금액 : ' + rsp.paid_amount + '원';
       
       $
       .ajax({
			type : "GET",
			url : "addPoint",
			data : {
				"mPoint" : mPoint,
				"mCode" : mCode

			},
			dataType : "text",

			success : function(data) {
				if (data == "OK") {
					output = "";

					output += mPoint + "원 충전 완료";
					output +="<br>";
					output +="<input type='button' value='메인페이지로' onclick='location.href=`index`'>"
					document.getElementById("addpoint").innerHTML = output;
				} else {

					output = "";
					output += "충전이 실패하였습니다.";

					document.getElementById("addpoint").innerHTML = output;

				}//end if
			}, // end success

			error : function() {
				alert('함수 통신 실패!');
			}//end error

		});//end ajax
       
       
       
   } else {
       var msg = '결제에 실패하였습니다.';
       msg += '에러내용 : ' + rsp.error_msg;
   }
   alert(msg);
});
}
</script>


</html>