<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

         #assign{
            padding-left: 25px;;
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

        .classroom-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .classroom-list li {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .classroom-list li:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .classroom-list li a {
            text-decoration: none;
            color: #4285f4;
            font-weight: bold;
            transition: color 0.3s;
        }

        .classroom-list li a:hover {
            color: #333;
        }

        .assignments {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        .assignment-item {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .assignment-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .grades {
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
        }

        .grade-item {
            border: 1px solid #ddd;
            margin: 10px 0;
            padding: 15px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: box-shadow 0.3s;
        }

        .grade-item:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #333;
            color: #fff;
            padding-top: 10px;
            text-align: center;
            position:relative;
            margin-top:330px;
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

        #myCourses {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            align-items: center;
            margin-top: 20px;
        }

        #myCourses .course {
            text-align: center;
            margin: 15px;
            padding: 10px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        #myCourses .course h3 {
            margin-bottom: 10px;
            color: #ff6b6b;
        }

        #myCourses .course p {
            font-size: 14px;
            color: #666;
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

    <section>
        <h2><a href="mycourses.jsp">Enrolled Courses</a></h2>
        <div class="course-container" id="dashboardCourses">
            <!-- Enrolled courses will be dynamically added here -->
        </div>
    </section>

    


    <h2 id="assign"><a href="assignments.jsp">Assignments</a></h2>
    <section id="assignments" class="assignments">
    </section>

    <footer>
        &copy; 2024 Classroom Dashboard
    </footer>
    
</body>

</html>