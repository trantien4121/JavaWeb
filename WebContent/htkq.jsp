<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String ngay = request.getParameter("sngay");
	String thang = request.getParameter("sthang");
	String nam = request.getParameter("snam");
	Random r= new Random();
%>
	Ket qua xo so ngay: <%=ngay %> / <%=thang %> / <%=nam %>
	<hr>
	Giai 8: <%=r.nextInt(100) %>
</body>
</html>