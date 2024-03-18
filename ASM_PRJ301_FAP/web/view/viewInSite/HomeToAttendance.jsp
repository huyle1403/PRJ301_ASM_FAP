<%-- 
    Document   : HomeToAttendance
    Created on : Mar 18, 2024, 3:37:23 PM
    Author     : Huy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
            margin-top: 30px;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: block;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Attendance</h1>
<table>
    <tr>
        <th>Group</th>
        <th>Status</th>
    </tr>
    <tr>
        <td>PRJ301 - SE1711</td>
        <td><a href="http://localhost:9999/ASM_PRJ301_FAP/attendance?id=1">Take</a></td>
    </tr>
    <tr>
        <td>MAS291 - SE1718</td>
        <td><a href="http://localhost:9999/ASM_PRJ301_FAP/attendance?id=2">Take</a></td>
    </tr>
    <tr>
        <td>IOT102 - SE1719</td>
        <td><a href="http://localhost:9999/ASM_PRJ301_FAP/attendance?id=3">Take</a></td>
    </tr>
    <tr>
        <td>JPD123 - SE1820</td>
        <td><a href="http://localhost:9999/ASM_PRJ301_FAP/attendance?id=4">Take</a></td>
    </tr>
    <tr>
        <td>PRJ301 - SE1820</td>
        <td><a href="http://localhost:9999/ASM_PRJ301_FAP/attendance?id=5">Take</a></td>
    </tr>
</table>
</body>
</html>

