<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="java.lang.*" %>    
<%@ page import="web.mvc.*" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String bnum = request.getParameter("keyword");
	//-------------------------페이지뷰 +1----------
	int b_num=9999;
	if(bnum!=null){
		b_num = Integer.parseInt(bnum);
	}
	BoardDao bDao = new BoardDao();
	int result = bDao.updatePview(b_num);
	//-----------------------------------------------
%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		 * {
	 	margin: 0;
	 	font-family: 'Noto Sans KR', sans-serif;
	 		}
		#buttons{
			margin-left: 25%;
		}
		#btn_toList, #btn_delete, #btn_update{
			font-size: 20px;
			width: 100px;
			height: 50px;
			text-align: center;
			font-weight: bold;
			padding-top: 10px;
		}
		#btn_toList{
			margin-left: 45%;
		}
		table {
			border: solid 1px black;
			width: 50%;
			height: 50%;
			margin-left: 25%;
			table-layout: fixed;
			display:table;
		 	padding: 10px;
		}
		tr{
			text-align: left;
			float: left;
	
		}
		th{
			float: left;
			font-size: 16px;
			 font-weight: bold;
		}
		td {
  			text-align: left;
		}
		a{
			display: inline;
		}
		h3{
			 text-align: center;
		}
		#tb_contents{
			 width:  100%;
			 height: 300px;
			 border-style: none;
			font-size: 16px;
			margin: 0px; 
			resize: none;
		}
		#headrow{
			 width:  100%;
		}
		#title{
			border-style: none;
			font-weight: bold;
		}
		#updOK{
			margin-left: 40%;
		}
		#td_textarea{
			width: 1000px; 
			border-top: 1px solid gray;
		}
		#dlg_update{
		    padding: 5px;
		}
		.head{
			float: right;
			width: 120px;
			border-style: none;
			font-size: 16px;
		}
</style>
<meta charset="UTF-8">
<title>게시글 보기</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<!-- ====================여기는 head script============= -->
<script>
	function openDelete(){
		$('#dlg_delete').dialog('open');
	}
	function cancelDelete(){
		$('#dlg_delete').dialog('close');
	}
	function openUpdate(){
		$('#upd_class').combobox('select', $('#class').val());
		$('#upd_title').textbox('setValue', $('#title').val());
		$('#upd_contents').text($('#tb_contents').val());
		$('#dlg_update').dialog('open');
	}
	function cancelUpdate(){
		$('#dlg_update').dialog('close');
	}
	function doDelete(){
		var b_num = "<%=bnum%>";
		window.location.href = "delete-submit.jsp?b_num="+b_num; 
	}
	function doUpdate(){
		var b_num = "<%=bnum%>";
		var queryString = $("form[name=f_update]").serialize();
		window.location.href = "update-submit.jsp?"+queryString+"&u_num="+b_num;
	}
	$(function () {
		//동적으로 원격에 있는 JSON 파일(결과값)을 로드
		$.ajax({
			url:"getBoardList.jsp?cols=B_NUM&keyword="+<%=bnum%>
			,dataType: "json"
			,success: function (data) {
					$('#num')			.val(data[0].B_NUM		);
					$('#class')			.val(data[0].B_CLASS	);
					$('#title')			.val(data[0].B_TITLE	);
					$('#author')		.val(data[0].B_AUTHOR	);
					$('#date')			.val(data[0].B_DATE	);
					$('#pview')			.val(data[0].B_PVIEW	);
					$('#tb_contents')	.val(data[0].B_CONTENTS);
			},
				error: function () { alert("에러발생"); }
		
			}); ////////////////////////////////end of ajax
	});  ///////////////////////end of 익명함수
</script>
<!-- ====================여기는 head script============= -->
<!-- ====================여기는 body script============= -->
<body>
	<div id="go"></div>
