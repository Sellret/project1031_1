<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.name.value==""){
		  alert("이름을 입력하세요.");
	      document.frm.name.focus();
	      return false;
	   }
	if(document.frm.id.value==""){
	      alert("사번을 입력하세요.");
	      document.frm.id.focus();
	      return false;
	   }
	document.frm.submit();
}
</script>

<%@ include file = "dbcon.jsp" %>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>
<h2 style="text-align: center;">인사관리 퇴사처리 화면</h2>
<hr>
<form name="frm" method="post" action="deleteProcess.jsp">
<table id="tab3" border=1>
<tr>
<th>성명</th>
<td><input type="text" name="name"></td>
</tr>
<th>사원번호</th>
<td><input type="text" name="id" id="in1"></td>
</tr>
<tr>
<td colspan=2 id="btgroup">
<input id="btn1" type="button" value="삭제" onclick="check()">
<input id="btn1" type="reset" value="취소">
</td>
</tr>
</table>
</form>
</section>
</body>
<%@ include file = "footer.jsp" %>
</section>
</body>
</html>