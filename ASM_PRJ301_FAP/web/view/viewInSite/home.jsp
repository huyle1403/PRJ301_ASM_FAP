<%-- 
    Document   : home
    Created on : Mar 13, 2024, 4:03:48 PM
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAP Dashboard</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            h1 {
                color: #ff6600;
                text-align: center;
                margin-top: 50px;
            }

            a {
                display: block;
                width: 200px;
                margin: 20px auto;
                padding: 10px;
                text-align: center;
                color: #fff;
                text-decoration: none;
                background-color:  #FF8C00;
                ;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            a:hover {
                background-color: #cc5500;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            }
            .logout-form {
                float: right;
                margin-right: 30px;
                margin-top: -20px;
            }

            .logout-form input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: #ff6600; /* Màu cam */
                color: #fff; /* Màu chữ trắng */
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .logout-form input[type="submit"]:hover {
                background-color: #cc5500;  
            }

        </style>
    <form action="LogoutController" method="POST" class="logout-form">
        <input type="submit" value="Logout">
    </form>
    <body>
        <div class="container">
            <h1>Welcome to FAP</h1>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/timeTable?from=2024-03-17&to=2024-03-23&nameLecturer=sonnt05">Time Table</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/view/viewInSite/HomeToAttendance.jsp">Attendance</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/attViewStu?studentId=1&subjectId=1">Attendance Student</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/checkGroup?id=1">Information Group</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/point?studentid=2&subjectname=mas291">Mark Report</a>
        </div>
    </body>
</html>
