<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Schedule</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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

.schedule-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: center;
}

.schedule-item {
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
  footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            position:relative;
            margin-top:400px;
        }


    </style>
</head>
<body>
    <header>
        <h1>Classes Scheduled</h1>
    </header>

    <nav>
        <a href="dashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

    <section>
        <h2>Classes Scheduled</h2>
        <div class="schedule-container">
            <!-- Fetch and display class schedule details here -->
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project", "root", "root");
                    Statement stmt = connection.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM class_schedule");

                    while (rs.next()) {
            %>
            <div class="schedule-item">
                <h3>Course: <%= rs.getString("course") %></h3>
                <p>Date: <%= rs.getDate("date") %></p>
                <p>Time: <%= rs.getTime("time") %></p>
                <p>Meeting Link: <%= rs.getString("meeting_link") %></p>
            </div>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    out.println("Error fetching class schedule: " + e.getMessage());
                }
            %>
        </div>
    </section>

    <footer>
        &copy; 2024 Classes Scheduled
    </footer>
</body>
</html>
