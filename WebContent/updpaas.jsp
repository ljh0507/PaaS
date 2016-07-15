<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>UPDATE</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="test.db.DBconnection" %>

<%
	String pid = request.getParameter("pid");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		conn = DBconnection.getCon();
		String sql = "select * from patinfo where pid = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pid);
		rs = pstmt.executeQuery();		
		
		while(rs.next()){
		String patnm = rs.getString("patnm");
		String phone = rs.getString("phone");
		String addr = rs.getString("addr");
		String memo = rs.getString("memo");
%>

<form name='frm1' method='post' action='updateexe.jsp'>
<table>
	<tr>	
		<td>이름</td>
		<td><input type = "text" name="patnm" value="<%=patnm %>"/></td>
	</tr>	
		
	<tr>	
		<td>환자번호</td>
		<td><input type = "text" name="pid" value="<%=pid %>" readonly/></td>
	</tr>
	
	<tr>	
		<td>핸드폰</td>
		<td><input type = "text" name="phone" value="<%=phone %>"/></td>
	</tr>
	
	<tr>	
		<td>주소</td>
		<td><input type = "text" name="addr" value="<%=addr %>"/></td>
	</tr>
	
	<tr>	
		<td>메모</td>
		<td><input type = "text" name="memo" value="<%=memo %>"/></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" name="btn1" value="저장" onclick="javascript:frm1.submit();"/>
		<input type="button" name="btn2" value="목록" onclick="javascript:location.href='paas.jsp';"/>
	</tr>
</table>
</form>

<%
		}
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
%>


<script type="text/javascript">
	function update(){
		document.frm1.submit();
	}
	function list(){
		location.href="paas.jsp";
	}
</script>
</body>
</html>