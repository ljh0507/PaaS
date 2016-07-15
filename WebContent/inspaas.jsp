<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="test.db.DBconnection" %>
<%
	String patnm = request.getParameter("patnm");
	String pid = request.getParameter("pid");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	String memo = request.getParameter("memo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "insert into patinfo values(?,?,?,?,?)";
	
	try{
		conn = DBconnection.getCon();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, patnm);
		pstmt.setString(2, pid);
		pstmt.setString(3, phone);
		pstmt.setString(4, addr);
		pstmt.setString(5, memo);
		
		pstmt.executeUpdate();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>
<script type="text/javascript">
	alert("정상입력");
	location.href="../index.html";
</script>
</body>
</html>