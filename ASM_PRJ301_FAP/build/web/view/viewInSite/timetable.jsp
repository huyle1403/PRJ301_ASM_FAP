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

            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                text-align: center;
                padding: 8px;
                border: 1px solid #ddd;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <table border="1px">
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
                                    <a href="attendance?id=${les.id}">
                                        <c:if test="${les.attended}">Edit</c:if>
                                        <c:if test="${!les.attended}">Take</c:if>
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
