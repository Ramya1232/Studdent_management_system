<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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

h2{
    color:#2c3e50;
}

table{
    width:85%;
    border-collapse:collapse;
    background-color:white;
    margin-top:20px;
}

table,th,td{
    border:1px solid #999;
}

th{
    background-color:#3498db;
    color:white;
    padding:10px;
}

td{
    padding:10px;
    text-align:center;
}

tr:nth-child(even){
    background-color:#f5f5f5;
}

button{
    padding:7px 14px;
    margin:2px;
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
}

</style>
</head>
<body>
<div align="center">

<h2>Students in Batch</h2>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Number</th>
<th>Add Requirement</th>
<th>Remove</th>
</tr>

<%
int batch_id = Integer.parseInt(request.getParameter("batch_id"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

String sql = "SELECT u.* FROM user u JOIN student_batch sb ON u.id=sb.student_id WHERE sb.batch_id=?";

PreparedStatement ps = conn.prepareStatement(sql);

ps.setInt(1, batch_id);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("name")%></td>

<td><%=rs.getString("email")%></td>

<td><%=rs.getLong("number")%></td>

<td>
<a href="requirement.jsp?student_id=<%=rs.getInt("id")%>">
<button type="button">Add Requirement</button>
</a>
</td>

<td>
<a href="removeStudentFromBatch.jsp?student_id=<%=rs.getInt("id")%>&batch_id=<%=batch_id%>">
<button type="button">Remove</button>
</a>
</td>

</tr>

<%
}
%>

</table>

<br><br>
<a href="trainerBatches.jsp?trainer_id=<%=request.getParameter("trainer_id")%>">
    <button type="button">Back</button>
</a>
</div>
</body>
</html>