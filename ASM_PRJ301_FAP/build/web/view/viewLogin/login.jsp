<%-- 
    Document   : login
    Created on : Feb 27, 2024, 10:19:59 PM
    Author     : Huy
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <style>
        body {
            background-color: #F4A460; /* Màu cam */
            font-family: Arial, sans-serif;
        }
        form {
            background-color: #FFF; /* Màu nền trắng */
            width: 400px;
            padding: 20px;
            margin: 100px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #FFA500; /* Màu cam */
            color: #FFF; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #FF8C00; /* Màu cam nhạt */
        }
        h3{
            color: red;
        }
    </style>
</head>
<body>
    <form action="login" method="POST">
        <h2 style="text-align: center; color: #FFA500;">Login</h2>
        <label for="username">User:</label><br/>
        <input type="text" name="username" id="username"/><br/>
        <label for="password">Pass:</label><br/>
        <input type="password" name="password" id="password"/><br/>
        <h3>${mess}</h3>
        <input type="submit" value="Login"/>
    </form>
</body>
</html>

