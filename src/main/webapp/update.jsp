<%@page import="java.sql.ResultSet"%>
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
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
long number = Long.parseLong(request.getParameter("number"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
PreparedStatement ps=conn.prepareStatement("UPDATE user set name=?,id=?,password=?,number=? WHERE email=? ");
ps.setString(1,name);
ps.setInt(2, id);
ps.setString(3, password);
ps.setLong(4, number);
ps.setString(5, email);

int rs=ps.executeUpdate();
if(rs==1){
	session.setAttribute("id", id);
	session.setAttribute("name", name);
	session.setAttribute("email", email);
	session.setAttribute("password", password);
	session.setAttribute("number", number);
	 response.sendRedirect("profile.jsp?");
}
	
	else {
	RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
		rd.include(request, response);
//		resp.sendRedirect("profile");
	}





%>
</body>
</html>