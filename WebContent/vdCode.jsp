<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <table border="1px">
		<%for(int i=1; i<=100; i++){ %>
			<!-- Xin chào lần thứ <%=i %> <hr> -->
			<tr><td>
			 	9x<%=i %>=<%=i*9 %>	
			</td></tr>
		<%} %>
	</table>	 -->
	
	<table border="1px">
		<%for(int i=1; i<=10; i++){
			out.print("<tr><td>9x"+ i +" = " + (9*i) + "</td></tr>");
		} %>
	</table>
</body>
</html>