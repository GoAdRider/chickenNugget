<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String name   = request.getParameter("name");  
String password   = request.getParameter("password"); 
String email  = request.getParameter("email");
String title  = request.getParameter("title");
String contents  = request.getParameter("contents");

Class.forName("oracle.jdbc.driver.OracleDriver");

String url =  "jdbc:oracle:thin:@192.168.0.39:1521:orcl";
Connection conn = DriverManager.getConnection(url,"scott","tiger");

PreparedStatement pstmt2 = null;
	
	
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));




	
String strSQL ="INSERT INTO MIINIPROJECT2020(num, name, password, email, title, contents, writedate, readcount)";
strSQL = strSQL + "VALUES (SEQ_MINIPROJECT2020.NEXTVAL,?, ?, ?, ?, ?, ?, ?)";
pstmt2 = conn.prepareStatement(strSQL);
pstmt2.setString(1, name);
pstmt2.setString(2, password);
pstmt2.setString(3, email);
pstmt2.setString(4, title);
pstmt2.setString(5, contents);
pstmt2.setString(6, indate);
pstmt2.setInt(7, 0);
pstmt2.executeUpdate();

                	
pstmt2.close();
conn.close();

response.sendRedirect("./listboard.jsp"); 
%>
