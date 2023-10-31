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
<h2 style="text-align: center;">인사관리 사원 등록 화면</h2>
<hr>
<form name="frm" method="post" action="insertProcess.jsp">
<table id="tab2" border=1>
<tr>
<th>사원번호</th>
<%@ include file="dbcon.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	String sql="select max(id) from person1004";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=1;
	if(rs.next()){
		no=rs.getInt(1)+1;
	}else{
		no=1;
	}
%>
<td><input type="text" name="id" id="in1" value="<%=no %>"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name" id="in1"></td>
</tr>
<tr>
<th>소속부서</th>
<td>
   <select name="dept">
   <option value="인사부" selected>인사부</option>
   <option value="기획부" selected>기획부</option>
   <option value="홍보부" selected>홍보부</option>
   <option value="영업부" selected>영업부</option>
   <option value="경리부" selected>경리부</option>
   </select>
</td>
</tr>
<tr>
<th>직급</th>
<td>
   <select name="position">
   <option value="1" selected>1급</option>
   <option value="2">2급</option>
   <option value="3">3급</option>
   <option value="4">4급</option>
   </select>
</td>
</tr>
<tr>
<th>직책</th>
<td><input type="text" name="duty" id="in1"></td>
</tr>
<tr>
<th>연락처</th>
<td><input type="text" name="phone" id="in1"></td>
</tr>
<tr>
<td colspan=2 id="btgroup">
<input id="btn1" type="button" value="등록" onclick="check()">
<input id="btn1" type="reset" value="취소">
</td>
</tr>
<tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>