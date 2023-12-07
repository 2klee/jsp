package com.model1;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class BoardDAO extends DBConnPool {
  public BoardDAO() {
    super();
  }

  /*검색 조건에 맞는 게시물 개수 반화*/
  public int selectCount(Map<String, Object>map){
    int totalCount = 0;
    String query = "SELECT COUNT(*) FROM board ";
    if (map.get("searchWord") != null){
      query += " WHERE " + map.get("searchField") + " "
              + " LIKE '%" + map.get("searchWord") + "%' ";
    }

//    SELECT COUNT(*) FROM board WHERE title LIKE %겨울%; 이런 시긍로 쿼리문 된다

    try {
      stmt = con.createStatement();
      rs = stmt.executeQuery(query);
      rs.next();
      totalCount = rs.getInt(1);

    }catch (Exception e)  {
      e.printStackTrace();
      System.out.println("selectCount 오류 발생");
    }

    return totalCount;
  }

  /*게시물 수 계산 E*/


  /*게시물 목록 가져오기*/

  public List<BoardDTO> selectList(Map<String, Object>map){
    // 쿼리 결괄르 담을 변수
    List<BoardDTO> bbs = new ArrayList<BoardDTO>();

    // 쿼리문 작성
    String query = "SELECT * FROM board";
    if (map.get("searchWord") != null){
      query += " WHERE " + map.get("searchField") + " "
              + " LIKE '%" + map.get("searchWord") + "%'";
    }
    query += " ORDER BY num DESC";

    try {
      stmt = con.createStatement();
      rs = stmt.executeQuery(query);

      while (rs.next()){
        // 게시물 하나의 내용을 저장
        BoardDTO dto = new BoardDTO();

        dto.setNum(rs.getString("num"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setId(rs.getString("id"));
        dto.setPostdate(rs.getDate("postdate"));
        dto.setVisitcount(rs.getString("visitcount"));

        bbs.add(dto);
      }

    }catch (Exception e)  {
      e.printStackTrace();
      System.out.println("selectList 오류 발생");
    }

    return bbs;
  }
  /*게시물 목록 가져오기 E*/

  /* 목록 출력시 페이징 기능 추가*/
  public List<BoardDTO> selectListPage(Map<String, Object> map){
    List<BoardDTO> bbs = new Vector<BoardDTO>(); // 결과(게시물 목록)를 담을 변수

    // 쿼리문 템플릿
    String query = " SELECT * FROM ( "
            + " SELECT Tb.*, ROWNUM rNUM FROM ( "
            + "     SELECT * FROM board ";

    // 검색 조건 추가
    if (map.get("searchWord") != null){
      query += " WHERE " + map.get("searchField")
              + " LIKE '%" + map.get("searchWord") + "%' ";
    }

    query += "     ORDER BY num DESC "
            + "   ) Tb "
            + " ) "
            + " WHERE rNUM BETWEEN ? AND ?";

    try {
      // 쿼리문 완성
      psmt = con.prepareStatement(query);
      psmt.setString(1,map.get("start").toString());
      psmt.setString(2,map.get("end").toString());

      // 쿼리문 실행
      rs = psmt.executeQuery();

      while (rs.next()){
        // 한 행(게시물 하나)의 데이터를 DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setNum(rs.getString("num"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setPostdate(rs.getDate("postdate"));
        dto.setId(rs.getString("id"));
        dto.setVisitcount(rs.getString("visitcount"));

        // 반환할 결과 목록에 게시물 추가
        bbs.add(dto);
      }
    }
    catch (Exception e){
      System.out.println("게시물 조회 중 예외 발생");
      e.printStackTrace();
    }

    // 목록 반환
    return bbs;
  }


  /* 게시글 작성 */
  public int insertWrite(BoardDTO dto){
    int result = 0;

    try {
      // 쿼리 작성
      String query = "INSERT INTO board ( "
              + "num, title, content, id, visitcount)"
              + " VALUES( "
              + " seq_board_num.nextval, ?,?,?,0)";
      psmt = con.prepareStatement(query);
      psmt.setString(1,dto.getTitle());
      psmt.setString(2,dto.getContent());
      psmt.setString(3,dto.getId());

      result = psmt.executeUpdate();

    }catch (Exception e){
      System.out.println("inserWrite 메소드 오류 발생");
      e.printStackTrace();
    }

  return result;
  }

  public BoardDTO selectView(String num){
    BoardDTO dto = new BoardDTO();

    // 쿼리 작성
    String query = "SELECT B.*, M.name "
            + " FROM board B " + "INNER JOIN member M "
            + " ON B.id = M.id"
            + " WHERE num = ?";
    try {
      psmt = con.prepareStatement(query);
      psmt.setString(1,num);
      rs = psmt.executeQuery();

      if (rs.next()){
        dto.setNum(rs.getString("num"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setId(rs.getString("id"));
        dto.setPostdate(rs.getDate("postdate"));
        dto.setVisitcount(rs.getString("visitcount"));
        dto.setName(rs.getString("name"));
      }
    }catch (Exception e){
      System.out.println("selectView 오류 발생");
      e.printStackTrace();
    }
    return dto;
  }

  public void updateVisitCount(String num){
    String query = "UPDATE board SET "
            + " visitcount=visitcount+1 "
            + " WHERE num=?";

    try {
      psmt = con.prepareStatement(query);
      psmt.setString(1,num);
      rs = psmt.executeQuery();

    }catch (Exception e){
      System.out.println("selectView 오류 발생");
      e.printStackTrace();
    }
  }

  //지정한 게시물을 수정합니다.
  public int updateEdit(BoardDTO dto){
    int result = 0;
    try {
      String query = "UPDATE board SET "
              + " title=?, content=? "
              + " WHERE num=?";

      psmt = con.prepareStatement(query);
      psmt.setString(1,dto.getTitle());
      psmt.setString(2,dto.getContent());
      psmt.setString(3,dto.getNum());

      result = psmt.executeUpdate();
    }
    catch (Exception e){
      System.out.println("게시물 수정 중 예외발생");
      e.printStackTrace();
    }
    return result;
  }


  // 게시글 삭제
  public int deletePost(BoardDTO dto){
    int result = 0;

    // 쿼리문 작성
    String query = "DELETE FROM board WHERE num=?";

    try {
      psmt = con.prepareStatement(query);
      psmt.setString(1,dto.getNum());

      // 쿼리문 실행
      result = psmt.executeUpdate();
    }
    catch (Exception e){
      System.out.println("게시물 삭제 중에 예외 발생");
      e.printStackTrace();
    }
    return result; //
  }
}
