package org.jsp.studentManagementSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

            // ---------------- ADD ----------------

            if (action.equals("add")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                long number = Long.parseLong(request.getParameter("number"));

                String sql = "insert into user values(?,?,?,?,?,?)";

                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setInt(1, id);
                ps.setString(2, name);
                ps.setString(3, email);
                ps.setString(4, password);
                ps.setLong(5, number);
                ps.setString(6, "Student");

                int result = ps.executeUpdate();

                if (result > 0)
                    out.println("<h2>Student Added Successfully</h2>");
                else
                    out.println("<h2>Failed</h2>");
            }

            // ---------------- REMOVE ----------------

            else if (action.equals("remove")) {

                int id = Integer.parseInt(request.getParameter("id"));

                String sql = "delete from user where id=? and role='Student'";

                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setInt(1, id);

                int result = ps.executeUpdate();

                if (result > 0)
                    out.println("<h2>Student Removed</h2>");
                else
                    out.println("<h2>Student Not Found</h2>");
            }

            // ---------------- UPDATE ----------------

            else if (action.equals("update")) {

                int id = Integer.parseInt(request.getParameter("id"));

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                long number = Long.parseLong(request.getParameter("number"));

                String sql = "update user set name=?,email=?,password=?,number=? where id=? and role='Student'";

                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setLong(4, number);
                ps.setInt(5, id);

                int result = ps.executeUpdate();

                if (result > 0)
                    out.println("<h2>Updated Successfully</h2>");
                else
                    out.println("<h2>Student Not Found</h2>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

            // ---------------- FIND ----------------

            if (action.equals("find")) {

                int id = Integer.parseInt(request.getParameter("id"));

                String sql = "select * from user where id=? and role='Student'";

                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    out.println("ID : " + rs.getInt("id") + "<br>");
                    out.println("Name : " + rs.getString("name") + "<br>");
                    out.println("Email : " + rs.getString("email") + "<br>");
                    out.println("Number : " + rs.getLong("number") + "<br>");

                } else {

                    out.println("<h2>Student Not Found</h2>");

                }

            }

            // ---------------- VIEW ----------------

            else if (action.equals("view")) {

                String sql = "select * from user where role='Student'";

                PreparedStatement ps = conn.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                out.println("<table border='1'>");
                out.println("<tr>");
                out.println("<th>ID</th>");
                out.println("<th>Name</th>");
                out.println("<th>Email</th>");
                out.println("<th>Number</th>");
                out.println("</tr>");

                while (rs.next()) {

                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("id") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getLong("number") + "</td>");
                    out.println("</tr>");

                }

                out.println("</table>");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}