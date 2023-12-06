<%@ page import="com.common.DBConnPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <title>DBConnPool</title>
</head>
<body>
<h2>DBConnPool 테스트</h2>
<%--    <h2>JDBC 연결 테스트 01</h2>--%>
<%--    <%--%>
<%--        JDBConnect jdbc1 = new JDBConnect();--%>

<%--        jdbc1.close();--%>
<%--    %>--%>
<%--    <h2>JDBC 연결 테스트 02</h2>--%>
<%--    <%--%>
<%--        String driver = application.getInitParameter("OracleDriver");--%>
<%--        String url = application.getInitParameter("OracleURL");--%>
<%--        String id = application.getInitParameter("OracleId");--%>
<%--        String pwd = application.getInitParameter("OraclePwd");--%>
<%--        JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);--%>

<%--        jdbc2.close();--%>
<%--    %>--%>
<%--    <h2>JDBC 연결 테스트 03</h2>--%>
<%--    <%--%>
<%--        JDBConnect jdbc3 = new JDBConnect(application);--%>

<%--        jdbc3.close();--%>
<%--    %>--%>

<%
  DBConnPool pool = new DBConnPool();
  pool.close();
%>


</body>
</html>