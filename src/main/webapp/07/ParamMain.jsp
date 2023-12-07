<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String pValue = "방랑시인";
%>

<html>
<head>
  <title>액션태그 - param</title>
</head>
<body>
  <jsp:useBean id="person" class="com.common.Person" scope="request" />
  <jsp:setProperty name="person" property="name" value="이태신" />
  <jsp:setProperty name="person" property="age" value="20" />
  <jsp:forward page="ParamFoward.jsp?param1=홍길동">
    <jsp:param name="param2" value="경기도"/>
    <jsp:param name="param3" value="<%= pValue %>"/>
  </jsp:forward>
</body>
</html>
