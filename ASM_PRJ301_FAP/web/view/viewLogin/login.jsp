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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            User: <input type="text" name="username"/> <br/>
            Pass: <input type="password" name="password"/> <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
