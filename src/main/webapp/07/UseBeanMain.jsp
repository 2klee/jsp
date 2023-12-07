<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>액션태그 - UseBean</title>
</head>
<body>
  <h2>useBean 액션 태그</h2>
  <h3>자바빈즈 생성하기</h3>
  <jsp:useBean id="person" class="com.common.Person" scope="request" />

  <%--
    useBean 내부 동작
    Person person = (Person)request.getAttribute("person");
    if (person == null){
      person = new Person();
      request.setAttribute("person");
    }
  --%>

  <h2>setProperty 액션태그로 자바빈즈 속성 지정하기</h2>
  <jsp:setProperty name="person" property="name" value="이태신" />
  <jsp:setProperty name="person" property="age" value="20" />

  <h2>getProperty 액션 태그로 자바빈즈 속성 가져오기</h2>
  <ul>
    <li>이름 : <jsp:getProperty name="person" property="name"/></li>
    <li>나이 : <jsp:getProperty name="person" property="age"/></li>
  </ul>


</body>
</html>
