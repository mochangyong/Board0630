<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="board_insert.do" method="post" onsubmit="return formcheck();">
			<table border="1" align="center">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" size="14" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" size="14" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="8" cols="36" name="cont"></textarea></td>
				</tr>
				<%-- <tr>
					<th>날짜</th>
					<td><input type="text" name="regdate" size="14" /></td>
				</tr>--%>
			</table>
			<div align="center">
				<input type="submit" value="저장">
			</div>
		</form>
		<script>
			function formcheck(){
				var title = document.forms[0].title.value;
				var name = document.forms[0].name.value;
				var cont = document.forms[0].cont.value;
			
				
				if(title == null || title == ""){
					alert("제목을 입력하세요");
					document.forms[0].title.focus();
					return false;
				}
				if(name == null || name == ""){
					alert("이름을 입력하세요");
					document.forms[0].name.focus();
					return false;
				}
				if(cont == null || cont == ""){
					alert("내용을 입력하세요");
					document.forms[0].cont.focus();
					return false;
				}
				
			}
			//alert(document.forms[0].title.name);
		</script>
	</div>
</body>
</html>