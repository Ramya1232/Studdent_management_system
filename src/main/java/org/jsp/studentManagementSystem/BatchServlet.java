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

@WebServlet("/BatchServlet")
public class BatchServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/studentmanagementsystem?user=root&password=Ramya@123");

			// ADD BATCH
			if (action.equals("add")) {

				int batchid = Integer.parseInt(request.getParameter("batchid"));
				String batchName = request.getParameter("batch_name");
				int trainerId = Integer.parseInt(request.getParameter("trainer_id"));
				String startTime = request.getParameter("start_time");
				String endTime = request.getParameter("end_time");

				PreparedStatement ps = conn.prepareStatement(
						"insert into batch values(?,?,?,?,?)");

				ps.setInt(1, batchid);
				ps.setString(2, batchName);
				ps.setInt(3, trainerId);
				ps.setString(4, startTime);
				ps.setString(5, endTime);

				int result = ps.executeUpdate();

				if (result > 0)
					out.println("<h2>Batch Added Successfully</h2>");
				else
					out.println("<h2>Failed</h2>");

			}

			// UPDATE BATCH
			else if (action.equals("update")) {

				int batchid = Integer.parseInt(request.getParameter("batchid"));
				String batchName = request.getParameter("batch_name");
				int trainerId = Integer.parseInt(request.getParameter("trainer_id"));
				String startTime = request.getParameter("start_time");
				String endTime = request.getParameter("end_time");

				PreparedStatement ps = conn.prepareStatement(
						"update batch set batch_name=?,trainer_id=?,start_time=?,end_time=? where batchid=?");

				ps.setString(1, batchName);
				ps.setInt(2, trainerId);
				ps.setString(3, startTime);
				ps.setString(4, endTime);
				ps.setInt(5, batchid);

				int result = ps.executeUpdate();

				if (result > 0)
					out.println("<h2>Batch Updated Successfully</h2>");
				else
					out.println("<h2>Batch Not Found</h2>");

			}

			// DELETE BATCH
			else if (action.equals("delete")) {

				int batchid = Integer.parseInt(request.getParameter("batchid"));

				PreparedStatement ps = conn.prepareStatement(
						"delete from batch where batchid=?");

				ps.setInt(1, batchid);

				int result = ps.executeUpdate();

				if (result > 0)
					out.println("<h2>Batch Deleted Successfully</h2>");
				else
					out.println("<h2>Batch Not Found</h2>");

			}

			// VIEW ALL BATCHES
			else if (action.equals("view")) {

				PreparedStatement ps = conn.prepareStatement(
						"select b.batchid,b.batch_name,b.start_time,b.end_time,u.name from batch b join user u on b.trainer_id=u.id");

				ResultSet rs = ps.executeQuery();

				out.println("<h2>All Batches</h2>");

				out.println("<table border='1'>");
				out.println("<tr>");
				out.println("<th>Batch ID</th>");
				out.println("<th>Batch Name</th>");
				out.println("<th>Trainer Name</th>");
				out.println("<th>Start Time</th>");
				out.println("<th>End Time</th>");
				out.println("</tr>");

				while (rs.next()) {

					out.println("<tr>");
					out.println("<td>" + rs.getInt("batchid") + "</td>");
					out.println("<td>" + rs.getString("batch_name") + "</td>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("start_time") + "</td>");
					out.println("<td>" + rs.getString("end_time") + "</td>");
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