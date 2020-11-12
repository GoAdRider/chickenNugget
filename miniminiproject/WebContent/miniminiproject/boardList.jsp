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
		}
		td{
			 font-size: 16px;
		}
		#bt_write{
			width: 110px;
			height: 40px;
			margin-left: 69%;
			border: 1px solid gray;
			 border-radius: 5px;
			 /* border-style: none; */
			 font-size: 16px;
			 font-weight: bold;
			 background: #FFFFFF;
			background: -moz-linear-gradient(top, #FFFFFF 0%, #EAEAEA 56%, #C1C1C1 100%);
			background: -webkit-linear-gradient(top, #FFFFFF 0%, #EAEAEA 56%, #C1C1C1 100%);
			background: linear-gradient(to bottom, #FFFFFF 0%, #EAEAEA 56%, #C1C1C1 100%);
		}
</style>
<meta charset="UTF-8">
<title>게시글 목록</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
 <script>
		$(function () {
		//동적으로 원격에 있는 JSON 파일(결과값)을 로드
		$.ajax({
				url:"getBoardList.jsp",
				dataType: "json",
				success: function (data) {
						$.each(data, function (index,entry) {
						$('#t_start').append("<tr><td name='bnum'>" 
													+ entry.B_NUM + "</td><td>" 
													+ entry.B_CLASS +"</td><td>" 
													+ "<a href=boardArticle.jsp?cols=B_NUM&keyword="+entry.B_NUM+">"+ entry.B_TITLE + "</a></td><td>" 
													+ entry.B_AUTHOR + "</td><td>" 
													+ entry.B_DATE + "</td><td>" 
													+ entry["B_PVIEW"] + "</td></tr>");
						}); ////////////////////////////////////end of each
						//alert('json의 길이는===>'+Object.keys(data).length);
					} /////////////////////////////end of success
				,error: function () { alert("에러발생"); }
						});
			}); //////////////////////////////////end of 익명함수
			
</script>
<style type="text/css">
	td {
  		text-align: center;
		}
</style>
</head>

<body>
		<div style="margin-bottom:  1%;"></div>
		<h1 style="margin-left:25%"> 자유게시판 </h1>
	<form action="boardWriteform.jsp" method="post">
		<input id="bt_write" type="submit" value="글쓰기" style="color: black;">
		</form>
	<form id=f_board action="boardArticle.jsp" method="get">
		<table>
			<thead>
					<tr>
						<th >글번호	</th>
						<th>분류		</th>
						<th>글제목</th>
						<th>글작성자</th>
						<th>날짜		</th>
						<th>조회수	</th>
					</tr>
			</thead>
			<tbody id="t_start"> 
								<!-- ===============TBODY시작==================== -->
								<!-- ===============TBODY 끝==================== -->
			</tbody>
			</table>
			</form>
        <div id="pagination"></div>
</body>
</html>