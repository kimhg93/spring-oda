<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${path }/assets/css/jquery.mobile-1.4.5.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/assets/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <title>Insert title here</title>
</head>
<script>
    $(function() {
        setTimeout(hideSplash, 2000);
    });

    function hideSplash() {
        $.mobile.changePage("#home", "fade");
    }
</script>

<body style="height:100%;background-color: #ffffff;">
    <div data-role="page" id="splash" style="width:100%;height: 100%;margin:0 auto;text-align: center">
        <img src="${path }/assets/img/intro.jpg" style="width:80%;overflow: hidden;max-height:900px;max-width:450px">
    </div>
    <div class="cover" data-role="page" id="home">
        <p class="title">로그인</p>
        <div style="margin:80px auto;text-align: center">
            <form name="login" action="/login" method="post" id="login">
                <input type="text" class="inpt" name="adId" id="id" placeholder="아이디" autocomplete="off">
                <input type="password" class="inpt" name="adPw" id="pw" placeholder="비밀번호"><br>
                <p id="fail" style="color:red;display:none;">id 또는 pw 확인</p>
                <input type="button" value="로그인" onclick="ajaxlogin(this.form);return false;">
            </form>
            <br>
            <br>
            <a href="${path }/admin/join" data-transition="slideup">신규업체 등록</a><br>
            <a href="" data-transition="slideup">아이디 / 비밀번호 찾기</a>
        </div>

    </div>
    <script>
		    function ajaxlogin(form) {
		        var formData = $("#"+form.name).serialize();
		        $.ajax({
		            type: "POST",
		            url: "${path }/admin/auth",
		            data: formData,
		            success: function(response) {
		            	alert(response);
		            	 if(response=="1"){
		            		 location.href='${path}/admin/index';
		            	 } else{		            		 
		            		 $("#fail").show();
		            	 }
		            },
		            error: function() {	
		            }        
		        });
		        
		    }
	    </script>
</body>

</html>