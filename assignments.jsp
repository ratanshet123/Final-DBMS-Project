<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignment List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f6f5f5; /* Soft gray background */
        animation: slidePage 1s ease;
    }

    header {
        background: linear-gradient(to right, #ff6b6b, #556270); /* Gradient from red to blue */
        color: #fff;
        padding: 15px;
        text-align: center;
        animation: slideHeader 1s ease;
    }

    nav {
        background: linear-gradient(to right, #833ab4, #fd1d1d, #fcb045); /* Gradient from purple to red to orange */
        padding: 10px;
        text-align: center;
        animation: slideNav 1s ease;
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
        animation: slideSection 1s ease;
    }

    h2 {
        color: #ff6b6b; /* Heading color changed to red */
        text-align: center;
    }

    .assignment-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        align-items: center;
    }

    .assignment {
        text-align: center;
        margin: 15px;
        padding: 10px;
        border-radius: 8px;
        background-color: #fff; /* White background for assignments */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        animation: slideAssignment 1s ease;
    }

    .assignment:hover {
        transform: translateY(-5px);
        background-color: #f0f0f0; /* Light gray background on hover */
    }

    .assignment h3 {
        margin-bottom: 10px;
        color: #ff6b6b; /* Heading color changed to red */
    }

    .assignment-description {
        font-size: 14px;
        color: #666;
    }

    /* Additional CSS for animation */
    @keyframes slidePage {
        from {
            opacity: 0;
            transform: translateX(-100%);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes slideHeader {
        from {
            opacity: 0;
            transform: translateX(-100%);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes slideNav {
        from {
            opacity: 0;
            transform: translateX(-100%);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes slideSection {
        from {
            opacity: 0;
            transform: translateX(-100%);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    @keyframes slideAssignment {
        from {
            transform: translateY(-100%);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>

</head>
<body>
    <header>
        <h1>Assignments List</h1>
    </header>
    <nav>
        <a href="dashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

    <section>
        <h2>Available Assignments</h2>
        <div class="assignment-container">
            <!-- Assignments fetched from the database will be included here -->
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project", "root", "root");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM assignments");
                    while (rs.next()) {
            %>
            <div class="assignment">
                <%-- <h3>Assignment ID: <a href="assignment.jsp?id=<%= rs.getInt("id") %>"><%= rs.getInt("id") %></a></h3> --%>
                <h3>Assignment Title: <%= rs.getString("AssignmentTitle") %></h3>
                <p class="assignment-description">Due Date: <%= rs.getString("DueDate") %></p>
                <p class="assignment-description">Course Name: <%= rs.getString("CName") %></p>
            </div>
            <%-- End of assignment div --%>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </div>
    </section>
</body>
</html>