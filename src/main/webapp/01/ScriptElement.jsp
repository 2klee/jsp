<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%!
    public int add(int num1, int num2){
      return num1+num2;
    }
%>
<html>
<head>
    <title>스트립트 요소</title>
</head>
<body>
    <%
        int result = add(1,2);
    %>

    덧셈 결과 : <%= result%> <br>
    덧셈 결과 : <%= add(1,2)%>



</body>
</html>
