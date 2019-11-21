<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/qrOrder/css/jquery.mobile-1.4.5.min.css" type="text/css">
    <link rel="stylesheet" href="/qrOrder/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>    
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <script>
	    $(document).on('mobileinit', function () {
	        $.mobile.ignoreContentEnabled = true;
	    });
    </script>
    <title>Insert title here</title>
</head>
<script>
window.onload = function ordernum(){
	if(document.getElementById("ordernum").value == 0){
		var d = new Date();
		h = d.getHours();
		m = d.getMinutes();
		s = d.getSeconds();
		if(m<10){
			m=0+""+m;
		}
		if(h<10){
			h=0+""+h;
		}
		if(s<10){
			s=0+""+s;
		}
		var num =h+""+m+""+s+""+d.getMilliseconds()+Math.floor(Math.random() * 100);
		document.getElementById("ordernum").value=num;
	}
}
</script>


<body style="height:100%;">
    <div class="cover">
        <p class="title">${stName }</p> 
        <p class="sub_tlt">주문확인</p> 
        <form name="orderchk" id="orderchk" action="" method="post">
        <div style="margin:0 auto;width:300px">
        	<table style="font-size:18px;width:100%">
        	<c:set var="total" value="0" />
        	<c:set var="cnt" value="0" />
        	<c:forEach var="cuschk" items="${orderList}" varStatus="i">
        		<tr>
	        		<td width="50%">${cuschk.title}<input type="hidden" name="menutitle${i.count }" value="${cuschk.title}"></td>
					<td width="30%">${cuschk.cnt}<input type="hidden" name="menunum${i.count }" value="${cuschk.cnt}"></td>
					<td align="right" width="20%">${cuschk.price}
						<input type="hidden" name="menuprice${i.count} " value="${cuschk.price}">
						<input type="hidden" name="menuidx${i.count} " value="${cuschk.price}">
						<input type="hidden" name="menu${i.count} " value="${cuschk.price}">
					</td>
				</tr>
				<c:set var= "total" value="${total + cuschk.price}"/>
				<c:set var= "cnt" value="${cnt+1}"/>
			</c:forEach>				
				<tr style="height:20px;"></tr>
				<tr>
	        		<td width="50%"><b>합계금액</b></td>
					<td width="30%"></td>
					<td align="right" width="20%"><b><c:out value="${total}"/></b></td>
				</tr>
			</table>
			<input type="hidden" name="ordercnt" value="${cnt }">
			<input type="hidden" name="ordernum" value="">
			<input type="hidden" name="stNum" value="${stNum }">
			<input type="hidden" name="table" value="${table }">
			<br>
			<input type="button" value="추가주문" onclick="location.href = '/menulist?stNum='+${stNum}+'&table='+${table}">
			<br>
			<div style="margin:0 auto;text-align:center"><h3 id="chktext" style="color:#000000">주문 확인 중</h3></div>
			</div>	
        </form>         
    </div>
</body>
 <script type="text/javascript">
 	var webSocket = new WebSocket('ws://13.124.195.129:8080/broadcasting');
    webSocket.onerror = function(event) {
        onError(event)
      };
      webSocket.onmessage = function(event) {
        onMessage(event)
      };
    function onError(event) {
      alert(event.data);
    }
	function onMessage(event) {
		ontext = event.data;
		//alert(ontext);
		if(ontext=="ok"){
			$("#chktext").text("주문이 확인되었습니다.");
			$("#chktext").css("color","red");
			vibrate();
		}   	
	}
	function vibrate() {
    	navigator.vibrate([1000]);
	}
  
  </script>
</html>