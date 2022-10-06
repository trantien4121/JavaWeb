<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  	<table>
		<tr>
			<td>
				<a href="tt.jsp?masv=sv1">Nguyễn Văn Tèo</a>	<hr>
				<a href="tt.jsp?masv=sv2">Lê Văn Tý</a>	<hr>
				<a href="tt.jsp?masv=sv3">Quách Mộng Mơ</a>	<hr>
			</td>
			<td>
				Thông tin sinh viên là:
			</td>
		</tr>
	</table>	-->
	 <table>
      <tr>
        <td>
           <a href="vdRequest.jsp?masv=sv1"> Nguyễn văn Tèo </a> <hr>
            <a href="vdRequest.jsp?masv=sv2"> Lê Văn Tý </a> <hr>
            <a href="vdRequest.jsp?masv=sv3"> Quách Mộng Mơ </a> <hr>
        </td>
        <td>
         <%String masv=request.getParameter("masv");
         if(masv==null)
        	 out.print("Ban chay dau tien");
         else
		  if(masv.equals("sv1"))
			  out.print("Thong tin cua sv: Nguyen Van Teo");
		  else
			  if(masv.equals("sv2"))
				  out.print("Thong tin cua sv: Le Van Ty");
			  else
				  out.print("Thong tin cua sv: Mong Mo");
%>
        </td>
        </tr>
         
          
   </table>
	
</body>
</html>