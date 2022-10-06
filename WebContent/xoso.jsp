<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xo so kien thiet</title>
</head>
<body>
	<%Calendar c= Calendar.getInstance(); 
		int ngay = c.get(Calendar.DAY_OF_MONTH);
		int thang = c.get(Calendar.MONTH)+1;
		int nam = c.get(Calendar.YEAR);
	%>
	Hom nay, ngay <%=ngay%> thang <%=thang%> nam <%=nam%>
	<form action="htkq.jsp" method="post">
		Chon Ngay:
		<select name="sngay">
			<%for(int i=1; i<=31; i++) {%>
				<option <%=(ngay==i?"selected":"") %>> <%=i %></option>
			<% } %>
		</select> 
		Chon thang:
		<select name="sthang">
			<%for(int i=1; i<=12; i++) {%>
				<option <%=(thang==i?"selected":"") %> value="<%=i*i %>" ><%=i %></option>
			<% } %>
		</select>
		Chon nam:
		<select name="snam">
			<%for(int i=nam-10; i<=nam; i++) {%>
				<option <%=(nam==i?"selected":"") %>><%=i %></option>
			<% } %>
		</select>
		<button name="but1" type="submit">Xem ket qua</button>
	</form >
</body>
</html>