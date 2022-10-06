<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int k = 0;
		String n = request.getParameter("value");
		int isNumber = 0;
		String output = new String();
		
		if(n!= null){
			try {  
			    k = Integer.parseInt(n);  
			    isNumber = 1;
			  } catch(NumberFormatException e){  
			    isNumber = 0;
			    output = "Không thể hiển thị vì không phải là số!";
			  }  
		}
		if(n==null){
			n = "";
		}

	%>
	<form action="BangCuuChuong.jsp" method="post">
		<input type="text" placeholder="Nhap n" name="value" value="<%=n %>">
		<button type="submit">Hiển thị</button>
	</form>
	<%if  (isNumber ==1){%>
	<table border="1px">
		<%for(int i=1; i<=10; i++){ %>
			<tr><td>
			 	<%=k %>x<%=i %>=<%=k*i %>	
			</td></tr>
		<%} %>
	</table>
	<%} else {%>
		<span><%=output %></span>
	<%} %>
	
</body>
</html>