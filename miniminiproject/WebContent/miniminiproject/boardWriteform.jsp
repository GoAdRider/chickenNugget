<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	 * {
	 	margin: 0;
	 	padding: 0;
	 	font-family: 'Noto Sans KR', sans-serif;
	 }
		table {
			border: solid 1px black;
			width: 50%;
			height: 50%;
			margin-left: 25%;
			padding: 10px;
		}
		tr{
			text-align: left;
			float: left;
		}
		th{
			float: left;
		}
		td {
			float: left;
  			text-align: left;
		}
		label{
			width: 150px;
		}
		#contents{
			border-top: 1px solid gray;
		}
		#tb_contents{
			 width:  50%;
			 height: 50%;
		}
		#headrow{
			 width:  100%;
		}
		#btn_write, #btn_cancel{
		font-size:150%; display: inline; margin-top:20px; width: 120px; 	height: 50px; text-align: center;
		}
		#btn_cancel {
		 margin-left:24%;
		}
</style>
<meta charset="UTF-8">
<title>글쓰기 창</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<!-- ====================여기는 head script============= -->
<script>
		function myformatter(date){
		    var y = date.getFullYear();
		    var m = date.getMonth()+1;
		    var d = date.getDate();
		    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		// extend the 'equals' rule
		$.extend($.fn.validatebox.defaults.rules, {
		    equals: {
		        validator: function(value,param){
		            return value == $(param[0]).val();
		        },
		        message: '비밀번호가 맞지 않습니다.'
		    }
		});
</script>

<!-- ====================여기는 head script============= -->

<body>
<!--====================여기는 body script=============  -->
<script>
		//-------------------extend textbox 시작------------
		$.extend($.fn.textbox.methods, {
			setBorder: function(jq, border){
				var style = $('#easyui-textbox-border');
				if (!style.length){
					$('head').append(
							'<style id="easyui-textbox-border">' +
							'.textbox-noborder{border-color:transparent;border-radius:0}' +
							'</style>'
					);
				}
				return jq.each(function(){
					var span = $(this).next();
					if (border) {
						span.removeClass('textbox-noborder');
					} else {
						span.addClass('textbox-noborder');
					}
				});
			}
		}) //-----------end of extend textbox

	$(document ). ready(function(){
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
		$('#tb_title').textbox({
			label: '제목 :'
			,labelAlign: 'right'
			,labelWidth: 50
			,width: 250
		});
		$('#tb_author').textbox({
			label: '작성자 :'
			,labelAlign: 'right'
			,labelWidth: 70
			,width:150
		});
		var td =myformatter.call($('#dt_date')[0],new Date());
		$('#dt_date').textbox({
			 disabled:true
			 ,formatter:myformatter
			,label: '작성일 :'
			,labelAlign: 'right'
			,labelWidth: 70
			,width: 160
		});
			$('#dt_date').textbox('setBorder', false);
			$('#dt_date').textbox('setValue', td);
		$('#tb_pview').textbox({
			label: '조회수 :'
			,labelAlign: 'right'
			,labelWidth: 70
			,width:120
			,disabled: true
		});
		$('#tb_pview').textbox('setBorder', false);
		$('#tb_contents').textbox({
			height:300
			,multiline: true
		});
		$('#tb_contents').textbox('setBorder', false);
	$('#btn_write').linkbutton({
		 iconCls: 'icon-search'
	});
	});//---------------------------------------------end of document ready 
</script>
		<div style="margin-bottom: 1%;"></div>
		<h1 style="margin-left:25%"> 자유게시판 </h1>
		<form name="table" method="post" action="./write-submit.jsp">
				<table>
					<thead>
							<tr id="headrow">
								<th > <input id="cb_class" 	 name="classis" class="easyui-combobox"	 data-options="required:true">	</th>
								<th > <input id="tb_title" 	 name="title"	type="text"  class="easyui-textbox">	</th>
								<th >  <input id="tb_author" name="author"	type="text"  class="easyui-textbox"></th>
								<th > <input id="dt_date" 	 name="date"	type="text" class="easyui-textbox ">	</th>
								<th > <input id="tb_pview"	 name="pview"	type="text"  class="easyui-textbox">	</th>
							</tr>
					</thead>
					<tbody id="t_start"> 
										<!-- ===============TBODY시작==================== -->
							<tr>
								<td >
								<div id="contents"> 
									<textarea id="tb_contents" name="contents"></textarea>
								</div>
								</td>
							<tr>
										<!-- ===============TBODY 끝==================== -->
					</tbody>
				</table>
		<div style="display: inline-block; margin-left: 25%;">
		<!--=================== 패스워드 ======================= -->
			<div style="float:right">
				<label for="pwd">비밀번호: </label>
				<input id="pwd" name="pwd" type="password" class="easyui-validatebox" >
			</div>
			 <br>
			<div style="float:right">
				<label for="rpwd">비밀번호 확인: </label>                                                                  <!-- 나중에 required="required"   -->
				<input id="rpwd" name="rpwd" type="password" class="easyui-validatebox"   validType="equals['#pwd']" >
			</div>
		</div>
			<input id="btn_cancel"  href="boardList.jsp" class="easyui-linkbutton"  type="submit" value="돌아가기" >
			<input id="btn_write"  type="submit" value="글쓰기" >
		<!--=================== 패스워드 ======================= -->
		</form>
</body>
</html>