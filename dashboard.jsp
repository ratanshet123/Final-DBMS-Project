<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classroom Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.12.305/pdf.min.js"></script>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
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

        .dashboard-container {
            display: flex;
            justify-content: space-around;
            margin: 20px;
        }

        .dashboard-container section {
            width: 48%;
        }

        .course-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            align-items: center;
            margin-top: 20px;
        }

        .course {
            text-align: center;
            margin: 15px;
            padding: 10px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .course:hover {
            transform: translateY(-5px);
            background-color: #f0f0f0;
        }

        .course h3 {
            margin-bottom: 10px;
            color: #ff6b6b;
        }

        .course-description {
            font-size: 14px;
            color: #666;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding-top: 10px;
            text-align: center;
            position:relative;
            margin-top: 425px;
        }
    </style>

</head>

<body>
    <header>
        <h1>Classroom Dashboard</h1>
    </header>

    <nav>
        <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="course.jsp"><i class="fas fa-book"></i> Course Announcements</a>
        <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <div class="dashboard-container">
        <!-- Enrolled Courses Section -->
        <section>
            <h2><a href="mycourses.jsp">Enrolled Courses</a></h2>
            <div class="course-container" id="dashboardCourses">
                <!-- Enrolled courses will be dynamically added here -->
            </div>
        </section>

        <!-- Assignments Section -->
        <section>
            <h2><a href="assignments.jsp">Assignments</a></h2>
            <!-- Assignments content will be added here -->
        </section>
    </div>

    <footer>
        &copy; 2024 Classroom Dashboard
    </footer>

</body>

</html>
