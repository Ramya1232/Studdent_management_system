<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Management</title>

<style>

body{
    font-family:Arial, sans-serif;
    background-color:#f2f2f2;
}

.container{
    width:500px;
    margin:40px auto;
    background:white;
    padding:20px;
    border-radius:8px;
    box-shadow:0px 0px 10px gray;
    text-align:center;
}

h2{
    color:#2c3e50;
}

.box{
    display:none;
    border:1px solid #ccc;
    border-radius:5px;
    padding:20px;
    margin-top:20px;
    background:#fafafa;
}

input{
    width:220px;
    padding:8px;
    margin:5px;
    border:1px solid #999;
    border-radius:4px;
}

button{
    width:170px;
    padding:10px;
    margin:5px;
    border:none;
    border-radius:5px;
    background:#3498db;
    color:white;
    cursor:pointer;
}

button:hover{
    background:#2980b9;
}

.back{
    background:#27ae60;
}

.back:hover{
    background:#1e8449;
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

<div class="container">

<h2>Trainer Management</h2>

<button onclick="show('add')">Add Trainer</button>
<button onclick="show('remove')">Remove Trainer</button>
<button onclick="show('update')">Update Trainer</button>
<button onclick="show('find')">Find Trainer</button>
<button onclick="show('view')">View Trainers</button>

<hr>

<div id="add" class="box">

<h3>Add Trainer</h3>

<form action="TrainerServlet" method="post">

<input type="hidden" name="action" value="add">

ID<br>
<input type="number" name="id"><br>

Name<br>
<input type="text" name="name"><br>

Email<br>
<input type="email" name="email"><br>

Password<br>
<input type="password" name="password"><br>

Number<br>
<input type="text" name="number"><br><br>

<button>Add Trainer</button>

</form>

</div>

<div id="remove" class="box">

<h3>Remove Trainer</h3>

<form action="TrainerServlet" method="post">

<input type="hidden" name="action" value="remove">

Trainer ID<br>
<input type="number" name="id"><br><br>

<button>Remove Trainer</button>

</form>

</div>

<div id="update" class="box">

<h3>Update Trainer</h3>

<form action="TrainerServlet" method="post">

<input type="hidden" name="action" value="update">

ID<br>
<input type="number" name="id"><br>

Name<br>
<input type="text" name="name"><br>

Email<br>
<input type="email" name="email"><br>

Password<br>
<input type="password" name="password"><br>

Number<br>
<input type="text" name="number"><br><br>

<button>Update Trainer</button>

</form>

</div>

<div id="find" class="box">

<h3>Find Trainer</h3>

<form action="TrainerServlet" method="get">

<input type="hidden" name="action" value="find">

Trainer ID<br>
<input type="number" name="id"><br><br>

<button>Find Trainer</button>

</form>

</div>

<div id="view" class="box">

<h3>View All Trainers</h3>

<form action="TrainerServlet" method="get">

<input type="hidden" name="action" value="view">

<button>View Trainers</button>

</form>

</div>

<br>

<a href="admin.jsp">
    <button type="button" class="back">Back</button>
</a>

</div>

</body>
</html>