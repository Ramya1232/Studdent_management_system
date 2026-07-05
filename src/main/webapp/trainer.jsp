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
    text-align:center;
}

h2{
    color:#2c3e50;
    margin-top:20px;
}

button{
    width:180px;
    padding:10px;
    margin:8px;
    background-color:#3498db;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
    font-size:15px;
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
<%
String name=(String)session.getAttribute("name");
int id = (Integer)session.getAttribute("id");

out.println("<html>");
out.println("<body>");
out.println("<h2>Home Page</h2> ");
out.println("<h2>Welcome " + name+"</h2>");
out.println("<a href='profile.jsp?id=" + id + "'><button>Profile</button></a>");
out.println("<a href='logout.jsp'><button>Logout</button></a>");
out.println("<a href='trainerBatches.jsp?trainer_id=" + id + "'><button>View My Batches</button></a>");
out.println("</html>");
out.println("</body>");


%>


</body>
</html>