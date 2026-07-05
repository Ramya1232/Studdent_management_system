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
<title>View students</title>
<style>

body{
    background-color:#f2f2f2;
    font-family:Arial, sans-serif;
}

h2{
    color:#2c3e50;
}

table{
    width:80%;
    border-collapse:collapse;
    background-color:white;
    margin-top:20px;
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
    background-color:#f5f5f5;
}

button{
    margin-top:20px;
    padding:8px 18px;
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

<h2>All Students</h2>
<table border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Password</th>
<th>Number</th>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
String sql = "SELECT * FROM user WHERE role='student'";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getString("email")%></td>
    <td><%=rs.getString("password")%></td>
    <td><%=rs.getLong("number")%></td>
</tr>
<%

}
%>
</table>
<a href="admin.jsp"><button>Back</button></a>

</div>
</body>
</html>