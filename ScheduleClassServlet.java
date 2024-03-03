import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ScheduleClassServlet")
public class ScheduleClassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/dbms_project";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve form data
            String course = request.getParameter("course");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String meetingLink = request.getParameter("meeting-link");

            // Validate input (add more validation as needed)
            if (course == null || date == null || time == null || meetingLink == null ||
                course.isEmpty() || date.isEmpty() || time.isEmpty() || meetingLink.isEmpty()) {
                out.println("Please fill in all the fields.");
                return;
            }

            // JDBC variables for opening, closing, and managing connection
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new ServletException("MySQL JDBC Driver not found", e);
            }

            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                // The MySQL INSERT statement to add the class schedule
                String query = "INSERT INTO class_schedule (course, date, time, meeting_link) VALUES (?, ?, ?, ?)";

                // Create a PreparedStatement object to execute the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, course);
                    preparedStatement.setString(2, date);
                    preparedStatement.setString(3, time);
                    preparedStatement.setString(4, meetingLink);

                    // Execute the query
                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        // Class schedule added successfully
                        out.println("Class scheduled successfully.");
                    } else {
                        // Class schedule addition failed
                        out.println("Failed to schedule class. Please try again.");
                    }
                }
            } catch (SQLException e) {
                throw new ServletException("Database connection error", e);
            }
        }
    }
}
