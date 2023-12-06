<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-11-30
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>page 지시어 - errorPage, isErrorPage 속성</title>
</head>
<body>
    <%

            int myAge = Integer.parseInt(request.getParameter("age")) + 10;
            out.println("10년 후 당신의 나이는 " + myAge + " 입니다.");


    %>
</body>
</html>
