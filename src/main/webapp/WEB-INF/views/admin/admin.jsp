<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="${path }/assets/css/jquery.mobile-1.4.5.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/assets/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>
    <title>Insert title here</title>  
</head>

<body style="height:100%;">
    <p class="title">관리자 메뉴</p>

    <div style="margin:80px auto;text-align: center">
                <input type="button" value="주문대기" onclick="location.href='${path }/wtorder?stNum='+${authUser.stNum}"><br>
                <input type="button" value="메뉴등록" onclick="location.href='${path }/qrOrder/admin/menu.jsp'"><br>
                <input type="button" value="QR생성,확인" onclick="location.href='${path }/qrcode'"><br>
                <input type="button" value="로그아웃" onclick="location.href='${path }/adlogin'"><br>
           
    </div>
</body>

</html>