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
<h2>Add Student</h2>
<form action="addStudent.jsp" method="post">
Id: <input type="number" name="id"><br><br>
Name: <input type="text" name="name"><br><br>
Email: <input type="email" name="email"><br><br>
Password: <input type="password" name="password"><br><br>
Number: <input type="text" name="number"><br><br>
<input type="hidden" name="role" value="Student">
<button>Add Student</button>

</form>
<% 

if(request.getParameter("id") != null){

  
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
    	 out.println("<h1>added student  successful</h1>");
    		
    	   
       }
       else {
    	   out.println("<h1>not added</h1>");
       }
}
       %>
</body>
</html>