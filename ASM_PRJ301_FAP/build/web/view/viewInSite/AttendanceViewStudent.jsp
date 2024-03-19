<%-- 
    Document   : AttendanceViewStudent
    Created on : Mar 18, 2024, 9:31:48 PM
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

            .container {
                display: flex;
                justify-content: center;
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .table-container {
                margin: 20px;
            }

            table {
                width: 300px; /* Điều chỉnh kích thước bảng tùy thuộc vào nhu cầu */
                border-collapse: collapse;
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

            form {
                margin-bottom: 20px;
            }

            form input[type="text"], form input[type="submit"] {
                padding: 5px;
                border-radius: 3px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
            }

            form input[type="submit"] {
                background-color: #ff6600;
                color: white;
                cursor: pointer;
                border: none;
            }

            form input[type="submit"]:hover {
                background-color: #cc5500;
            }

            h2,h3 {
                color: #ff6600;
                text-align: center;
                margin-top: 30px;
                margin-bottom: 10px;
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
            form {
                margin: 20px;
                text-align: center;
            }

            form input[type="text"] {
                padding: 5px;
                border-radius: 3px;
                border: 1px solid #ccc;
                margin: 5px;
            }

            form input[type="submit"] {
                padding: 8px 20px;
                border-radius: 5px;
                border: none;
                background-color: #ff6600;
                color: white;
                cursor: pointer;
            }

            form input[type="submit"]:hover {
                background-color: #cc5500;
            }
        </style>
    </head>
    <body>
        <div class="link-container">
            <a href="http://localhost:9999/ASM_PRJ301_FAP/view/viewInSite/home.jsp">Home</a>
        </div>
        <form action="attViewStu" method="GET">
            StudentID <input type="text" name="studentId">
            SubjectID <input type="text" name="subjectId">
            <input type="submit" value="View">
        </form>

        <c:forEach items="${requestScope.lessions}" var="l"  begin="0" end="0" >
            <h2>
                View attendance for: ${l.student.name}</h2>
            <h3>Subject Name: ${l.subject.name}</h3>
        </c:forEach>
        <div class="container">

            <div class="table-container">
                <table border="1px">
                    <tr>
                        <th>CAMPUS/PROGRAM</th>
                        <th>TERM</th>
                        <th>COURSE</th>
                    </tr>
                    <tr>
                        <td>FU-HL</td>
                        <td>Spring23</td>
                        <td>Statistics and Probability(MAS291)<br>(SE1817,start 02/01/2024)</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Summer23</td>
                        <td>Elementary Japanese 1-A1.2(JPD123)<br>(SE1817,start 02/01/2024)</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Fall2023</td>
                        <td>Java Web Application Development(PRJ301)<br>(SE1817,start 02/01/2024)</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Spring2024</td>
                        <td>Internet vạn vật(IOT102)<br>(SE1817,start 03/01/2024)</td>
                    </tr>
                </table>
            </div>

            <div class="table-container">
                <table border="1px">
                    <tr>
                        <th>NO.</th>
                        <th>DATE</th>
                        <th>SLOT</th>
                        <th>ROOM</th>
                        <th>GROUP NAME</th>
                        <th>ATTEDANCE STATUS</th>
                        <th>LECTURER'S COMMENT</th>
                    </tr> <c:forEach items="${requestScope.lessions}" var="les" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td style="padding: 10px; white-space: nowrap;">${les.date}</td>
                            <td>${les.slot.name}</td>
                            <td>${les.room.name}</td>
                            <td>${les.group.name}</td>
                            <td style="color: ${les.attended ? 'green' : 'red'}">
                                ${les.attended ? 'Attendance' : 'Absent'}
                            </td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

    </body>
</html>
