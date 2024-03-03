<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Your CSS styles here */
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f6f5f5; /* Soft gray background */
}

header {
    background: linear-gradient(to right, #ff6b6b, #556270); /* Gradient from red to blue */
    color: #fff;
    padding: 15px;
    text-align: center;
}

nav {
    background: linear-gradient(to right, #833ab4, #fd1d1d, #fcb045); /* Gradient from purple to red to orange */
    padding: 10px;
    text-align: center;
}

nav a {
    color: #fff;
    text-decoration: none;
    padding: 10px;
    margin: 0 10px;
    transition: color 0.3s;
}

nav a:hover {
    color: #4b4b4b; /* Hover color changed to dark gray */
}

section {
    padding: 20px;
}

h2 {
    color: #ff6b6b; /* Heading color changed to red */
    text-align: center;
}

.course-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: center;
}

.course {
    text-align: center;
    margin: 15px;
    padding: 10px;
    border-radius: 8px;
    background-color: #fff; /* White background for courses */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.course:hover {
    transform: translateY(-5px);
    background-color: #f0f0f0; /* Light gray background on hover */
}

.course h3 {
    margin-bottom: 10px;
    color: #ff6b6b; /* Heading color changed to red */
}

.course-description {
    font-size: 14px;
    color: #666;
}
        
    </style>

</head>
<body>
    <header>
        <h1>Courses List</h1>
    </header>
    <nav>
        <a href="home.jsp"><i class="fas fa-chevron-left"></i> Back to Home</a>
    </nav>

    <section>
        <h2>Available Courses</h2>
         <div class="course-container" >
            <!-- Courses fetched from the database will be included here -->
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM courses");
                    while (rs.next()) {
            %>
            <div class="course" id="enrolledCourse<%= rs.getInt("id") %>">
             	<h3>Course ID: <%= rs.getInt("id") %></h3>
                <h3>Course Name: <%= rs.getString("courseName") %></h3>
                <p class="course-description">Course Description: <%= rs.getString("courseDescription") %></p>
                <form id="enrollForm<%= rs.getInt("id") %>" action="dashboard.jsp" method="post">
                    <input type="hidden" name="course_id" value="<%= rs.getInt("id") %>"> 
				<a href="course.jsp?enrolledCourseID=<%= rs.getInt("id") %>&enrolledCourseName=<%= rs.getString("courseName") %>&enrolledCourseDescription=<%= rs.getString("courseDescription") %>">
				<button>Enroll</button>
				</a>


                </form>
            </div>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </section>
  <script>
    function enrollCourse(courseId) {
        // Simulate enrollment - replace this with server-side logic
        alert(`Enrollment Successful !!`);

        // Log the URL before redirecting
        console.log('Redirecting to My Courses...');
        console.log('Current URL:', window.location.href);

        // Redirect to the My Courses page with the enrolled course ID as a query parameter
        window.location.href = `mycourses.jsp?enrolledCourse=${courseId}`;
    }
</script>





</body>
</html>