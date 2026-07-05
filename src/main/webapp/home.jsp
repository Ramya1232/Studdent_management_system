<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("name");
int id = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#0f172a;
}

.container{
    width:450px;
    background:white;
    border-radius:20px;
    padding:40px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,.3);
}

h2:first-child{
    color:#2563eb;
    margin-bottom:15px;
}

h2:nth-child(2){
    color:#333;
    margin-bottom:30px;
}

.buttons{
    display:flex;
    justify-content:center;
    gap:20px;
}

a{
    text-decoration:none;
}

button{
    border:none;
    padding:12px 28px;
    border-radius:8px;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

.profile{
    background:#2563eb;
}

.profile:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

.logout{
    background:#ef4444;
}

.logout:hover{
    background:#dc2626;
    transform:translateY(-3px);
}

</style>

</head>

<body>

<div class="container">

<h2>Student Management System</h2>

<h2>Welcome, <%= name %></h2>

<div class="buttons">

<a href="profile.jsp?id=<%= id %>">
    <button class="profile">Profile</button>
</a>

<a href="logout.jsp">
    <button class="logout">Logout</button>
</a>

</div>

</div>

</body>
</html>