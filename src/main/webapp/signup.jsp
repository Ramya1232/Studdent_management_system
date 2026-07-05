<%@page import="java.sql.SQLException"%>
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

int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
long number=Long.parseLong(request.getParameter("number"));
String role=request.getParameter("role");
System.out.println(id);
System.out.println(name);
System.out.println(email);
System.out.println(password);
System.out.println(number);
//jdbc logic


	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
     String sql="INSERT INTO user VALUES(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
       ps.setInt(1, id);
       ps.setString(2,name);
       ps.setString(3,email);
       ps.setString(4,password);
       ps.setLong(5,number);
       ps.setString(6,role);
       int result=ps.executeUpdate();
       if(result==1) {
    	 out.println("<h1>Signup successful</h1>");
    		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
    	   
       }
       else {
    	   out.println("<h1>Signup unsuccessful</h1>");
       }

		
%>
</body>
</html>