<script>
	//------------------------------------------ready
	$(document ). ready(function(){
		$('#dlg_delete').dialog({
		    title: '글삭제하기',
		    width: 400,
		    height: 200,
		    closed: true,
		    cache: false,
		    modal: true
		});
		$('#dlg_update').dialog({
		    title: '글수정하기',
		    width: 500,
		    height: 450,
		    closed: true,
		    cache: false,
		    modal: true
		});
		$('#cb_class').combobox({
			 valueField: 'label'
			,textField: 'value'
			,data: [{
						label: '유머',
						value: '유머'
					},{
						label: '감동',
						value: '감동'
					},{
						label: '정보',
						value: '정보'
					},{
						label: '제보',
						value: '제보'
					},{
						label: '기타',
						value: '기타'
					}]
			,width:80
		});
	});//////////////////////end of ready                                                           
</script>
		<div style="margin-bottom: 1%;"></div>
		<h1 style="margin-left:25%"> 자유게시판 </h1>
		<br>
		<br>
		<form name="table">
				<table>
					<thead>
							<tr id="headrow">
								<th > 
								<b>
								<label style="font-size: 20px;" for="title">제목: </label>
								<input readonly id="title" type="text"  style="font-size: 20px;">	
								</b>
								</th>
							</tr>
							<tr id="secondHead">
								<th > 
								<label for="num">글번호: </label>
								<input readonly id="num"  name="b_num"  type="text" class="head" >
								</th>
								<th > 
								<label for="class">분류: </label>
								 <input readonly id="class"  name="b_class" type="text"  class="head">
								 	</th>
								<th > 
								<label for="author">작성자: </label>
								<input readonly id="author"  name="b_author" type="text"  class="head">
								</th>
								<th > 
								<label for="date">작성일: </label>
								<input readonly id="date" type="text" class="head">	
								</th>
								<th > 
								<label for="pview">조회수: </label>
								<input readonly id="pview" type="text"  class="head">
								</th>
							</tr>
					</thead>
					<tbody id="t_start"> 
							<tr >
							<td id="td_textarea"  colSpan="5">
									<textarea readonly id="tb_contents" ></textarea>
							</td>
			
							</tr>
										<!-- ===============TBODY시작==================== -->
										<!-- ===============TBODY 끝==================== -->
					</tbody>
				</table>
		</form>
		<!--================================하단 버튼들========================================  -->
		<div id="buttons"> 
			<a id="btn_delete"  class="easyui-linkbutton"  onclick="openDelete()" style="display:inline-block;" data-options="toggle:true,group:'g2'"><b>글삭제</b></a>
			<a id="btn_update"  class="easyui-linkbutton"  onclick="openUpdate()" style="display:inline-block;" data-options="toggle:true,group:'g2'"><b>글수정</b></a>
			<a id="btn_toList" href="./boardList.jsp" class="easyui-linkbutton"  style="display:inline-block;" data-options="toggle:true,group:'g2'"><b>글목록</b></a>
		</div>
		<!--================================하단 버튼들========================================  -->

<!-- //==================================삭제 화면========================================= -->
		<div id="dlg_delete"> 
				<div>
				<br>
				<br>
				<h3>정말 삭제하시겠어요?</h3> 
				</div>
				<br>
				<a  id="updOK"  class="easyui-linkbutton"  onclick="doDelete()" data-options="iconCls:'icon-ok'"><b>확인</b></a> 
		</div>
<!-- //==================================삭제 화면========================================= -->
<!-- //==================================수정 화면========================================= -->
			<div id="dlg_update">
				<form id="f_update" name="f_update">
						<label for="upd_class">분류: </label>
						 <input id="cb_class" name="u_class" class="easyui-combobox" id="upd_class"  style="width:60px">
						<label for="upd_title">제목: </label>
						 <input name="u_title" class="easyui-textbox" id="upd_title"  style="width:200px">
						<textarea name="u_contents"  id="upd_contents"  style="margin: 0px; height: 300px; width: 100%; resize: none;"></textarea>
						<div style="float: right;">
						<a class="easyui-linkbutton"  onclick="doUpdate()" data-options="iconCls:'icon-ok'"><b>확인</b></a> 
						<a class="easyui-linkbutton"  data-options="iconCls:'icon-no'" onclick="cancelUpdate()"><b>취소</b></a> 
						</div>
				</form>
			</div>
<!-- //==================================수정 화면========================================= -->
</body>
</html>