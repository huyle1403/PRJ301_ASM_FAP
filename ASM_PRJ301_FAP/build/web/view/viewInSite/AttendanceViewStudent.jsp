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
    </head>
    <body>
        <form action="attViewStu" method="GET">
            input StudentId <input type="text" name="studentId"></br>
              input subjectId <input type="text" name="subjectId"></br>
              <input type="submit" value="view">
        </form>
        <table  border="1px">
            <tr>
                <th>CAMPUS/PROGRAM</th>
                <th>TERM</th>
                <th>COURSE</th>
            </tr>
            <tr>
                <td>FU-HL</td>
                <td>Spring23</td>
                <td>Statistics and Probability(MAS291)</br>(SE1817,start 02/01/2024)</td>
            </tr>
            <tr>
                <td></td>
                <td>Summer23</td>
                <td>Elementary Japanese 1-A1.2(JPD123)</br>(SE1817,start 02/01/2024)</td>
            </tr>
            <tr>
                <td></td>
                <td>Fall2023</td>
                <td>Java Web Application Development(PRJ301)</br>(SE1817,start 02/01/2024)</td>
            </tr>
            <tr>
                <td></td>
                <td>Spring2024</td>
                <td>Internet vạn vật(IOT102)</br>(SE1817,start 03/01/2024)</td>
            </tr>
        </table>


        <table border="1px">
            <tr>
                <th>NO.</th>
                <th>DATE</th>
                <th>SLOT</th>
                <th>ROOM</th>
                <th>GROUP NAME</th>
                <th>ATTEDANCE STATUS</th>
                <th>LECTURER'S COMMENT</th>
            </tr>

            <c:forEach items="${requestScope.lessions}" var="les" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${les.date}</td>
                    <td>${les.slot}</td>
                    <td>${les.room}</td>
                    <td>${les.group}</td>
                    <td>${les.attended}</td>
                    <td></td>
                </tr>

            </c:forEach>

        </table>
    </body>
</html>
