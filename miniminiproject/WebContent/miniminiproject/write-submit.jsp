<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="java.lang.*" %>    
<%@ page import="web.mvc.*" %> 
     <%																		//name이 들어감
  		String classis 	= request.getParameter("classis");
  		String title 	= request.getParameter("title");
  		String author 	= request.getParameter("author");
  		String contents 	= request.getParameter("contents");
  		
  		Map<String,Object> pMap = new HashMap<>();
  			pMap.put("b_class",classis);
  			pMap.put("b_contents",contents);
  			pMap.put("b_title",title);
  			pMap.put("b_author",author);
  		BoardDao bDao = new BoardDao();
  		bDao.insertBoard(pMap);
  		
  		response.sendRedirect("./boardList.jsp");
	%>