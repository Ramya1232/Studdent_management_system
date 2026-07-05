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

@WebServlet("/TrainerServlet")
	public class TrainerServlet extends HttpServlet {

		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			response.setContentType("text/html");

			PrintWriter out = response.getWriter();

			String action = request.getParameter("action");

			try {

				Class.forName("com.mysql.cj.jdbc.Driver");

				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

				// ADD
				if (action.equals("add")) {

					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					long number = Long.parseLong(request.getParameter("number"));

					PreparedStatement ps = conn.prepareStatement("insert into user values(?,?,?,?,?,?)");

					ps.setInt(1, id);
					ps.setString(2, name);
					ps.setString(3, email);
					ps.setString(4, password);
					ps.setLong(5, number);
					ps.setString(6, "Trainer");

					int result = ps.executeUpdate();

					if (result > 0)
						out.println("<h2>Trainer Added Successfully</h2>");
					else
						out.println("<h2>Failed</h2>");

				}

				// REMOVE
				else if (action.equals("remove")) {

					int id = Integer.parseInt(request.getParameter("id"));

					PreparedStatement ps = conn.prepareStatement("delete from user where id=? and role='Trainer'");

					ps.setInt(1, id);

					int result = ps.executeUpdate();

					if (result > 0)
						out.println("<h2>Trainer Removed Successfully</h2>");
					else
						out.println("<h2>Trainer Not Found</h2>");

				}

				// UPDATE
				else if (action.equals("update")) {

					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					long number = Long.parseLong(request.getParameter("number"));

					PreparedStatement ps = conn.prepareStatement(
							"update user set name=?,email=?,password=?,number=? where id=? and role='Trainer'");

					ps.setString(1, name);
					ps.setString(2, email);
					ps.setString(3, password);
					ps.setLong(4, number);
					ps.setInt(5, id);

					int result = ps.executeUpdate();

					if (result > 0)
						out.println("<h2>Trainer Updated Successfully</h2>");
					else
						out.println("<h2>Trainer Not Found</h2>");

				}

				// FIND
				else if (action.equals("find")) {

					int id = Integer.parseInt(request.getParameter("id"));

					PreparedStatement ps = conn.prepareStatement("select * from user where id=? and role='Trainer'");

					ps.setInt(1, id);

					ResultSet rs = ps.executeQuery();

					if (rs.next()) {

						out.println("<h2>Trainer Details</h2>");
						out.println("ID : " + rs.getInt("id") + "<br><br>");
						out.println("Name : " + rs.getString("name") + "<br><br>");
						out.println("Email : " + rs.getString("email") + "<br><br>");
						out.println("Password : " + rs.getString("password") + "<br><br>");
						out.println("Number : " + rs.getLong("number"));

					} else {

						out.println("<h2>Trainer Not Found</h2>");

					}

				}

				// VIEW
				else if (action.equals("view")) {

					PreparedStatement ps = conn.prepareStatement("select * from user where role='Trainer'");

					ResultSet rs = ps.executeQuery();

					out.println("<table border='1'>");
					out.println("<tr>");
					out.println("<th>ID</th>");
					out.println("<th>Name</th>");
					out.println("<th>Email</th>");
					out.println("<th>Password</th>");
					out.println("<th>Number</th>");
					out.println("</tr>");

					while (rs.next()) {

						out.println("<tr>");
						out.println("<td>" + rs.getInt("id") + "</td>");
						out.println("<td>" + rs.getString("name") + "</td>");
						out.println("<td>" + rs.getString("email") + "</td>");
						out.println("<td>" + rs.getString("password") + "</td>");
						out.println("<td>" + rs.getLong("number") + "</td>");
						out.println("</tr>");

					}

					out.println("</table>");

				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	
}
