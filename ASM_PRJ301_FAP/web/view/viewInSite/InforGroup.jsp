<%-- 
    Document   : InforGroup
    Created on : Mar 13, 2024, 12:40:09 AM
    Author     : Huy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            width: 100%;
            margin-top: 20px;
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

        .gender {
            width: 50px;
            height: auto;
        }
    </style>
</head>
<body>
    <h1>Class: ${requestScope.listGroups[0].name}</h1>

    <table>
        <tr>
            <td>Gender</td>
            <td>Student ID</td>
            <td>Name</td>
            <td>Address</td>
            <td>Date Of Birth</td>
        </tr>
        <c:forEach items="${requestScope.listGroups}" var="gr">
            <tr>
                <td>
                    <c:if test="${!gr.student.gender}">
                        <img class="gender" src="img/nu.jpg" alt="">
                    </c:if>
                    <c:if test="${gr.student.gender}">
                        <img class="gender" src="img/nam.jpg" alt="">
                    </c:if>
                </td>
                <td>${gr.student.id}</td>
                <td>${gr.student.name}</td>
                <td>${gr.student.address}</td>
                <td>${gr.student.date}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
