<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");
	PreparedStatement pstmt=null;
	try {
		String sql = "insert into  person1004 values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
	    pstmt.setString(2, name);
	    pstmt.setString(3, dept);
	    pstmt.setString(4, position);
	    pstmt.setString(5, duty);
	    pstmt.setString(6, phone);
	    pstmt.executeUpdate();
	    %>
	    <script>
	        alert("저장성공");
	        location.href="select.jsp";
	    </script>
	    <%
	}catch(SQLException e){
		System.out.println("입력 실패 : " + e.getMessage());
	}
%>