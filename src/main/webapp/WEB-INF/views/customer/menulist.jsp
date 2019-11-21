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
    <script>
	    $(document).on('mobileinit', function () {
	        $.mobile.ignoreContentEnabled = true;
	    });
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <title>Insert title here</title>
    <style>
    	.num{
    		width:20px;
    		border:0;
    		text-align:center
    	}
    </style>
</head>
<script>
	$(function(){ 
	  $('.bt_up').click(function(){ 
	    var n = $('.bt_up').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1+1); 
	  });
	  $('.bt_down').click(function(){ 
	    var n = $('.bt_down').index(this);
	    var num = $(".num:eq("+n+")").val();
	    	if(num!=0&&num>=1){num = $(".num:eq("+n+")").val(num*1-1); }
	    
	  });
	}) 
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
        <form name="orderchk" id="orderchk" action="/cusorder" method="post">
        	<c:choose>
           		<c:when test="${fn:length(ordernum) gt 6}">
           		<input type="hidden" name="ordernum" id="ordernum" value="${ordernum }">
           		<p class="sub_tlt">추가주문</p> 
           		</c:when>
           		<c:otherwise>
           		<p class="sub_tlt">주문하기</p>   
           		<input type="hidden" name="ordernum" id="ordernum" value="0">
           		</c:otherwise>
           </c:choose>      	
           
                    
            <div style="margin:0 auto;width:300px">
           	
            <table style="width:100%">            	
            	<c:forEach var="i" begin="1" end="${fn:length(categorylist)}" step="1">  <!-- 카테고리 리스트끝까지 반복 -->
           		<c:forEach var="catelist" items="${categorylist}" varStatus="status">   
           			
	              	<c:choose>
				    <c:when test="${catelist.category eq i}"> <!-- 카테고리와 인덱스 비교 -->
				        	<table style="width:100%">	
				        	<tr><th style="text-align:left;height:35px;font-size:18px;">${catelist.title}</th></tr>					        		
				        		<c:forEach var="menulist" items="${menulist}" varStatus="status">					        		
				        			<c:choose>						        			
			    					<c:when test="${menulist.category eq i}"> <!-- 메뉴리스트와 인덱스 비교 -->
			    					<tr>
				    					<td width="50%">${menulist.name}<input type="hidden"></td>
				    					<td width="30%">${menulist.price}</td>
				    					<td align="right" width="20%">
				    						<div data-enhance="false">
				    						<a class="bt_up" style="cursor:pointer;font-size:28px;text-decoration:none;">+</a>
				    						<input type="text" class="num" name="menunum${menulist.cnt }" value="0" readonly >
				    						<a class="bt_down" style="cursor:pointer;font-size:28px;text-decoration:none;">-</a>
				    						<input type="hidden" name="menutitle${menulist.cnt }" value="${menulist.name}">
				    						<input type="hidden" name="menuidx${menulist.cnt }" value="${menulist.idx }">
				    						<input type="hidden" name="menuprice${menulist.cnt }" value="${menulist.price}">					    						
				    						</div>
				    					</td>
			    					</tr>
			    					</c:when>						   
									</c:choose>										
				        		</c:forEach>						        		
				        	</table>
				        	<input type="hidden" name="menucnt" value="${fn:length(menulist)}">				        	
				        	<input type="hidden" name="table" value="${table}">
				        	<input type="hidden" name="stNum" value="${stNum}">
				    </c:when>
					</c:choose>
				</c:forEach>
	           </c:forEach>
            </table>                      
                <br/><br/>
                <input type="hidden" value="1" id="cnt" name="cnt">
                <a href="" data-transition="slideup" style="text-decoration: none;"><input type="button" value="주문" onclick="orderok()"></a>   
            </form> 
            </div>   
        <br/>
    </div>
</body>
 <script type="text/javascript">
    var webSocket = new WebSocket('ws://13.124.195.129:8080/broadcasting');
    var orderNum = document.getElementById('ordernum');
    webSocket.onerror = function(event) {
        onError(event)
      };
      webSocket.onmessage = function(event) {
        onMessage(event)
      };
    function onError(event) {
      alert(event.data);
    }
    function send() {    	
        webSocket.send(${stNum}+"&"+document.getElementById("ordernum").value+"@"+${table});
    }
    function orderok(){
   	 	send();
   	 	orderchk.submit();   
    }
   
  </script>
</html>