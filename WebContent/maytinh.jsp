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
	//String a = request.getParameter("a");
	//String b= request.getParameter("b");
	//String kq = request.getParameter("kq"); 
	
	/*long ketqua = 0;
	long gta = 0;
	long gtb = 0;
		if(kq!=null && a!=null && b!=null){
			gta = Long.parseLong(a);
			gtb = Long.parseLong(b);
			ketqua =Long.parseLong(kq);
		}*/
		long a=0; 
		long b=0; 
		long kq=0;
		if(request.getAttribute("aa")!=null){
			a = (long)request.getAttribute("aa");
			b = (long)request.getAttribute("bb");
			kq = (long)request.getAttribute("kq");
		}
		
	%>
	<form action="test" method="post">
       a= <input name="txta" type="number" value="<%=a%>"> <br>
       b= <input name="txtb" type="number" value="<%=b%>"> <br>
       ketqua= <input name="txtkq" type="number" value="<%=kq%>"> <br>
       
       <input name="butc" type="submit" value="+"> 
       <input name="butt" type="submit" value="-">
       <input name="butn" type="submit" value="*">
       <input name="butchia" type="submit" value="/">
    </form>
</body>
</html>