<%-- 
    Document   : timetable
    Created on : Mar 7, 2024, 1:13:27 AM
    Author     : Huy
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        table {
            border-collapse: collapse;
            width: 100%;
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

        input[type="date"] {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        select {
            padding: 5px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 5px 10px;
            border-radius: 3px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #000;
        }

        a:hover {
            text-decoration: underline;
        }

        .edit {
            color: blue;
        }

        .take {
            color: green;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td>
            <form action="timeTable" method="GET">
                From : <input type="date" name="from" value="${requestScope.from}" /> <br>
                To: <input  type="date" name="to" value="${requestScope.to}"/>
                <select name="id">
                    <option value="${param.id}">${param.id}</option>
                    <c:forEach  var="i" begin="1" end="4">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="View"/>
            </form>
        </td>
        <c:forEach items="${requestScope.dates}" var="d">
            <td>
                <div> (<fmt:formatDate pattern="E" value="${d}" />) </div>
                <div>${d}</div>
            </td>
        </c:forEach>
    </tr>

    <c:forEach items="${requestScope.slots}" var="slot">
        <tr>
            <td>${slot.name}</td>
            <c:forEach items="${requestScope.dates}" var="d">
                <td>
                    <c:forEach items="${requestScope.lessions}" var="les">
                        <c:if test="${les.date eq d and les.slot.id eq slot.id}">
                            ${les.group.name} - ${les.group.subject.name}
                            <a href="attendance?id=${les.id}" class="${les.attended ? 'edit' : 'take'}">
                                ${les.attended ? 'Edit' : 'Take'}
                            </a>
                        </c:if>
                    </c:forEach>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
</body>
</html>
