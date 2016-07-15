<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>PaaS</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="test.db.DBconnection" %>
<h2>환자조회</h2>
<table>
	<tr>
		<td colspan="2" align="left">
		<input type="button" name="btn1" value="main" onclick="javascript:location.href='index.html';"/>		
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td>이름</td>
		<td>환자번호</td>
		<td>휴대폰</td>
		<td>주소</td>
		<td>메모</td>
		<td>삭제</td>
		<td>수정</td>
	</tr>	


<%
   Connection conn = null;
   conn =	DBconnection.getCon();
   Statement stmt = conn.createStatement();
   
   String SQL = "select * from patinfo";
   ResultSet rs = stmt.executeQuery(SQL);
   
   try{   
	   while(rs.next()){
		   
		   String patnm = rs.getString("patnm");
		   String pid = rs.getString("pid");
		   String phone = rs.getString("phone");
		   String addr = rs.getString("addr");
		   String memo = rs.getString("memo");
	   
	%>
		<tr>
			<td><%=patnm %></td>
			<td><%=pid %></td>
			<td><%=phone %></td>
			<td><%=addr %></td>
			<td><%=memo %></td>
			<td><a href="delpaas.jsp?pid=<%=pid%>">삭제</a></td>
			<td><a href="updpaas.jsp?pid=<%=pid%>">수정</a></td>
		</tr>
		
<%
		}
   }catch(SQLException se){
	   System.out.println(se.getMessage());
   }finally{
	   try{
		   if(rs!=null) rs.close();
		   if(stmt!=null) stmt.close();
		   if(conn!=null) conn.close();
	   }catch(SQLException se){
		   System.out.println(se.getMessage());
	   }
   }
%>
	
</table>
</body>
</html>