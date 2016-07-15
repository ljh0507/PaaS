<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="test.db.DBconnection" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String pid = request.getParameter("pid");
	
	try{
		conn = DBconnection.getCon();
		String sql = "delete from patinfo where pid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pid);
		
		pstmt.executeUpdate();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	response.sendRedirect("paas.jsp");
%>
</body>
</html>