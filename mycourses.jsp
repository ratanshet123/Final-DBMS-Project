<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% Map<String, String[]> parameters = request.getParameterMap();
   for (Map.Entry<String, String[]> entry : parameters.entrySet()) {
       System.out.println(entry.getKey() + ": " + Arrays.toString(entry.getValue()));
   }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f6f5f5;
        }

        header {
            background: linear-gradient(to right, #ff6b6b, #556270);
            color: #fff;
            padding: 15px;
            text-align: center;
        }

        nav {
            background: linear-gradient(to right, #833ab4, #fd1d1d, #fcb045);
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
            color: #4b4b4b;
        }

        section {
            padding: 20px;
        }

        h2 {
            color: #ff6b6b;
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

        .remove-button {
            background-color: #ff6b6b;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .remove-button:hover {
            background-color: #4b4b4b;
        }
    </style>
</head>
<body>
    <header>
        <h1>My Courses</h1>
    </header>
    <nav>
        <a href="dashboard.jsp"><i class="fas fa-chevron-left"></i> Back to Dashboard</a>
    </nav>

       <section>
        <div class="course-details">
            <h2>Enrolled Course</h2>
            <div>
                <h3>Course ID: <%= request.getParameter("id") %></h3>
                <h3>Course Name: <%= request.getParameter("courseName") %></h3>
                <p class="course-description">Course Description: <%= request.getParameter("courseDescription") %></p>
            </div>
        </div>
    </section>


  <script>
    // Function to get query parameters from the URL
    function getQueryParameter(parameterName) {
        var queryString = window.location.search.substring(1);
        var parameters = queryString.split("&");

        for (var i = 0; i < parameters.length; i++) {
            var pair = parameters[i].split("=");
            if (pair[0] === parameterName) {
                return pair[1];
            }
        }

        return null;
    }

    // Function to update enrolled courses on the My Courses page
    function updateMyCourses() {
        // Assuming you have a container with the ID "myCourses"
        var myCoursesContainer = document.getElementById("myCourses");

        // Clear the existing content
        myCoursesContainer.innerHTML = "";

        // Get the enrolled course ID from the query parameter
        var enrolledCourseId = getQueryParameter('enrolledCourse');

        if (enrolledCourseId) {
            // Display the enrolled course on the My Courses page
            var enrolledCourseElement = document.getElementById(`enrolledCourse${enrolledCourseId}`);
            if (enrolledCourseElement) {
                // Clone the enrolled course element and append it to the My Courses container
                var clonedCourseElement = enrolledCourseElement.cloneNode(true);
                myCoursesContainer.appendChild(clonedCourseElement);
            } else {
                console.error(`Could not find element with ID enrolledCourse${enrolledCourseId}`);
            }
        } else {
            console.error("No enrolled course ID found in the query parameter.");
        }
    }

    // Call the updateMyCourses function after the page has fully loaded
    window.onload = updateMyCourses;
</script>




</body>
</html>
