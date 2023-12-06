<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  request.setAttribute("reqStr","request 영역의 문자열");
  request.setAttribute("reqPer",new Person("이태신",31));
%>
<html>
<head>
  <title>request 영역</title>
</head>
<body>
  <h2>request 영역의 속성값 삭제하기</h2>
  <%
    request.removeAttribute("reqStr");
    request.removeAttribute("reqInt");
  %>

  <h2>request 영역의 속성값 읽기</h2>
  <%
    Person rPerson = (Person) (request.getAttribute("reqPer"));
  %>
  <ul>
    <li>String 객체 : <%= request.getAttribute("reqStr") %></li>
    <li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
  </ul>

  <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
  <%
    request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
  %>

</body>
</html>
