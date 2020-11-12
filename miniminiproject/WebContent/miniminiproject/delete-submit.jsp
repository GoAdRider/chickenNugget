<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="java.lang.*" %>    
<%@ page import="web.mvc.*" %> 
     <%																		//post-name이 들어감 get-url의 변수이름
  		String b_num 	= request.getParameter("b_num");
  		int num = 0;		
    	 if(b_num!=null){
  				num = Integer.parseInt(b_num);
  			}
  		BoardDao bDao = new BoardDao();
  		bDao.deleteBoard(num);
  		response.sendRedirect("./boardList.jsp");
	%>
	