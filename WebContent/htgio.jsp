<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.giohangbean"%>
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
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
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
                <%if(session.getAttribute("dn")==null){ %>
                <a href="#" style="color: #fff">
                   <i class="fa fa-user" aria-hidden="true"></i> Register
                </a>
                <%}%>
            </li>
            <li>
                <%if(session.getAttribute("dn")==null){ %>
                <a href="dangnhap.jsp" style="color: #fff;text-decoration: none;">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
                    
                </a>
                <%}else{ %>
                <a href="#" style="color: #fff;text-decoration: none;">
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
      <td width="800" valign="top" class="pr-4"> <span style="font-weight: 700">Hiển thị sách</span>
      	<table class="table table-hover mt-2 ">
      		<% 
      			giohangbo gh=
           		(giohangbo)session.getAttribute("gio"); 
           	%>
      		
      		<%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){%>
      		<thead>
      			<tr>
      				<th>Mã sách</th>
                	<th>Tên sách</th>
                	<th>Giá</th>
                	<th class="pl-5">Số lượng</th>
                	<th>Thành tiền</th>
                	<th>&nbsp;</th>
      			</tr>
      		</thead>
      		<% }%>
      		
      		<%  
      			if(gh!=null){
      	  		for(giohangbean s: gh.ds){
      		%>
      		
      		<tbody>
      			<tr>
          			<td> <%=s.getMasach() 	%> </td>
           			<td> <%=s.getTensach() 	%> </td>
           			<td> <%=s.getGia() 		%> </td>
           			<td width="190">
           				
           				<% 
           				String btncong = request.getParameter("btncong" + s.getMasach());
           				String btntru = request.getParameter("btntru" + s.getMasach());
           				
           				if (btncong!= null)
           					s.setSoluong(s.getSoluong() + 1);
           				
           				if (btntru!= null && s.getSoluong()> 0)
           						s.setSoluong(s.getSoluong() - 1);
           				%>
           				
           				<!--  <script>
           					$(".quantity").change(function(){
           					})
           				</script> -->
           				
           				<form action="htgio.jsp" class="input-group pl-4 pr-4">
           					<div class="input-group-prepend">
           						<button class="btn btn-danger" type="submit" name="btntru<%=s.getMasach()%>">-</button>
           					</div>
           					<input type="tel" class="form-control quantity" value="<%=s.getSoluong()%>" style="text-align: center"/>
           					<div class="input-group-append">
           						<button class="btn btn-success" type="submit" name="btncong<%=s.getMasach()%>">+</button>
           					</div>
           				</form>
           			
           			</td>
           			<td> <%=s.getThanhtien()%> </td>
           			<td>
            			<!--  <a href="" class="ml-2" style="text-decoration: none; color= #7B68EE; font-size: 20px" >
            				<i class="fa fa-pencil-square" aria-hidden="true"></i>
             			</a> -->
             			<a href="xoamotsach.jsp?msx=<%=s.getMasach()%>" style="text-decoration: none; color: red; font-size: 20px">
            				<i class="fa fa-trash" aria-hidden="true"></i>
             			</a>
            		</td>
      		<%} }%>	
      		<%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){ %>
      			</tr>
      			<tr>
      				<td></td>
      				<td></td>
      				<td></td>
      				<td>
      					<span class="pl-5">
      						<b>Tổng tiền: </b>
      					</span>
      					
      				</td>
      				<td>
      					<input type="text" class="pb-1 pt-1" value="<%=gh.Tongtien()%>" disabled size="8"/>
      				</td>
      				<td>
      					<a href="xoatatcasach.jsp?sls=<%=gh.Tongtien() %>" class="btn btn-danger">
            				<i class="fa fa-trash" aria-hidden="true" style="color: white;"></i> 
            				<span class="ml-1" style="color: white">Xóa tất cả</span>
      					</a>
      				</td>
      			</tr>
      		<% }%>
      		</tbody>
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
</body>
</html>
