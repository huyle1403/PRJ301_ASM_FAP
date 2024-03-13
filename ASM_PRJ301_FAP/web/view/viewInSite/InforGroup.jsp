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
    </head>
    <body>

     
        <h1 >Ten Lop: ${requestScope.listGroups[0].name} </h1>

        <table border="1px">
            <tr>
                <td>Gender</td>
                <td>Student ID</td>
                <td>Name</td>
                <td>Address</td>
                <td>Date Of Birth</td>

            </tr>
            <c:forEach items="${requestScope.listGroups}" var="gr">
                <tr>
                    <td> ${gr.student.gender} </td>
                    <td> ${gr.student.id} </td>
                    <td> ${gr.student.name} </td>
                    <td> ${gr.student.address} </td>
                    <td> ${gr.student.date} </td>

                </tr>
            </c:forEach>

        </table>
    </body>
</html>
