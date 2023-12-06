<%@ page import="com.common.JDBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>JDBC</title>
</head>
<body>
  <h2>회원 추가 테스트</h2>
  <%
    // DB 연결
    JDBConnect jdbc = new JDBConnect();

    String id = "ts";
    String pwd = "1234";
    String name = "이태신";

    // 쿼리문 생성
    String sql = "INSERT INTO member VALUES (?,?,?,sysdate)";
    PreparedStatement psmt = jdbc.con.prepareStatement(sql);
    psmt.setString(1,id);
    psmt.setString(2,pwd);
    psmt.setString(3,name);

    // 쿼리 실행
    int result = psmt.executeUpdate();
    out.print(result + "행이 추가 되었습니다.");

    // 연결종료
    jdbc.close();
  %>

</body>
</html>
