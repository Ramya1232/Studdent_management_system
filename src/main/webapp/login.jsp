<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System - Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#4e54c8,#8f94fb);
}

.container{
    width:420px;
}

form{
    background:#fff;
    padding:35px;
    border-radius:18px;
    box-shadow:0 10px 25px rgba(0,0,0,.25);
}

h2{
    text-align:center;
    color:#4e54c8;
    margin-bottom:20px;
}

label{
    display:block;
    margin-top:15px;
    margin-bottom:6px;
    font-weight:bold;
    color:#444;
}

input[type=email],
input[type=password]{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;
    transition:.3s;
}

input[type=email]:focus,
input[type=password]:focus{
    border-color:#4e54c8;
    box-shadow:0 0 8px rgba(78,84,200,.4);
}

.role-title{
    margin-top:20px;
    margin-bottom:10px;
    font-weight:bold;
    color:#333;
}

.role{
    margin:10px 0;
}

.role input{
    margin-right:8px;
}

button{
    width:100%;
    margin-top:20px;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#4e54c8;
    color:white;
    font-size:17px;
    cursor:pointer;
    transition:.3s;
}

button:hover{
    background:#363bb3;
}

</style>

</head>

<body>

<div class="container">

<form action="login.jsp" method="post">

<h2>Student Login</h2>

<label>Email</label>
<input type="email" name="email" value="meghana@gmail.com" required>

<label>Password</label>
<input type="password" name="password" value="meghana@123" required>

<div class="role-title">Login As</div>

<div class="role">
<input type="radio" name="role" value="HR" required> HR
</div>

<div class="role">
<input type="radio" name="role" value="Admin"> Admin
</div>

<div class="role">
<input type="radio" name="role" value="Trainer"> Trainer
</div>

<div class="role">
<input type="radio" name="role" value="student"> Student
</div>

<button type="submit">Login</button>

</form>

</div>

<%
String email=request.getParameter("email");
String password=request.getParameter("password");
String role=request.getParameter("role");

if(email!=null && password!=null){

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

    String sql="SELECT * FROM user WHERE email=?";

    PreparedStatement pt=conn.prepareStatement(sql);
    pt.setString(1,email);

    ResultSet rs=pt.executeQuery();

    if(rs.next()){

        String p=rs.getString("password");

        if(p.equals(password)){

            String Role=rs.getString("role");

            if(Role.equals(role)){

                int id=rs.getInt("id");
                String name=rs.getString("name");
                long number=rs.getLong("number");

                session.setAttribute("id",id);
                session.setAttribute("name",name);
                session.setAttribute("email",email);
                session.setAttribute("password",password);
                session.setAttribute("number",number);

                if(Role.equals("HR")){
                    response.sendRedirect("hr.jsp");
                }
                else if(Role.equals("student")){
                    response.sendRedirect("home.jsp");
                }
                else if(Role.equals("Admin")){
                    response.sendRedirect("admin.jsp");
                }
                else if(Role.equals("Trainer")){
                    response.sendRedirect("trainer.jsp");
                }

            }else{
                out.println("<h3 style='color:red;text-align:center;'>Invalid Role</h3>");
            }

        }else{
            out.println("<h3 style='color:red;text-align:center;'>Wrong Password</h3>");
        }

    }else{
        out.println("<h3 style='color:red;text-align:center;'>Wrong Email</h3>");
    }

    conn.close();
}
%>

</body>
</html>