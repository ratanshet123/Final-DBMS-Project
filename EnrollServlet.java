import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EnrollServlet")
public class EnrollServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve search keyword from the request parameter
        String searchKeyword = request.getParameter("search");

        // Get the courses based on the search keyword
        ResultSet resultSet = null;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try {
            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                resultSet = DatabaseHelper.searchCourses(searchKeyword);
            } else {
                resultSet = DatabaseHelper.getCourses();
            }

            // Set the result set as an attribute in the request
            request.setAttribute("coursesResultSet", resultSet);

            // Forward the request to the enroll.jsp page
            request.getRequestDispatcher("/enroll.jsp").forward(request, response);
        } finally {
            // Close the ResultSet and Database Connection when done
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            Connection connection = null;
			try {
				connection = DatabaseHelper.getDatabaseConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
