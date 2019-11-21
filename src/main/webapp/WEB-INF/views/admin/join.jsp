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
</script>
<body style="height:100%;">
    <div class="cover">
        <p class="title">온라인 업체등록</p>
        <form name="join" id="join" action="${path }/admin/join" method="post" data-ajax="false">
            <p class="sub_tlt">기본 정보</p>
            <input type="text" name="adId" placeholder="*아이디" required>
            <input type="password" name="adPw" placeholder="*비밀번호" required>
            <input type="password" name="pwchk" placeholder="*비밀번호 확인" required>
            <input type="text" name="adName" placeholder="*이름" required>
            <input type="tel" name="adPhone" placeholder="*연락처" required>
            <p class="sub_tlt">사업장 정보</p>
            <input type="tel" name="stNum" placeholder="*사업자 번호(-제외)" required>
            <input type="text" name="stName" placeholder="상호명" required>
            <input type="tel" name="stPhone" placeholder="전화번호" required>            
            <input type="text" name="adAddr" placeholder="주소" required>
            <input type="tel" name="stTbcnt" placeholder="*테이블 수" required><br/>
            <a href="" data-transition="slideup" style="text-decoration: none;"><input type="button" value="완료" onclick="this.form.submit()"></a>
        </form>
        <br/>
    </div>
</body>

</html>