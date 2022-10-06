<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test.jsp" method="post">
 		 <input  name="txttk" type="text" value="" placeholder=""><br>
  		 <input name="butt" type="submit" value="Tong">
	</form>
	<%
		String nn = request.getParameter("txttk");
	
		//Nếu chưa tạo biến session
		if(session.getAttribute("ss")==null)
			session.setAttribute("ss", (int) 0);
		
		if(nn!=null){
			int n=Integer.parseInt(nn);
			//B1: Gán biến session cho biến
			int s=(int) session.getAttribute("ss");
			//B2: thay đổi biến
				
				s=s+n;
			//B3: Lưu biến vào session
			session.setAttribute("ss", s);
			out.print("Tong: " + s);
		}
	%>
</body>
</html>