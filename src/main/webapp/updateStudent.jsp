<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Update Student</h2>
<form action="updateStudent.jsp" method="post">
Student ID:
<input type="number" name="id" required><br><br>
Name:
<input type="text" name="name" required><br><br>
Email:
<input type="email" name="email" required><br><br>
Password:
<input type="password" name="password" required><br><br>
Number:
<input type="text" name="number" required><br><br>
<button>Update Student</button>
</form> 
<%

if(request.getParameter("id") != null){
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    long number = Long.parseLong(request.getParameter("number"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");
    String sql = "UPDATE user SET name=?, email=?, password=?, number=? WHERE id=?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setLong(4, number);
    ps.setInt(5, id);

    int result = ps.executeUpdate();

    if(result == 1){
        out.println("<h2>Student Updated Successfully</h2>");
    }
    else{
        out.println("<h2>Student ID Not Found</h2>");
    }
}
%>

</body>
</html>