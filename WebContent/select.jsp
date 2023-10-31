<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보조회</title>
<%@ include file="css.jsp" %>
</head>
<body>
<%@ include file="dbcon.jsp" %>

<table border="1">
  <thead>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<h2 style="text-align: center;">직원 정보 조회</h2>
    <tr>
      <th>No</th>
      <th>성명</th>
      <th>사번</th>
      <th>직급</th>
      <th>직책</th>
      <th>연락처</th>
      <th>소속부서</th>
      <th>비고</th>
    </tr>
  </thead>
  <tbody>
    <%
      request.setCharacterEncoding("UTF-8");
      ResultSet rs = null;
      PreparedStatement pstmt = null;
      try {
        String sql = "select * from person1004";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        int No = 1; // No 컬럼 값을 표시하기 위한 변수
        while (rs.next()) {
          String id = rs.getString("id");
          String name = rs.getString("name");
          String dept = rs.getString("dept");
          String position = rs.getString("position");
          String duty = rs.getString("duty");
          String phone = rs.getString("phone");
    %>
    <tr>
      <td><%=No%></td>
      <td><%=name %></td>
      <td><a href="update.jsp?id=<%=id %>"><%=id %></a></td>
      <td><%=position %></td>
      <td><%=duty %></td>
      <td><%=phone %></td>
      <td><%=dept %></td>
      <td><a href="update.jsp?id=<%=id%>">수정</a>/
            <a href="deleteProcess.jsp?id=<%=id%>&name=<%=name%>"
            onclick="if (!confirm('정말로 삭제하시겠습니까?'))
            return false;">삭제</a></td>
    </tr>
    <%
        No++;
        }
      } catch (SQLException e) {
        System.out.println("db 읽기 에러 : " + e.getMessage());
      }
    %>
  </tbody>
</table>
<%@ include file="footer.jsp" %>
 </body>
</html>