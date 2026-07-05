<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Batch Management</title>
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
    width:350px;
    margin-top:20px;
    padding:20px;
    border:1px solid #999;
    background-color:white;
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
    background-color:#16a085;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
}

button:hover{
    background-color:#138d75;
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
document.getElementById("update").style.display="none";
document.getElementById("delete").style.display="none";
document.getElementById("view").style.display="none";

document.getElementById(id).style.display="block";

}

</script>

</head>
<body>

<div align="center">

<h2>Batch Management</h2>

<button onclick="show('add')">Add Batch</button>

<button onclick="show('update')">Update Batch</button>

<button onclick="show('delete')">Delete Batch</button>

<button onclick="show('view')">View All Batches</button>

<hr>

<div id="add" class="box">

<h3>Add Batch</h3>

<form action="BatchServlet" method="post">

<input type="hidden" name="action" value="add">

Batch ID :
<input type="number" name="batchid"><br><br>

Batch Name :
<input type="text" name="batch_name"><br><br>

Trainer ID :
<input type="number" name="trainer_id"><br><br>

Start Time :
<input type="text" name="start_time"><br><br>

End Time :
<input type="text" name="end_time"><br><br>

<button>Add Batch</button>

</form>

</div>

<div id="update" class="box">

<h3>Update Batch</h3>

<form action="BatchServlet" method="post">

<input type="hidden" name="action" value="update">

Batch ID :
<input type="number" name="batchid"><br><br>

Batch Name :
<input type="text" name="batch_name"><br><br>

Trainer ID :
<input type="number" name="trainer_id"><br><br>

Start Time :
<input type="text" name="start_time"><br><br>

End Time :
<input type="text" name="end_time"><br><br>

<button>Update Batch</button>

</form>

</div>

<div id="delete" class="box">

<h3>Delete Batch</h3>

<form action="BatchServlet" method="post">

<input type="hidden" name="action" value="delete">

Batch ID :
<input type="number" name="batchid"><br><br>

<button>Delete Batch</button>

</form>

</div>

<div id="view" class="box">

<h3>View All Batches</h3>

<form action="viewallbatch.jsp" method="get">

<input type="hidden" name="action" value="view">

<button>View Batches</button>

</form>

</div>

<br><br>

<a href="admin.jsp">
<button type="button">Back</button>
</a>

</div>

</body>
</html>