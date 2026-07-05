<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
    background-color:#f2f2f2;
    font-family:Arial, sans-serif;
}

div{
    width:400px;
    margin:50px auto;
    background-color:white;
    padding:20px;
    border:1px solid #ccc;
    border-radius:5px;
    box-shadow:2px 2px 8px lightgray;
}

h2{
    color:#2c3e50;
}

select{
    width:200px;
    padding:6px;
    border:1px solid #999;
    border-radius:4px;
}

button{
    padding:8px 20px;
    background-color:#3498db;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
}

button:hover{
    background-color:#2980b9;
}

a{
    text-decoration:none;
    color:#0066cc;
    font-weight:bold;
}

a:hover{
    color:#003366;
}

</style>
</head>
<body>
<div align="center">

<h2>Assign Student to Batch</h2>

<form method="post">

Student:
<select name="student_id">
<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

String s1 = "SELECT id, name FROM user WHERE role='student'";
PreparedStatement ps1 = conn.prepareStatement(s1);
ResultSet rs1 = ps1.executeQuery();

while(rs1.next()){
%>
<option value="<%=rs1.getInt(1)%>">
    <%=rs1.getString(2)%>
</option>
<%
}
%>
</select>
<br><br>

Batch:
<select name="batch_id">
<%
String s2 = "SELECT batchid, batch_name FROM batch";
PreparedStatement ps2 = conn.prepareStatement(s2);
ResultSet rs2 = ps2.executeQuery();

while(rs2.next()){
%>
<option value="<%=rs2.getInt(1)%>">
    <%=rs2.getString(2)%>
</option>
<%
}
%>
</select>
<br><br>

<button>Assign</button>

</form>

<%
String student_id = request.getParameter("student_id");
String batch_id = request.getParameter("batch_id");

if(student_id != null && batch_id != null){

String sql = "INSERT INTO student_batch(student_id,batch_id) VALUES(?,?)";
PreparedStatement ps = conn.prepareStatement(sql);

ps.setInt(1, Integer.parseInt(student_id));
ps.setInt(2, Integer.parseInt(batch_id));

int i = ps.executeUpdate();

if(i > 0){
    out.println("<h3 style='color:green'>Student Assigned Successfully</h3>");
}else{
    out.println("<h3 style='color:red'>Failed to Assign</h3>");
}

}
%>

<br>
<a href="admin.jsp">Back</a>

</div>
</body>
</html>