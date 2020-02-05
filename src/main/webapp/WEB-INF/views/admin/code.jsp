<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/qrOrder/css/jquery.mobile-1.4.5.min.css" type="text/css">
    <link rel="stylesheet" href="/qrOrder/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <script src="/qrOrder/js/jquery.qrcode.js"></script>
    <script src="/qrOrder/js/qrcode.js"></script>
    <title>Insert title here</title>
</head>
<script>
function qrcode(index,stNum){
	if($("#createok"+index).val().length>1){
		if($("#showok"+index).val().length>1){
			$("#qrcodeCanvas"+index).show();
			$("#showok"+index).val("")
		}else{
			$("#qrcodeCanvas"+index).hide();
			$("#showok"+index).val("hide")
		}
	} else{
		jQuery('#qrcodeCanvas'+index).qrcode({
			text	: "http://o-da.co.kr/menulist?stNum="+stNum+"&table="+index
		});	
		$("#createok"+index).val("ok");
	}
		
}
</script>
<style>
	.ui-input-text {
	border:0;
	padding:0;
}
.orderchk tr{
	height:27px !important;
	font-size:16px;
}
</style>
<body style="height:100%;">
    <div class="cover">
        <p class="title">QR코드 목록</p>
        <table style="width:80%; margin:0px auto" cellpadding="0">
        <c:forEach var="i" begin="1" end="${tbcnt}" step="1">
                <tr>
                    <td id="data${i }" style="display:block" align="center">
                            <div onclick="qrcode(${i},${stNum });" style="width:100%;height:100%;background-color:#ededed;height:45px;" id="${i }" readonly>
                            <span>테이블${i}</span></div>
                            <input type="hidden" id="createok${i}" value="">
                            <input type="hidden" id="showok${i}" value="">
                            <div id="qrcodeCanvas${i }" style="text-align:center"></div>
                    </td>
                </tr>
         </c:forEach>
    	</table>
        <br/>
    </div>
</body>

</html>