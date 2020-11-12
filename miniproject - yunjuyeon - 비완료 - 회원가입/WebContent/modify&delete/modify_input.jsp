<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num");
String password = request.getParameter("password");


Class.forName("oracle.jdbc.driver.OracleDriver"); 

String url = "jdbc:oracle:thin:@192.168.0.39:1521:orcl"; 
Connection conn = DriverManager.getConnection(url,"scott","tiger"); 

PreparedStatement pstmt = null; 
ResultSet rs = null; 

String strSQL = "SELECT password FROM MIINIPROJECT2020 WHERE num = ?"; 
pstmt = conn.prepareStatement(strSQL); 
pstmt.setInt(1,Integer.parseInt(num)); 

rs = pstmt.executeQuery(); 
rs.next(); 

String goodpassword = rs.getString("password"); 
if (password.equals(goodpassword)){
	response.sendRedirect("./modify.jsp?num=" + num); 
}else{
	response.sendRedirect("./modify_password.jsp?num=" + num);	 
} 

rs.close(); 
pstmt.close();
conn.close(); 
 %>
