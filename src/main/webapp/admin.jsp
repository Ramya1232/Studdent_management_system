<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name = (String)session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#eef2f7;
}

.header{
    width:100%;
    background:#1f2937;
    color:white;
    padding:20px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h2{
    font-size:28px;
}

.header h3{
    font-weight:400;
}

.container{
    width:90%;
    max-width:900px;
    margin:40px auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 8px 20px rgba(0,0,0,.15);
}

.card h2{
    text-align:center;
    color:#1f2937;
    margin-bottom:30px;
}

.menu{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:20px;
}

.menu a{
    text-decoration:none;
}

.menu button{
    width:100%;
    padding:18px;
    border:none;
    border-radius:10px;
    background:#2563eb;
    color:white;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

.menu button:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

.logout{
    background:#dc2626 !important;
}

.logout:hover{
    background:#b91c1c !important;
}

@media(max-width:700px){

.menu{
    grid-template-columns:1fr;
}

.header{
    flex-direction:column;
    gap:10px;
    text-align:center;
}

}

</style>

</head>
<body>

<div class="header">
    <h2>Student Management System</h2>
    <h3>Welcome, <%=name %></h3>
</div>

<div class="container">

<div class="card">

<h2>Admin Dashboard</h2>

<div class="menu">

<a href="studentManagement.jsp">
<button>🎓 Student Management</button>
</a>

<a href="hrcrud.jsp">
<button>👨‍💼 HR Management</button>
</a>

<a href="trainerManagement.jsp">
<button>👨‍🏫 Trainer Management</button>
</a>

<a href="batchManagement.jsp">
<button>📚 Batch Management</button>
</a>

<a href="assignStudent.jsp">
<button>📝 Assign Student to Batch</button>
</a>

<a href="profile.jsp">
<button>👤 My Profile</button>
</a>

<a href="logout.jsp">
<button class="logout">🚪 Logout</button>
</a>

</div>

</div>

</div>

</body>
</html>