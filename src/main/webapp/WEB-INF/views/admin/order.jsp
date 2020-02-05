<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/qrOrder/css/jquery.mobile-1.4.5.min.css" type="text/css">
    <link rel="stylesheet" href="/qrOrder/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <title>Insert title here</title>  
    <script>
   
    </script>
    <style>
    	.black_overlay{
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}

.white_content {
	display: none;
	position: absolute;
	position:absolute;
	  top:50%;
	  left:50%;
	  transform:translate(-50%, -50%);
	width: 70%;
	height: 70%;
	padding: 16px;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
.ui-input-text {
	border:0;
	padding:0;
}
.orderchk tr{
	height:27px !important;
	font-size:16px;
}
    </style>
</head>

<body style="height:100%;">
<div class="cover">
    <p class="title">${stName }</p>
    <p class="sub_tlt" style="margin-top:-30px">관리자 주문대기</p>
       <table style="width:100%" cellpadding="0">
        <c:forEach var="i" begin="1" end="${tbcnt}" step="1">
        
            <c:set var="doneLoop" value="false" />
            <c:forEach var="noworder" items="${noworder}" varStatus="status">
                <c:choose>
                <c:when test="${noworder.table eq i}">
                    <c:if test="${not doneLoop}">
                    <tr>
                    <td id="data${i }" style="display:block">
                        <form name="getorder${i }" method="post" action="/" id="getorder${i }">
                            <input type="text" style="width:100%;height:100%;background-color:#ededed;height:45px;" value="테이블 ${i }" id="${i }" onclick="getorder(this.form);return false;" readonly>
                            <input type="hidden" id="ordernum${i }" name="ordernum" value="${noworder.orderNum }">
                            <input type="hidden" id="stNum" name="stNum" value="${stNum}">
                            <input type="hidden" id="tbnum" name="tbnum" value="${i}">
                        </form>
                    </td>
                    </tr>
                    <c:set var="doneLoop" value="true" />
                    </c:if>
                </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${not doneLoop}">
            	<tr>
                <td id="data${i }" style="display:none;">
                    <form name="getorder${i }" method="post" action="/" id="getorder${i }">
                        <input type="text" style="width:100%;height:100%;background-color:#ffffff;height:45px;" value="테이블 ${i }" id="${i }" onclick="" readonly>
                        <input type="hidden" id="ordernum${i }" name="ordernum" value="">
                        <input type="hidden" id="stNum" name="stNum" value="${stNum}">
                        <input type="hidden" id="tbnum" name="tbnum" value="${i}">
                    </form>
                </td>
                </tr>
                <c:set var="doneLoop" value="true" />
            </c:if>
        
        </c:forEach>
    </table>

    	<div id="light" class="white_content">
    	
    	<form name="orderchkfrm" id="orderchkfrm" action="/" method="post">
	    	<div style="margin:0px auto;width:100%;text-align:center;">
	    	<p class="sub_tlt" style="width:auto;margin:10px auto">주문내역</p>
	    	<table id="orderchk" class="orderchk" cellspacing="0" cellpadding="0" style="width:100%"></table>
	    	    <br>
	    		<a style="font-size:22px" href = "javascript:void(0)" onclick = "closet();">닫기</a>&emsp;
				<a style="font-size:22px" href = "javascript:void(0)" onclick = "orderchk(this.form);return false;">주문확인</a>
			</div>
		</form>	
		</div>
        <div id="fade" class="black_overlay"></div>
        </div>
    <div id="sound"></div>
<script>
var contents = '';
function closet(){
	document.getElementById('light').style.display='none';
	document.getElementById('fade').style.display='none';
	contents = '';
	$( '#orderchk > tbody').empty();
}



//////////////////////////////////////////////////////////////주문 확인버튼에 대한 기능 필요 ajax로 만들어야됨, ordernum 히든타입으로 생성해놓음 ajax작성과 form 추가 하면 될듯
function orderchk(form) {
    var formData = $("#orderchkfrm").serialize();
    $.ajax({    	
        type: "POST",
        url: "/orderchk",
        data: formData,
        cache : false,
        dataType : "JSON",
        success: function(data) { 
        	if(data.result>0){
        		document.getElementById(data.tbnum).style.backgroundColor = "#ededed";     
        		send();
        	}
        	closet();
        },
        error: function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }    
    });	        
}


