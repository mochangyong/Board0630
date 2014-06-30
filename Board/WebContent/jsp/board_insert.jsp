<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int idx= 0;
String title = request.getParameter("title");
String name = request.getParameter("name");
String cont = request.getParameter("cont");
String regdate = request.getParameter("regdate");
int hit = 0;

if(title ==""||title==null) out.println("title이 null입니다.");
if(name ==""||name==null) out.println("name이 null입니다.");
if(regdate ==""||regdate==null) out.println("regdate이 null입니다.");
else if(!Pattern.matches("^[0-9*$]",regdate))
	out.println("숫자 형식이 아닙니다.");
if(cont ==""||cont==null) out.println("cont이 null입니다.");
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@127.0.0.1:1522:xe";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"oraclejava","oraclejava");
	out.println("Oracle 데이터베이스 db에 성공적으로 접속 했습니다.");
	Statement stmt =con.createStatement();
	String sql ="insert into board (idx , title , name , cont, hit , regdate ) "
					+"values( board_seq.nextval ,'"+title+"', '"+name+"','"+cont+"','"+hit+"',sysdate)";	
	stmt.executeUpdate(sql);
	con.close();
			
}catch (Exception e){
	out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다.<hr>");
	out.println(e.getMessage());
	
	e.printStackTrace();
}finally{
	out.println("<script>location.href='board_list.jsp';</script>");
}

%>
</body>
</html>