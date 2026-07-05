<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>

body{
    background-color:#f2f2f2;
    font-family:Arial, sans-serif;
}

h2{
    color:#2c3e50;
}

h3{
    color:#34495e;
}

.box{
    display:none;
    border:1px solid #999;
    background-color:white;
    padding:20px;
    margin-top:20px;
    width:350px;
    border-radius:5px;
    box-shadow:2px 2px 8px lightgray;
}

input{
    width:180px;
    padding:6px;
    border:1px solid #999;
    border-radius:4px;
}

button{
    margin:5px;
    padding:8px 15px;
    background-color:#3498db;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
}

button:hover{
    background-color:#2980b9;
}

hr{
    margin:20px;
}

a{
    text-decoration:none;
}

</style>

<script>

function show(id){

document.getElementById("add").style.display="none";
document.getElementById("remove").style.display="none";
document.getElementById("update").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("view").style.display="none";

document.getElementById(id).style.display="block";

}

</script>

</head>
<body>

<div align="center">

<h2>HR Management</h2>

<button onclick="show('add')">Add HR</button>

<button onclick="show('remove')">Remove HR</button>

<button onclick="show('update')">Update HR</button>

<button onclick="show('find')">Find HR</button>

<button onclick="show('view')">View HR</button>

<hr>

<div id="add" class="box">
<h3>Add HR</h3>

<form action="HRServlet" method="post">

<input type="hidden" name="action" value="add">

ID :
<input type="number" name="id"><br><br>

Name :
<input type="text" name="name"><br><br>

Email :
<input type="email" name="email"><br><br>

Password :
<input type="password" name="password"><br><br>

Number :
<input type="text" name="number"><br><br>

<button>Add HR</button>

</form>

</div>

<div id="remove" class="box">

<h3>Remove HR</h3>

<form action="HRServlet" method="post">

<input type="hidden" name="action" value="remove">

HR ID :
<input type="number" name="id"><br><br>

<button>Remove HR</button>

</form>

</div>

<div id="update" class="box">

<h3>Update HR</h3>

<form action="HRServlet" method="post">

<input type="hidden" name="action" value="update">

ID :
<input type="number" name="id"><br><br>

Name :
<input type="text" name="name"><br><br>

Email :
<input type="email" name="email"><br><br>

Password :
<input type="password" name="password"><br><br>

Number :
<input type="text" name="number"><br><br>

<button>Update HR</button>

</form>

</div>

<div id="find" class="box">

<h3>Find HR</h3>

<form action="HRServlet" method="get">

<input type="hidden" name="action" value="find">

HR ID :
<input type="number" name="id"><br><br>

<button>Find HR</button>

</form>

</div>

<div id="view" class="box">
<h3>View All HR</h3>
<form action="HRServlet" method="get">

<input type="hidden" name="action" value="view">

<button>View HR</button>

</form>

</div>

<br><br>

<a href="admin.jsp">
<button type="button">Back</button>
</a>

</div>
</body>
</html>