<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<form action="removeStudent.jsp" method="post">
Student id: <input type="number" name="id"><br><br>
<button>RemoveStudent</button>


</form>


</div>
<%
String sid = request.getParameter("id");
if(sid!=null){
	 int id = Integer.parseInt(sid);
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
     String sql="DELETE FROM user WHERE id=? AND role='student'";
     PreparedStatement ps=conn.prepareStatement(sql);
     ps.setInt(1,id);
     int res=ps.executeUpdate();
     if(res==1){
    	 out.println("<h1>Delete Sucessful</h1>");
     }
     else{
    	 out.println("<h1>enter proper id");
     }
}

%>
</body>
</html>