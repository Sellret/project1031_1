<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");
	PreparedStatement pstmt=null;
	try{
		String sql = "update person1004 set name=?,dept=?,position=?,duty=?,phone=? where id=?";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,name);
	    pstmt.setString(2,dept);
	    pstmt.setString(3,position);
	    pstmt.setString(4,duty);
	    pstmt.setString(5,phone);
	    pstmt.setString(6,id);
	    pstmt.executeQuery();
	    
	    %>
		<script>
		alert("수정 성공");
		location.href="select.jsp";
		</script>
		
		<%
	}catch(SQLException e){
		System.out.println("수정 오류 : "+e.getMessage());
	}
%>