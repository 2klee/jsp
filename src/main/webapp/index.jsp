<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         trimDirectiveWhitespaces="true"
%>
<%!
    String str1 = "JSP";
    String str2 = "안녕하세요";
%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= str1 + " 입니다. " + str2 %>
</h1>
<p>
    <jsp:include page="/Common/Link.jsp"></jsp:include>

    <% out.println( str1 + " 입니다. " + str2); %>
    <br>
    <%
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
        out.println("오늘은 " + todayStr + " 입니다.");
    %>
</p>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
</body>
</html>