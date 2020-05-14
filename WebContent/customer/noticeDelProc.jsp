<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>   
<%
String seq=request.getParameter("c");

//connect db
String sql="delete from notices where seq=?";

//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, seq);
int af=pstmt.executeUpdate(); //return int
if(af>0){
	response.sendRedirect("notice.jsp");
}else{
	out.write("삭제오류");
	
}


%>
 
 
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDelProc.jsp</title>
</head>
<body>
<h2>noticeDelProc.jsp</h2>
</body>
</html>