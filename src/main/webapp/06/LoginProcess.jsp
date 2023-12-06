<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 로그인 포에서 받아온 파라미터
  String UserId = request.getParameter("user_id");
  String UserPwd = request.getParameter("user_pw");

//  String oracleDriver = application.getInitParameter("OracleDriver");
//  String oracleURL = application.getInitParameter("OracleURL");
//  String oracleId = application.getInitParameter("OracleId");
//  String oraclePwd = application.getInitParameter("OraclePwd");

  MemberDAO dao = new MemberDAO();
  MemberDTO memberDTO = dao.getMemberDTO(UserId, UserPwd);
  dao.close();


  // 로그인 성공 여부에 따른 처리
  if (memberDTO.getId() != null){
    // 로그인 성공
    session.setAttribute("UserId", memberDTO.getId());
    session.setAttribute("UserName", memberDTO.getName());
    response.sendRedirect("LoginForm.jsp");
  }else {
    // 로그인 실패
    request.setAttribute("LoginErrMsg", "아이디/패스워드를 확인하세요");
    request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
  }

%>