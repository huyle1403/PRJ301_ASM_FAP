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

        <h1 >Ten Lop: ${requestScope.listGroup.getId()}</h1>
     
        <table border="1px">
            <tr>
                <td>Student ID</td>
                <td>Name</td>
                <td>Address</td>
                <td>Date Of Birth</td>
                <td>Gender</td>
            </tr>
            <c:forEach items="${requestScope.listGroups}" var="gr">
                <tr>
                    <td> ${gr.Student.id} </td>
                    <td> ${gr.Student.name} </td>
                    <td> ${gr.Student.address} </td>
                    <td> ${gr.Student.getDate()} </td>
                    <td> ${gr.Student.isGender()} </td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
