<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	try{
		String sql = "select name from person1004 where id=?";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    rs = pstmt.executeQuery();
	    if (rs.next()) {
	    	String NAME = rs.getString("name");
	    	if(name.equals(NAME)){
	    		sql="delete from person1004 where id=?";
	             pstmt=conn.prepareStatement(sql);
	             pstmt.setString(1, id);
	             pstmt.executeUpdate();
	             %>
	            <script>
	            alert("삭제 완료");
	            location.href="select.jsp"
	            </script>
	            <%
	    	}else{
	    		%>
                <script>
                alert("이름이 일치하지 않습니다.");
                history.back(-1);
                </script>
                <%
	    	}
	    }else{
	    	%>
			<script>
			alert("존재하지않는 id입니다.");
			history.back(-1);
			</script>
			<%
	    }
	}catch(SQLException e){
		System.out.println("삭제 오류 : "+e.getMessage());
	}
%>