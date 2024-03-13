<%-- 
    Document   : attendance
    Created on : Mar 12, 2024, 2:25:52 AM
    Author     : Huy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance Form</title>
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
            width: 80%;
            margin: 20px auto;
            border: 1px solid #ddd;
        }

        th, td {
            text-align: center;
            padding: 8px;
            border: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="radio"] {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            background-color: #ff6600;
            color: white;
            cursor: pointer;
            margin: 20px auto;
            display: block;
        }

        input[type="submit"]:hover {
            background-color: #cc5500;
        }
    </style>
</head>
<body>
    <h1>Attendance Form</h1>
    <form action="attendance" method="POST">
        <input type="hidden" name="id" value="${param.id}" />
        <table>
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Presented</td>
                <td>Note</td>
                <td>Time</td>
            </tr>
            <c:forEach items="${requestScope.atts}" var="a">
            <tr>
                <td>${a.student.id}</td>
                <td>${a.student.name}</td>
                <td>
                    <input type="radio" 
                           ${!a.present ? "checked" : ""}
                           name="present${a.student.id}" value="no"/> No
                    <input type="radio" 
                           ${a.present ? "checked" : ""}
                           name="present${a.student.id}" value="yes"/> Yes
                </td>
                <td>
                    <input type="text" name="description${a.student.id}" value="${a.description}"/>
                </td>
                <td>${a.time}</td>
            </tr>    
            </c:forEach>
        </table>
        <input type="submit" value="Save"/>
    </form>
</body>
</html>
