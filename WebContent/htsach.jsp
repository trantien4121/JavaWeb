<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
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
	<title>MT Store</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #7B68EE">
    	<a class="navbar-brand ml-5" href="#" style="color: #fff; font-weight: 700;">MT Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link ml-3" href="htsach.jsp" style="color: #fff;"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link ml-3" href="htgio.jsp" style="color: #fff"> <i class="fa fa-cart-plus" aria-hidden="true"></i> Giỏ hàng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-money" aria-hidden="true"></i> Thanh toán</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-history" aria-hidden="true"></i> Lịch sử mua</a>
              </li>
          </ul>
          <ul class="navbar-nav mr-5">
            <li class="mr-3">
               <!--   <a href="#" style="color: #fff">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>	-->
                <%if(session.getAttribute("dn")==null){ %>
                <a href="#" style="color: #fff;text-decoration: none;">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>
                <%}%>
            </li>
            <li>
                <%if(session.getAttribute("dn")==null){ %>
                <a href="dangnhap.jsp" style="color: #fff; text-decoration: none;" >
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
                </a>
                <%}else{ %>
                <a href="#" style="color: #fff;text-decoration: none;" class="drop-down">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                    <%=session.getAttribute("dn")%>
                </a>
                <a href="dangxuat.jsp" class="ml-3" style="color: #fff;text-decoration: none;" class="drop-down">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </a>
                <% }%>
            </li>
          </ul>
        </div>
    </nav>
<table width="1200" align="center" class="mt-3">
   <tr>
      <td width="200" valign="top"> <span style="font-weight: 700">Loại sách</span>
      	<table>
      		<%loaibo lbo=new loaibo();
        		ArrayList<loaibean> dsloai=lbo.getLoai();
        		for(loaibean l: dsloai){
      		%>
          	<tr>
           		<td>
            		<a href="htsach.jsp?ml=<%=l.getMaloai()%>"> 
              		<%=l.getTenloai() %>
             		</a>
          		</td>
          </tr>
          		<%} %>
       	</table>
       </td>
      <td width="800" valign="top"> <span style="font-weight: 700">Hiển thị sách</span>
      	<table class="mt-2">
      		<%
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");

      sachbo sbo=new sachbo();
        ArrayList<sachbean> dssach=sbo.getSach();
        String ml=request.getParameter("ml");
        String key=request.getParameter("txttk");
        if(ml!=null)
        	dssach=sbo.TimMa(ml);
        else
        	if(key!=null)
        		dssach=sbo.Tim(key);
        
        int n=dssach.size();
        for(int i=0;i<n;i++){
        	sachbean s=dssach.get(i);
       %>
         <tr>
         <td class="pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"><br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %>.000 đ<br>
            
			 <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
            
         </td>
         <%i++;
         if(i<n){
         s=dssach.get(i);%>
         <td class="pr-5 pl-5 pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"> <br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %>.000 đ <br>
            
            <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
            
         </td>
         <%} %>
         <%i++;
         if(i<n){
         s=dssach.get(i);%>
         <td class="pb-5">
            <img src="<%=s.getAnh() %>" width="200px" height="200px" class="mb-1"> <br>
            <%=s.getTensach() %> <br>
            Tác giả: <%=s.getTacgia() %> <br>
            Giá: <%=s.getGia() %>.000 đ <br>
            
			 <%if (session.getAttribute("dn")!=null) {%>		
            	<a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>">
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}else{ %>
            	<a href="" onclick=buyFailed()>
            		<img src="buynow.jpg" class="mt-2"> <br>
            	</a>
            <%}%>
			
         </td>
         <%} %>
         </tr>
       <%} %>
      		
       	</table>
      </td>
      <td width="200" valign="top"> <span style="font-weight: 700">Tìm kiếm</span>
      	<form action="htsach.jsp" method="post" class="form-group pt-1">
 		 <input  name="txttk" type="text" value="" placeholder="Nhập thông tin sách" class="form-control"><br>
  		 <input name="butt" type="submit" value="Search" class="btn btn-success" style="margin-top: -10px">
		</form>
      	
      </td>
   </tr>

</table>
	<script>
		function buyFailed(){
            alert("Bạn cần đăng nhập để mua hàng")
        }
	</script>
</body>
</html>
