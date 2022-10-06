<%@page import="bo.giohangbo"%>
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
		giohangbo gh=(giohangbo)session.getAttribute("gio");
		String masachxoa = request.getParameter("msx");
		try{
			gh.xoaMotSach(masachxoa);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("htgio.jsp");
		
	%>
</body>
</html>