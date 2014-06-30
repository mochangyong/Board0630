<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
 String idx = request.getParameter("idx");
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1522:xe";
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"oraclejava","oraclejava");
	out.println("Oracle Database Connection Success.");
	Statement stmt = con.createStatement();
	String sql="delete from board where idx =" + idx ;
	//PreparedStatement pstmt = con.prepareStatement(sql);
	//pstmt.setString(1, idx);
	stmt.executeUpdate(sql);
	con.close();
	
}catch(Exception e){
	out.println("Oracle Database Connection Something Problem. <hr>");         
	out.println(e.getMessage());         
	e.printStackTrace();
}

%>
<script>
alert("게시글이 삭제 되었습니다.");
location.href="board_list.jsp";
</script>
<body>

</body>

</html>