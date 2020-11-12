<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="java.lang.*" %>    
<%@ page import="web.mvc.*" %> 
     <%																	
  		String b_num 	= request.getParameter("u_num");
  		String b_class 	= request.getParameter("u_class");
  		String b_contents 	= request.getParameter("u_contents");
  		String b_title 	= request.getParameter("u_title");
     
  		int num = 0;		
    	 Map<String,Object> pMap = new HashMap<>();
    	 if(b_num!=null){
  				num = Integer.parseInt(b_num);
  				pMap.put("b_num", num);
  			}
    	 if(b_class!=null){
			pMap.put("b_class", b_class);
  			}
    	 if(b_contents!=null){
			pMap.put("b_contents", b_contents);
  			}
    	 if(b_title!=null){
			pMap.put("b_title", b_title);
  			}
  		BoardDao bDao = new BoardDao();
  		bDao.updateBoardList(pMap);
  		response.sendRedirect("./boardList.jsp");
	%>
	