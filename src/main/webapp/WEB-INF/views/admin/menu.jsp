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
<script>
    cnt = 1;   
    ctg_cnt = 3;
    function add_row(i) {
        var tb_id = document.getElementById('tb_menu'+i);
        // var row = my_tbody.insertRow(0); // 상단에 추가
        var row = tb_id.insertRow(tb_id.rows.length); // 하단에 추가       
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var newinput = document.getElementById("menu"+cnt);
        cell1.colSpan = 2
        cell1.innerHTML =   '<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">'+
                            '<input type="text" name="name'+cnt+'" placeholder="이름"></div>'+
                            '<input type="hidden" name="idx'+cnt+'" value="'+i+'">';
        cell2.innerHTML = 	'<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">'+
        					'<input type="text" name="price'+cnt+'" placeholder="가격"></div>';
        cnt++;
        document.getElementById("cnt").value=cnt-1;
    }

    function delete_row(i) {
        var tb_id = document.getElementById('tb_menu'+i);
        if (tb_id.rows.length < 1) return;
        // my_tbody.deleteRow(0); // 상단부터 삭제
        tb_id.deleteRow(tb_id.rows.length - 1); // 하단부터 삭제
    } 
    
    function open(i){    	
    	if( $("#tb_menu"+i).css("display") != "none" ) {
    	    $("#tb_menu"+i).hide();
    	} else {
    	    $("#tb_menu"+i).show()
    	}
        if( $("#addbtn"+i).css("display") != "none" ) {
    	    $("#addbtn"+i).hide();
    	} else {
    	    $("#addbtn"+i).show()
    	}
    }
    
    function add_ctg(){
    	 var tb_id = document.getElementById('tb_category');
         // var row = my_tbody.insertRow(0); // 상단에 추가
         var row = tb_id.insertRow(tb_id.rows.length); // 하단에 추가       
         var cell1 = row.insertCell(0);
         var newinput = document.getElementById("menu"+ctg_cnt);
         cell1.colSpan = 2
         cell1.innerHTML =  '<table style="width:300px">'+
					 		'<tr><td><div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">'+
					 		'<input type="text" name="category'+(ctg_cnt+1)+'" id="category'+(ctg_cnt+1)+'" placeholder="카테고리 명"></div></td>'+
					        '<td><a href="javascript:open('+(ctg_cnt+1)+')">▼</a></td></tr></table>'+
					        '<div style="text-align:right;display: none;" id="addbtn'+(ctg_cnt+1)+'"><a href="javascript:add_row('+(ctg_cnt+1)+')">메뉴추가</a>&emsp;<a href="javascript:delete_row('+(ctg_cnt+1)+')">삭제</a></div>'+
					        '<table style="width:300px;display:none" id="tb_menu'+(ctg_cnt+1)+'"></table>' 
					         
         ctg_cnt++;
         document.getElementById("ctg_cnt").value=cnt-1;
    }    
    function delete_ctg(){
    	var tb_id = document.getElementById('tb_category');
        if (tb_id.rows.length < 4) return;
        // my_tbody.deleteRow(0); // 상단부터 삭제
        tb_id.deleteRow(tb_id.rows.length - 1); // 하단부터 삭제
    }   
</script>
    
    <style>
        a{
            text-decoration: none !important;
        }
        .ui-input-text {
            width:auto;        
        }
    </style>
<body style="height:100%;">
    <div class="cover">
        <p class="title">온라인 업체등록</p>
        <form name="menu" id="menu" action="/newMenu" method="post" data-ajax="false">        	
            <p class="sub_tlt">메뉴등록</p>            
            <div style="margin:0 auto;width:300px">
            <div style="text-align:right;" id=""><a href="javascript:add_ctg()">카테고리추가</a>&emsp;<a href="javascript:delete_ctg()">삭제</a></div>
            <table id="tb_category">
            	<tr>
	            	<td>
		            	<table style="width:300px">
			        		<tr>
			        			<td><input type="text" name="category1" id="category1" placeholder="카테고리 명"></td>
		                        <td><a href="javascript:open(1)">▼</a></td>
			        		</tr>
			        	</table>
		                <div style="text-align:right;display: none;" id="addbtn1"><a href="javascript:add_row(1)">메뉴추가</a>&emsp;<a href="javascript:delete_row(1)">삭제</a></div>
		                <table style="width:300px;display:none" id="tb_menu1"></table>
	                </td>
                </tr>
                <tr>
                	<td>
                		<table style="width:300px">
			        		<tr>
			        			<td><input type="text" name="category2" id="category2" placeholder="카테고리 명"></td>
		                        <td><a href="javascript:open(2)">▼</a></td>
			        		</tr>
			        	</table>
		                <div style="text-align:right;display: none;" id="addbtn2"><a href="javascript:add_row(2)">메뉴추가</a>&emsp;<a href="javascript:delete_row(2)">삭제</a></div>
		                <table style="width:300px;display:none" id="tb_menu2"></table> 
                	</td>
                </tr>
                <tr>
                	<td>
                		<table style="width:300px">
			        		<tr>
			        			<td><input type="text" name="category3" id="category3" placeholder="카테고리 명"></td>
		                        <td><a href="javascript:open(3)">▼</a></td>
			        		</tr>
			        	</table>
		                <div style="text-align:right;display: none;" id="addbtn3"><a href="javascript:add_row(3)">메뉴추가</a>&emsp;<a href="javascript:delete_row(3)">삭제</a></div>
		                <table style="width:300px;display:none" id="tb_menu3"></table> 
                	</td>
                </tr>
            </table>               
                <br/>
                
                <input type="hidden" value="1" id="cnt" name="cnt">
                <input type="hidden" value="3" id="ctg_cnt" name="ctg_cnt">
                <input type="submit" value="메뉴등록">
            </div>            
        </form>
        <br/>
    </div>
</body>
</html>