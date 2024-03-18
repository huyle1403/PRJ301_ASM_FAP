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

            .link-container {
                text-align: center;
                margin-top: 20px;
            }

            .link-container a {
                display: inline-block;
                margin: 0 10px;
                padding: 10px;
                text-align: center;
                color: #fff;
                text-decoration: none;
                background-color: #ff6600;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .link-container a:hover {
                background-color: #cc5500;
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

            .gender {
                width: 50px;
                height: auto;
            }
            .dong1{
                background-color: #6B90DA;
            }
            
        </style>
    </head>
    <body>
        <div class="link-container">
            <a  href="http://localhost:9999/ASM_PRJ301_FAP/view/viewInSite/home.jsp">Home</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/checkGroup?id=1">SE1817</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/checkGroup?id=2">SE1818</a>
            <a href="http://localhost:9999/ASM_PRJ301_FAP/checkGroup?id=3">SE1819</a>
        </div>

        <h1>Group Information</h1>

        <table>
            <tr class="dong1">
                <td>Index</td>
                <td>Gender</td>
                <td>Student ID</td>
                <td>Name</td>
                <td>Address</td>
                <td>Date Of Birth</td>
            </tr>
            <c:forEach items="${requestScope.listGroups}" var="gr" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td> 
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
