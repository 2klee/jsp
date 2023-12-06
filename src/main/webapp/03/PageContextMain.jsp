<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  pageContext.setAttribute("pageInteger", 1000);
  pageContext.setAttribute("pageString", "페이지 영역의 문자열");
  pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<html>
<head>
  <title>page 영역</title>
</head>
<body>
  <h2>page 영역의 속성값 읽기</h2>
  <%
    int pInt = (Integer)(pageContext.getAttribute("pageInteger"));
    String pStr = pageContext.getAttribute("pageString").toString();
    Person pPerson = (Person) (pageContext.getAttribute("pagePerson"));
  %>

  <ul>
    <li><%= pInt %></li>
    <li><%= pStr %></li>
    <li><%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
  </ul>

  <h2>페이지 이동후 page 영역 읽어오기</h2>
  <a href="PageLocation.jsp">pageLocation 바로가기</a>

  <h2>include된 파일에서 page 영역 읽어오기</h2>
  <%@ include file="PageInclude.jsp"%>

</body>
</html>
