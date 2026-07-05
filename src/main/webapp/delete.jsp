<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email = (String) session.getAttribute("email");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
PreparedStatement pt=conn.prepareStatement("DELETE FROM user WHERE email=?");
pt.setString(1, email);

int res=pt.executeUpdate();
if(res==1){
	session.invalidate();
}
else{
	response.sendRedirect("profile.jsp");
}
%>
</body>
</html>