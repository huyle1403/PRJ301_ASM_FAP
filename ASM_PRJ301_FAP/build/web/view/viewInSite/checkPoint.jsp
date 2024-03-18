<%-- 
    Document   : checkPoint
    Created on : Mar 14, 2024, 1:59:53 AM
    Author     : Huy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Grade Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
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

        h2, h3 {
            text-align: center;
            color: #ff6600;
            margin-top: 20px;
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

        td:last-child {
            color: white;
            font-weight: bold;
        }

        td:last-child.pass {
            background-color: green;
        }

        td:last-child.fail {
            background-color: red;
        }
        .top{
            background-color: #6B90DA;
        }
    </style>
</head>
<body>
    <form action="point" method="GET"> 
        StudentID: <input type="text" name="studentid">
        SubjectName : <input type="text" name="subjectname">
        <input type="submit" value="View">
    </form>
    <c:forEach items="${requestScope.listPoint}" var="p">
        <h2>Grade report for: ${p.student.name}</h2>
        <h3>Subject Name: ${p.subject.name}</h3>
        <table>
            <tr class="top">
                <td>GRADE ITEM</td>
                <td>WEIGHT</td>
                <td>VALUE</td>
                <td>COMMENT</td>
            </tr>
            <tr>
                <td>Progess Test 1</td>
                <td>10%</td>
                <td>${p.progressTest1}</td>
                <td></td>
            </tr>
            <tr>
                <td>Progess Test 2</td>
                <td>10%</td>
                <td>${p.progressTest2}</td>
                <td></td>
            </tr>
            <tr>
                <td>Participation</td>
                <td>10%</td>
                <td>${p.participation}</td>
                <td></td>
            </tr>
            <tr>
                <td>Assignment</td>
                <td>30%</td>
                <td>${p.assignment}</td>
                <td></td>
            </tr>
            <tr>
                <td>Practical Exam</td>
                <td>20%</td>
                <td>${p.practicalExam}</td>
                <td></td>
            </tr>
            <tr>
                <td>Final Exam</td>
                <td>20%</td>
                <td>${p.finalExam}</td>
                <td></td>
            </tr>
            <tr>
                <td>COURSE TOTAL</td>
                <td></td>
                <c:set var="avg" value="${p.progressTest1*0.1 + p.progressTest2*0.1  + p.participation*0.1  
                                          + p.assignment*0.3  + p.practicalExam*0.2  + p.finalExam*0.2 }" />
                <c:set var="result" value="${avg >= 4.0 ? 'Pass' : 'Not Pass'}" />
                <c:set var="averageFormatted" value="${String.format('%.2f', avg)}" />
                <td>${averageFormatted}</td>
                <td class="${avg >= 4.0 ? 'pass' : 'fail'}">${result}</td>
            </tr>
        </table>
    </c:forEach>
</body>
</html>