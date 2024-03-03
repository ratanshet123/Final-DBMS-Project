<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Scheduling</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #4285f4;
            color: #fff;
            padding: 15px;
            text-align: center;
        }

        nav {
            background-color: #333;
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
            color: #4285f4;
        }

        section {
            padding: 20px;
        }

        h2 {
            color: #4285f4;
        }

        .schedule-form {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            width: 50%;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: larger;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4285f4;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #356bcd;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>Class Scheduling</h1>
    </header>

    <nav>
        <a href="teacherhome.jsp"><i class="fas fa-chevron-left"></i> Back to Home</a>
    </nav>

    <section>
        <div class="schedule-form">
            <h2>Schedule a Virtual Class</h2>
            <form id="scheduleForm" method="post" action="ScheduleClassServlet">

                <label for="course">Course:</label>
                <select id="course" name="course" required>
                    <% 
                        // Populate the dropdown with courses from the 'courses' table
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project", "root", "root");
                            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM courses");
                            ResultSet resultSet = preparedStatement.executeQuery();

                            while (resultSet.next()) {
                                String courseName = resultSet.getString("courseName");
                    %>
                    <option value="<%= courseName %>"><%= courseName %></option>
                    <% 
                            }
                            connection.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    %>
                </select>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>

                <label for="time">Time:</label>
                <input type="time" id="time" name="time" required>

                <label for="meeting-link">Meeting Link:</label>
                <input type="text" id="meeting-link" name="meeting-link" placeholder="Enter virtual meeting link" required>

                <button type="submit">Schedule Class</button>
            </form>
        </div>
    </section>

    <footer>
        &copy; 2024 Class Scheduling
    </footer>
</body>
</html>
