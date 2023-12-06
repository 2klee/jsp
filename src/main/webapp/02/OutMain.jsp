<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>내장 객체 Out</title>
</head>
<body>
    <%
        //버퍼 내용 삭제하기
        out.print("출력되지 않느 텍스트"); // 버퍼에 저장
        out.clearBuffer();
    %>

</body>
</html>
