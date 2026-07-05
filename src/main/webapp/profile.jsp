<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session = request.getSession();
int id = (Integer) session.getAttribute("id");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE id=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:430px;
    background:#fff;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,.3);
}

h2{
    text-align:center;
    color:#1e3c72;
    margin-bottom:25px;
}

label{
    display:block;
    margin-top:12px;
    margin-bottom:6px;
    font-weight:bold;
    color:#333;
}

input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;
    transition:.3s;
}

input:focus{
    border-color:#1e3c72;
    box-shadow:0 0 8px rgba(30,60,114,.4);
}

.buttons{
    display:flex;
    justify-content:space-between;
    margin-top:25px;
}

button{
    width:48%;
    padding:12px;
    border:none;
    border-radius:8px;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:.3s;
}

.update{
    background:#28a745;
}

.update:hover{
    background:#218838;
}

.delete{
    background:#dc3545;
}

.delete:hover{
    background:#c82333;
}

a{
    text-decoration:none;
    width:48%;
}

.message{
    text-align:center;
    color:red;
    font-size:18px;
}

</style>

</head>
<body>

<div class="container">

<h2>My Profile</h2>

<%
if(rs.next()){

    String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    String password = (String)session.getAttribute("password");
    long number = (Long)session.getAttribute("number");
%>

<form action="update.jsp" method="post">

<input type="hidden" name="id" value="<%=id%>">

<label>Name</label>
<input type="text" name="name" value="<%=name%>">

<label>Email</label>
<input type="email" name="email" value="<%=email%>">

<label>Password</label>
<input type="password" name="password" value="<%=password%>">

<label>Phone Number</label>
<input type="text" name="number" value="<%=number%>">

<div class="buttons">
    <button class="update" type="submit">Update</button>

    <a href="delete.jsp?id=<%=id%>">
        <button class="delete" type="button">Delete</button>
    </a>
</div>

</form>

<%
}else{
%>

<p class="message">No data available. Please contact the developer.</p>

<%
}
conn.close();
%>

</div>

</body>
</html>