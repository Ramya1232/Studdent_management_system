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

h1{
    color:#2c3e50;
}

h3{
    color:#555;
    margin-bottom:20px;
}

button{
    width:180px;
    padding:10px;
    margin:5px;
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
%>

<h1>Welcome HR</h1>
<h3>Hello <%= name %></h3>
<a href="profile.jsp"><button>Profile</button></a>
<a href="addStudent.jsp"><button>Add Student</button></a><br><br>
<a href="removeStudent.jsp"><button>Remove Student</button></a><br><br>
<a href="updateStudent.jsp"><button>Update Student</button></a><br><br>
<a href="findStudent.jsp"><button>Find Student</button></a><br><br>
<a href="viewallbatch.jsp"><button>View All Batches</button></a><br><br>
<a href="logout.jsp"><button>Logout</button></a>



</body>
</html>