function getorder(form) {
	var ordernum = form.ordernum.value;
    var formData = $("#"+form.name).serialize();
    $.ajax({    	
        type: "POST",
        url: "/getorder",
        data: formData,
        cache : false,
        dataType : "JSON",
        success: function(data) { 
        	/* alert(ordernum); */
        	//alert(data.size);   
        	contents += '<tbody>';
        	contents += '<tr>';     	
    		contents +=	'<td><input type="hidden" name="tbnum" value="'+data.tbnum+'" /></td>';
    		contents += '</tr>'; 
    		if(data.listB.length>0){
            	contents += '<tr>';     	
        		contents +=	'<th colspan="3"><b>신규주문</b></th>';
        		contents += '</tr>'; 
    		}
        	for(var i=0; i<data.listB.length; i++){        		 
        		contents += '<tr style="background-color:#ededed">'; 
        		contents +=	'<td><input type="hidden" name="ordernum" value="'+ordernum+'" />'+data.listB[i].title+'</td>'; 
        		contents +=	'<td>'+data.listB[i].cnt+'</td>';
        		contents +=	'<td>'+data.listB[i].price+'</td>';
        		contents += '</tr>';   		
        	}
        	if(data.listA.length>0){
            	contents += '<tr>';     	
        		contents +=	'<th colspan="3"><b>기존주문</b></th>';
        		contents += '</tr>'; 
    		}
        	for(var i=0; i<data.listA.length; i++){        		 
        		contents += '<tr>'; 
        		contents +=	'<td><input type="hidden" name="ordernum" value="'+ordernum+'" />'+data.listA[i].title+'</td>'; 
        		contents +=	'<td>'+data.listA[i].cnt+'</td>';
        		contents +=	'<td>'+data.listA[i].price+'</td>';
        		contents += '</tr>';   		
        	}
        	contents += '</tbody>';
        	$('#orderchk').append(contents);
        	
        	document.getElementById('light').style.display='block';
        	document.getElementById('fade').style.display='block';
        },
        error: function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }    
    });	        
}

</script>

</body>

    <script type="text/javascript">
    function test(){
    }
        var webSocket = new WebSocket('ws://13.124.195.129:8080/broadcasting');
        webSocket.onerror = function(event) {
            onError(event)
          };
          webSocket.onmessage = function(event) {
            onMessage(event)
          };
          function send() {    	
  	        webSocket.send("ok");
  	    }
    function onMessage(event) {
    	ontext = event.data;
    	/* alert(ontext); */
    	loca = ontext.indexOf("&");
    	locb = ontext.indexOf("@");
    	stnum = ontext.substring(0, loca);
    	ordernum = ontext.substring(loca+1, locb);
    	table = ontext.substring(locb+1, ontext.length);
    	if(stnum==${stNum }){
    		//alert(stnum);
    		//alert(ordernum);
    		//alert(table);
            playSound('chord');
    		vibrate();            
    		document.getElementById("data"+table).style.display='block';
    		document.getElementById(table).style.backgroundColor = "#afa1ff"; 
    		
    		if(!$("#ordernum"+table).val()>0){
    			$("#"+table).click(function(){ getorder(this.form);return false; });                 
    		}
    		$("#ordernum"+table).val(ordernum);
    	}   	
    }    
    

	function vibrate() {
    	navigator.vibrate([1000]);
	}
  

    function playSound(filename){   
           document.getElementById("sound").innerHTML='<audio autoplay="autoplay"><source src="/qrOrder/img/' + filename + '.mp3" type="audio/mpeg" /><source src="/qrOrder/img/' + filename + '.ogg" type="audio/ogg" /><embed hidden="true" autostart="true" loop="false" src="/qrOrder/img/' + filename +'.mp3" /></audio>';
    }
  </script>
</html>