<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vo.ExBoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ExBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ExBoardDAO manager = ExBoardDAO.getInstance();
	List<Map<String,Object>> list = manager.getList(); // getList 메서드 호출
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>

<body>
	<center>
		<h3>게시판 목록</h3>
		<table border="1" width="900">
			<tr>
				<td width="10%">번호</td>
				<td width="15%">이름</td>
				<td width="30%">제목</td>
				<td width="20%">작성일</td>
				<td width="10%">조회수</td>
				<td width="15%">ip</td>
			</tr>
			<%
				if(list != null){ // 데이터베이스에 데이터가 있으면
					for(int i=0;i<list.size();i++) {
						Map<String,Object> rmap = list.get(i);// 반환된 list에 담긴 참조값 할당
			%>
			<tr>
				<td><%=rmap.get("NO") %></td>
				<td><%= rmap.get("NAME") %></td>
				<td>
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값을 갖고 content.jsp로 이동 --%>
					<!--           <a href = "content.jsp?no=2"> 제목이외다 </a>             -->
					<a href="content.jsp?no=<%=rmap.get("NO")%>"><%=rmap.get("SUBJECT") %></a>
				</td>
				<td><%=df.format(rmap.get("REG_DATE")) %></td>
				<td><%=rmap.get("READCOUNT") %></td>
				<td><%=rmap.get("IP") %></td>
			</tr>
			<%
					}
				}else{ // 데이터가 없으면
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			<tr>
			<%
				}
			%>
			<tr>
				<td colspan="6" align="right">
					<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%>
					<input type="button" value="글작성" onclick="location.href='writeForm.jsp'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>