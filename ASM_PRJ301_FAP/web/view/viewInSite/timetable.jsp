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

            input[type="date"], input[type="text"] {
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

            .attended {
                color: green;
            }

            .Notyet {
                color: red;
            }

            .dong1 {
                background-color: #6B90DA;
            }

           
            .form-container {
                text-align: center; 
                margin-bottom: 20px; 
            }
             .link-container {
                text-align: left;
                margin: 20px auto;
                display: block;
                padding-left: 20px;
            }

            .link-container a {

                color: white;
                background-color: orange;
                text-decoration: none;
                transition: color 0.3s ease;
                padding: 10px;
                margin-left: 30px;
                margin-top: 153px;
            }

            .link-container a:hover {
                color: #0056b3;
                background-color: #f0f0f0;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
         <div class="link-container">
            <a href="http://localhost:9999/ASM_PRJ301_FAP/view/viewInSite/home.jsp">Home</a>
        </div>

        </br> </br> </br>
        <div class="form-container">
            <form action="timeTable" method="GET">
                From:
                <input type="date" name="from" value="${requestScope.from}" />

                To:
                <input type="date" name="to" value="${requestScope.to}"/>

                Lecturer:
                <input type="text" name="nameLecturer">

                <input type="submit" value="View"/>
            </form>
        </div>

        <table>
                
            <tr class="dong1">
             <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                        <div>(<fmt:formatDate pattern="E" value="${d}" />)</div>
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
                                    ${les.group.name} <br/> ${les.group.subject.name} at - ${les.room.name}</br>
                                    <a href="attendance?id=${les.id}" class="${les.attended ? 'attended' : 'Notyet'}">
                                        (${les.attended ? 'attended' : 'Not yet'})
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
