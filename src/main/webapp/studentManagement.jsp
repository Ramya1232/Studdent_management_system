<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>

<style>

body{
    font-family: Arial, sans-serif;
    background-color:#f2f2f2;
}

.container{
    width:350px;
    margin:70px auto;
    background:white;
    padding:25px;
    border-radius:8px;
    box-shadow:0px 0px 10px gray;
    text-align:center;
}

h2{
    color:#2c3e50;
    margin-bottom:20px;
}

a{
    text-decoration:none;
}

button{
    width:220px;
    padding:10px;
    margin:8px;
    background-color:#3498db;
    color:white;
    border:none;
    border-radius:5px;
    font-size:15px;
    cursor:pointer;
}

button:hover{
    background-color:#2980b9;
}

.back{
    background-color:#27ae60;
}

.back:hover{
    background-color:#1e8449;
}

</style>

</head>

<body>

<div class="container">

<h2>Student Management</h2>

<a href="addStudent.jsp">
<button>Add Student</button>
</a>
<br>

<a href="removeStudent.jsp">
<button>Remove Student</button>
</a>
<br>

<a href="updateStudent.jsp">
<button>Update Student</button>
</a>
<br>

<a href="findStudent.jsp">
<button>Find Student</button>
</a>
<br>

<a href="viewStudents.jsp">
<button>View All Students</button>
</a>
<br>

<a href="admin.jsp">
<button class="back">Back</button>
</a>

</div>

</body>
</html>