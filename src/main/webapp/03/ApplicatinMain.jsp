<%@ page import="java.util.Map" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>applicatin 영역</title>
</head>
<body>
  <h2>applicatin 영역의 공유</h2>
  <%
    Map<String, Person> maps = new HashMap<>();
    maps.put("actor1", new Person("이수일", 30));
    maps.put("actor2", new Person("심순애", 28));
    application.setAttribute("maps", maps);
  %>
  application 영역에 속성이 저장되었습니다.
</body>
</html>
