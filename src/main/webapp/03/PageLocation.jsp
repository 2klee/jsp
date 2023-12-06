<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Object pInt = pageContext.getAttribute("pageInteger");
        Object pStr = pageContext.getAttribute("pageString");
        Object pPer = pageContext.getAttribute("pagePerson");
    %>

    <ul>
        <li>Interger 객체 : <%= (pInt == null)?"값없음":pInt %></li>
        <li>String 객체 : <%= (pStr == null)?"값없음":pStr %></li>
        <li>Person 객체 : <%= (pPer == null)?"값없음":((Person)pPer).getName() %></li>
    </ul>

</body>
</html>
