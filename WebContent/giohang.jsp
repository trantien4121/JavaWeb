<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Gio Hang</title>
</head>
<body>

	<% 
		String masach = request.getParameter("ms");
		String tensach = request.getParameter("ts");
		long gia = Long.parseLong(request.getParameter("gia"));
		giohangbo gh = null;
		//Neu mua hang lan dau
		if(session.getAttribute("gio")==null){
			gh = new giohangbo();	//Cap vung nho		
			session.setAttribute("gio", gh);	//Tao session
		}
		//b1: Luu session ra bien
		gh = (giohangbo)session.getAttribute("gio");
		//b2: Thao tac tren bien
		gh.them(masach, tensach, gia, (long)1);
		//b3: Luu bien vao session
		session.setAttribute("gio", gh);
		
		//Hien Thi hang
		response.sendRedirect("htgio.jsp");
	%>

</body>
</html>
