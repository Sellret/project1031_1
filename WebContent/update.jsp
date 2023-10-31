<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.id.value==""){
	      alert("사번을 입력하세요.");
	      document.frm.id.focus();
	      return false;
	   }
	if(document.frm.name.value==""){
	      alert("이름을 입력하세요.");
	      document.frm.name.focus();
	      return false;
	   }
	if(document.frm.duty.value==""){
	      alert("직책을 입력하세요.");
	      document.frm.duty.focus();
	      return false;
	   }
	if(document.frm.dept.value==""){
	      alert("부서을 입력하세요.");
	      document.frm.dept.focus();
	      return false;
	   }
	document.frm.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 style="text-align: center;">인사관리 사원 수정 화면</h2>
<hr>
<%@ include file="dbcon.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String sql="select * from person1004 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	int no=1;
	if(rs.next()){
		String name=rs.getString("name");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
%>
<form name="frm" method="post" action="updateProcess.jsp">
<table id="tab2" border=1>
<tr>
<th>사원번호</th>
<td><input type="text" name="id" id="in1" value="<%=id %>"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name" id="in1" value="<%=name %>"></td>
</tr>
<tr>
<th>소속부서</th>
<td>
   <select name="dept">
   <option value="인사부" <%if(dept.equals("인사부")){%>selected<%}%>>인사부</option>
   <option value="기획부" <%if(dept.equals("기획부")){%>selected<%}%>>기획부</option>
   <option value="홍보부" <%if(dept.equals("홍보부")){%>selected<%}%>>홍보부</option>
   <option value="영업부" <%if(dept.equals("영업부")){%>selected<%}%>>영업부</option>
   <option value="경리부" <%if(dept.equals("경리부")){%>selected<%}%>>경리부</option>
   </select>
</td>
</tr>
<tr>
<th>직급</th>
<td>
   <select name="position">
   <option value="1" <%if(position.equals("1")){%>selected<%}%>>1급</option>
   <option value="2" <%if(position.equals("2")){%>selected<%}%>>2급</option>
   <option value="3" <%if(position.equals("3")){%>selected<%}%>>3급</option>
   <option value="4" <%if(position.equals("4")){%>selected<%}%>>4급</option>
   </select>
</td>
</tr>
<tr>
<th>직책</th>
<td><input type="text" name="duty" id="in1" value="<%=duty %>"></td>
</tr>
<tr>
<th>연락처</th>
<td><input type="text" name="phone" id="in1" value="<%=phone %>"></td>
</tr>
<tr>
<td colspan=2 id="btgroup">
<input id="btn1" type="button" value="수정" onclick="check()">
<input id="btn1" type="reset" value="취소">
</td>
</tr>
<tr>
</table>
<%
	}
%>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>