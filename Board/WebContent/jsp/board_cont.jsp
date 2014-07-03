<%-- <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
 //int idx = Integer.parseInt(request.getParameter("idx"));
	String idx = request.getParameter("idx");
try{
	String driverName="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@127.0.0.1:1522:xe";
	String uid="oraclejava";
	String upw="oraclejava";
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,uid,upw);
	//Statement stmt = con.createStatement();
	String sql ="select * from board where idx = ? ";
	//String sql ="select * from board where idx =" +idx;
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, idx);
	rs=pstmt.executeQuery();
	
	while(rs.next()){

%>
<body>
<h1 align = "center">게시글 조회</h1>
<table align="center" border="1">
<tr>
<th>번호</th><td><%=rs.getInt("idx") %></td><th>작성자</th><td><%=rs.getString("name") %></td><th>날짜</th><td><%=rs.getString("regdate") %></td><th>조회수</th><td><%=rs.getString("hit") %></td>
</tr>
<tr>
<th colspan="2">제목</th>
<td colspan ="6"><%=rs.getString("title") %></td>
</tr>
<tr>
<th colspan="2">내용</th>
<td colspan ="6"><%=rs.getString("cont") %></td>

</tr>
<tr>
<td colspan="8">
<a href="board_delete.jsp?idx=<%=rs.getString("idx")%>">게시글삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="board_edite.jsp?idx=<%=rs.getString("idx")%>">게시글수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href ="./board_list.jsp">목록으로</a>
</table>
<%
	}
con.close();
	}catch(Exception e ){
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}



%>
</body>
</html>--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 
 String idx = request.getParameter("idx");
	try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1522:xe";
	String uid = "oraclejava";
	String upw = "oraclejava";
	ResultSet rs = null;
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,uid,upw);
	Statement stmt = con.createStatement();
	String  sql = "select * from board where idx ="+idx;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		request.setAttribute("idx", rs.getString("idx"));
		request.setAttribute("name", rs.getString("name"));
		request.setAttribute("regdate", rs.getString("regdate"));
		request.setAttribute("hit", rs.getString("hit"));
		request.setAttribute("title", rs.getString("title"));
		request.setAttribute("cont", rs.getString("cont"));
		
	}
	con.close();
	}catch(Exception e){
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	 -->

<body>
	<h1 align="center">게시글 조회</h1>
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<td>${bcont.idx}</td>
			<th>작성자</th>
			<td>${bcont.name}</td>
			<th>날짜</th>
			<td>${bcont.regdate}</td>
			<th>조회수</th>
			<td>${bcont.hit}</td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6">${bcont.title}</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6">${bcont.cont}</td>

		</tr>
		<tr>
			<td colspan="8"><a href="board_delete.do?idx=${bcont.idx}">게시글삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="board_edit.do?idx=${bcont.idx}">게시글수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="./board_list.do">목록으로</a>
	</table>

</body>
</html>




