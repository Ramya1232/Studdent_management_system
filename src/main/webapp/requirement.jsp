<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    border:1px solid #999;
    border-radius:5px;
    box-shadow:2px 2px 8px lightgray;
    text-align:center;
}

h2{
    color:#2c3e50;
}

input,select{
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

h3{
    margin-top:20px;
    color:green;
}

</style>
</head>
<body>
<div align="center">

<%
int student_id = Integer.parseInt(request.getParameter("student_id"));
%>

<form action="requirement.jsp" method="post">

<h2>Add Requirement</h2>

Requirement ID:
<input type="number" name="requirement_id"><br><br>

Student ID:
<input type="text" name="student_id" value="<%=student_id%>" readonly><br><br>

Requirement:
<input type="text" name="requirement"><br><br>

Status:
<select name="status">
<option>Pending</option>
<option>Completed</option>
</select>
<br><br>

<button>Add Requirement</button>

</form>

<%

String rid = request.getParameter("requirement_id");

if(rid != null){

int requirement_id = Integer.parseInt(rid);
int sid = Integer.parseInt(request.getParameter("student_id"));
String requirement = request.getParameter("requirement");
String status = request.getParameter("status");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

String sql = "INSERT INTO requirement VALUES(?,?,?,?)";

PreparedStatement ps = conn.prepareStatement(sql);

ps.setInt(1, requirement_id);
ps.setInt(2, sid);
ps.setString(3, requirement);
ps.setString(4, status);

int result = ps.executeUpdate();

if(result > 0){
    out.println("<h3>Requirement Added Successfully...</h3>");
}
else{
    out.println("<h3>Failed to Add Requirement...</h3>");
}

}
%>

</div>
</body>
</html>