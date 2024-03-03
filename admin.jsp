<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Virtual Classroom</title>
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

        .admin-actions {
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
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <nav>
        <a href="admin.jsp">Dashboard</a>
        <a href="manageUsers.jsp">Manage Users</a>
        <a href="manageCourses.jsp">Manage Courses</a>
        <!-- Add more admin functionalities as needed -->
        <a href="logout.jsp">Logout</a>
    </nav>

    <section>
        <div class="admin-actions">
            <h2>Admin Actions</h2>
            <!-- Add admin functionalities here -->
            <label for="action">Select Action:</label>
            <select id="action" name="action" required>
                <option value="add_user">Add User</option>
                <option value="delete_user">Delete User</option>
                <option value="add_course">Add Course</option>
                <option value="delete_course">Delete Course</option>
                <!-- Add more actions as needed -->
            </select>

            <!-- Add input fields and buttons for selected actions -->
            <!-- For example, if the action is "Add User" -->
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="button" onclick="performAdminAction()">Perform Action</button>
        </div>
    </section>

    <footer>
        &copy; 2024 Virtual Classroom
    </footer>

    <script>
        function performAdminAction() {
            // Get selected action
            var selectedAction = document.getElementById('action').value;

            // Add logic to perform admin action based on the selected action
            // You can use AJAX to send the selected action to the server and handle the action server-side
            // For simplicity, I'm just showing an alert for now
            alert("Performing admin action: " + selectedAction);
        }
    </script>
</body>
</html>
