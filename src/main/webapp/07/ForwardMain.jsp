<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  String outerPath1 = "./OuterPage1.jsp";
//  String outerPath2 = "./OuterPage2.jsp";

  pageContext.setAttribute("pAttr", "김유신");
  request.setAttribute("rAttr", "계백");
%>
<html>
<head>
  <title>액션태크 - forward</title>
</head>
<body>
  <h2>액션 태그를 이용한 포워딩</h2>
<jsp:forward page="./ForwardSub.jsp"></jsp:forward>

</body>
</html>
