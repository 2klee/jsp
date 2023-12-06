<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<h4>Include 페이지</h4>
<%
  int pInt2 = (Integer)(pageContext.getAttribute("pageInteger"));
//  String pStr2 = pageContext.getAttribute("pageString").toString();
  Person pPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>

<ul>
  <li>Interger 객체 : <%= pInt2 %></li>
  <li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
  <li>Person 객체 : <%= pPerson2.getName() %>, <%= pPerson2.getAge() %></li>
</ul>