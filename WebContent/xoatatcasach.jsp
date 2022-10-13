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
		String sl = request.getParameter("sls");
		if (sl!=null){
			gh.xoaTatCa();
		}
		session.setAttribute("gio", gh);
		if(gh.ds.size()!=0)
			response.sendRedirect("htgio.jsp");
			else
				response.sendRedirect("htsach.jsp");
	%>
</body>
</html>