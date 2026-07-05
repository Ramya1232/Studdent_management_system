<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
    border-collapse:collapse;
    width:80%;
    background-color:white;
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

table,th,td{
    border:1px solid #999;
}

tr:nth-child(even){
    background-color:#f9f9f9;
}

button{
    padding:6px 12px;
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

<h2>View All Batches</h2>

<table border="1">

<tr>
<th>Batch ID</th>
<th>Batch Name</th>
<th>Trainer Name</th>
<th>Start Time</th>
<th>End Time</th>
<th>Action</th>
</tr>

<%

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

String sql="SELECT b.batchid,b.batch_name,b.trainer_id,b.start_time,b.end_time,u.name FROM batch b JOIN user u ON b.trainer_id=u.id";

PreparedStatement ps=conn.prepareStatement(sql);

ResultSet rs=ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("batchid")%></td>

<td><%=rs.getString("batch_name")%></td>

<td><%=rs.getString("name")%></td>

<td><%=rs.getString("start_time")%></td>

<td><%=rs.getString("end_time")%></td>

<td>

<a href="trainerBatches.jsp?trainer_id=<%=rs.getInt("trainer_id")%>">
<button type="button">View Batches</button>
</a>

</td>

</tr>

<%
}
%>

</table>

<br><br>

<a href="hr.jsp">
<button type="button">Back</button>
</a>

</div>
</body>
</html>