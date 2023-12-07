<%@ page import="com.model1.BoardDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model1.BoardDTO" %>
<%@ page import="util.BoardPage" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // DAO를 생성해 DB에 연결
  BoardDAO dao = new BoardDAO();

  // 사용자가 입력한 검색 조건을 Map에 저장
  Map<String, Object> param = new HashMap<>();
  String searchField = request.getParameter("searchField");
  String searchWord = request.getParameter("searchWord");
  if (searchWord != null){
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
  }

  int totalCount = dao.selectCount(param); // 게시물 수 확인

  /* 페이지 처리 start */
  // 전체 페이지 수 계산
  int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
  int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
  int totalPage = (int)Math.ceil((double) totalCount / pageSize);

  // 현재 페이지 확인
  int pageNum = 1;
  String pageTemp = request.getParameter("pageNum");
  if (pageTemp != null && !pageTemp.equals("")){
    pageNum = Integer.parseInt(pageTemp);
  }

  // 목롯에 출력할 게시물 입력 계산
  int start = (pageNum - 1) * pageSize + 1;
  int end = pageNum * pageSize;
  param.put("start", start);
  param.put("end", end);

  List<BoardDTO> boardList = dao.selectListPage(param);    // 게시물 목록
  dao.close();


%>


<html>
<head>
  <title>회원제 게시판</title>
</head>
<body>
  <jsp:include page="../Common/Link.jsp"></jsp:include>
  <h2>목록 보기 - 현재 페이지 : <%= pageNum %> (전체: <%= totalPage%>)</h2>
  <form method="get">
    <table border="1" width="90%">
      <tr>
        <td align="center">
          <select name="searchField">
            <option value="title">제목</option>
            <option value="content">내용</option>
          </select>
          <input type="text" name="searchWord">
          <input type="submit" name="검색">
        </td>
      </tr>
    </table>
  </form>

<%--  게시물 목록 테이블--%>
  <table border="1" width="90%">
    <tr>
      <th width="10%">번호</th>
      <th width="50%">제목</th>
      <th width="15%">작성자</th>
      <th width="10%">조회수</th>
      <th width="15%">작성일</th>
    </tr>

    <%
      // 게시물이 하나도 없을때
      if (boardList.isEmpty()) {

    %>
      <tr>
        <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
      </tr>
    <%
        // 게시물이 있을 때
      }else {
        int virtualNum = 0; // 화면상에서 게시물 번호
          int countNum = 0;
          for (BoardDTO dto : boardList){
            virtualNum = totalCount - (((pageNum -1) * pageSize) + countNum++);
          %>

          <tr align="center">
            <td><%= virtualNum %></td> <%--게시물 번호--%>
            <td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"><%= dto.getTitle() %></a> </td> <%--제목--%>
            <td align="center"><%= dto.getId() %></td>   <%--작성자 아이디--%>
            <td align="center"><%= dto.getVisitcount() %></td>  <%--조회수--%>
            <td align="center"><%= dto.getPostdate() %></td>  <%--작성일--%>
          </tr>
    <%
          }

        }
    %>

  </table>

  <table border="1" width="90%">
    <tr align="center">
      <td>
        <%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
      </td>
      <td>
        <button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
      </td>
    </tr>
  </table>
</body>
</html>