<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>    
<%@ page import="java.lang.*" %>    
<%@ page import="com.google.gson.Gson" %>    
<%@ page import="web.mvc.*" %> 
<%
	String cols = request.getParameter("cols");
    String keyword = request.getParameter("keyword");
	if(keyword!=null) {
		keyword = keyword.toUpperCase();
	}
    Map<String,Object> pMap = new HashMap<>();
    if(cols!=null){
    	if("B_NUM".equals(cols)){
    		pMap.put("ubNum","B_NUM");
    	}
    	else if("B_CLASS".equals(cols)){
    		pMap.put("ubClass","B_CLASS");
    	}
    	else if("B_TITLE".equals(cols)){
    		pMap.put("ubTitle","B_TITLE");
    	}
    	else if("B_CONTENTS".equals(cols)){
    		pMap.put("ubContents","B_CONTENTS");
    	}
    	else if("B_AUTHOR".equals(cols)){
    		pMap.put("ubAuthor","B_AUTHOR");
    	}
    }
    if(keyword!=null){
    	pMap.put("keyword",keyword);//7566 or SMITH or 3000
    }
    StringBuilder sql = new StringBuilder();
	BoardDao bDao = new BoardDao();
	List<Map<String,Object>> boardList = bDao.getBoardList(pMap);
	Gson g  = new Gson();
	String imsi = g.toJson(boardList);
	out.print(imsi);
%>













