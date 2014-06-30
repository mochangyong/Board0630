<%--<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.regex.Pattern" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트</title>
</head>
<%
request.setCharacterEncoding("UTF-8");
try{
	 String driverName = "oracle.jdbc.driver.OracleDriver";
	 String url = "jdbc:oracle:thin:@127.0.0.1:1522:xe";
	 ResultSet rs = null;
	 Class.forName(driverName);
	 Connection con = DriverManager.getConnection(url,"oraclejava","oraclejava");
	 out.println("Oracle Database Connection Success");
	 Statement stmt = con.createStatement();
	 String sql = "select * from board order by idx desc";
	 rs=stmt.executeQuery(sql);
%>
<body>

<h1 align="center">게시판 목록</h1>
<table border ="1" align ="center">
<tr>
<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
</tr>
<%
while(rs.next()){
	out.print("</tr>");
	out.print("<td>"+rs.getInt(1)+"</td>");
	out.print("<td><a href='./board_cont.jsp?idx="+rs.getInt("idx")+"'>"+rs.getString("title")+"</a></td>");
	out.print("<td>"+rs.getString(3)+"</td>");
	out.print("<td>"+rs.getString(4)+"</td>");
	out.print("<td>"+rs.getInt(5)+"</td>");
	out.print("</tr>");
}
%>
<tr>
<td>
<a href = "./board_write.jsp" >글쓰기</a>
</td>
</tr>

</table>
<%
con.close();
}catch(Exception e ){
	out.println("Oracle Database Connection Something Problem. <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}

%>
</body>
</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">게시판 목록</h1>
<table border ="1" align ="center">
<tr>
<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th>
</tr>
<c:if test="${!empty blist}" >
<c:forEach items="${blist}" var="bb">
<tr>
<td>${bb.idx}</td>
<td><a href ="board_cont.do?idx=${bb.idx}">${bb.title}</a></td>
<td>${bb.name}</td>
<td>${bb.regdate}</td>
<td>${bb.hit}</td>
</tr>
</c:forEach>
</c:if>
<c:if test="${empty blist}">
<tr>
<th>게시물이 없습니다.</th>
</tr>
</c:if>
<tr>
<td>
<a href = "./board_write.do" >글쓰기</a>
</td>
</tr>

</table>
</body>
</html>