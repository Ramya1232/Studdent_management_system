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
<div align="center">
<h1>find Student by id</h1>
<form action="findStudent.jsp" method="post">
Student id:<input type="number" name="id" required>
<button>Search</button>
</form>
</div>
<%
String sid=request.getParameter("id");
if(sid!=null){
	int id = Integer.parseInt(sid);
    Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
String sql="SELECT * FROM user WHERE id=?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1, id); 
ResultSet rs=ps.executeQuery();
if(rs.next()){
	 out.println("<h3>Student Details</h3>");
     out.println("ID : " + rs.getInt("id")+"<br><br>");
     out.println("Name : " + rs.getString("name")+"<br><br>");
     out.println("Email : " + rs.getString("email")+"<br><br>");
     out.println("Password : " + rs.getString("password")+"<br><br>");
     out.println("Number : " + rs.getLong("number")+"<br><br>");
     out.println("Role : " + rs.getString("role")+"<br><br>");
}
else{
	out.println("<h3>user not found</h3>");
}

}
%>
</body>
</html>