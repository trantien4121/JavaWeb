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
	String maSV = request.getParameter("masv");
	String name = new String();
	
	switch(maSV){
		case "sv1":
			name = "Nguyễn Văn Tèo";
			break;
		case "sv2":
			name = "Lê Văn Tý";
			break;
		case "sv3":
			name = "Quách mộng mơ";
			break;
	}
%>
	Thông tin sinh viên là: <%=name%>
</body>
</html>