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
.box{
display:none;
border:1px solid black;
padding:20px;
margin-top:20px;
width:350px;
}
button{
margin:5px;
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

<h2>Student Management</h2>

<button onclick="show('add')">Add Student</button>

<button onclick="show('remove')">Remove Student</button>

<button onclick="show('update')">Update Student</button>

<button onclick="show('find')">Find Student</button>

<button onclick="show('view')">View Students</button>

<hr>

<!-- Add Student -->

<div id="add" class="box">

<h3>Add Student</h3>

<form action="StudentServlet" method="post">

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

<button>Add</button>

</form>

</div>

<!-- Remove Student -->

<div id="remove" class="box">

<h3>Remove Student</h3>

<form action="StudentServlet" method="post">

<input type="hidden" name="action" value="remove">

Student ID :

<input type="number" name="id"><br><br>

<button>Remove</button>

</form>

</div>

<!-- Update Student -->

<div id="update" class="box">

<h3>Update Student</h3>

<form action="StudentServlet" method="post">

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

<button>Update</button>

</form>

</div>

<!-- Find Student -->

<div id="find" class="box">

<h3>Find Student</h3>

<form action="StudentServlet" method="get">

<input type="hidden" name="action" value="find">

Student ID :

<input type="number" name="id"><br><br>

<button>Find</button>

</form>

</div>

<!-- View Students -->

<div id="view" class="box">

<h3>View Students</h3>

<form action="StudentServlet" method="get">

<input type="hidden" name="action" value="view">

<button>View All Students</button>

</form>

</div>

<br><br>

<a href="admin.jsp">

<button>Back</button>

</a>

</div>
</body>
</html>