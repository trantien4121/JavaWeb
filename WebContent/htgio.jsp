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
<style>
.nav-item{
	position: relative
}
.header__cart-notice{
	position: absolute;
    top: 0px;
    right: 70px;
    padding: 1px 5px;
    font-size: 0.6rem;
    /* line-height: 1rem; */
    border: 2px solid #7B6BEE;
    border-radius: 50%;
    background-color: #fff;
    color: #7B68EE;
}
.tbd{
	position: relative;
}
.btn-clear-selection{
	position: absolute;
	top: 40px;
	right: 272px;
}

</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #7B68EE">
    	<a class="navbar-brand ml-5" href="#" style="color: #fff; font-weight: 700;">MT Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link ml-3" href="htsachservlet" style="color: #fff;"><i class="fa fa-home" aria-hidden="true"></i> Trang ch??? <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link ml-3" href="htgioservlet" style="color: #fff"> 
              	<i class="fa fa-cart-plus mr-2" aria-hidden="true"></i> <span>Gi??? h??ng</span>
              	<% 
              		giohangbo gh=(giohangbo)session.getAttribute("gio");
              		if(session.getAttribute("gio")!=null && gh.ds.size()!=0){
              	%>
              		<span class="header__cart-notice"><%=gh.ds.size()%></span>
              	<%} %>
              </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-money" aria-hidden="true"></i> Thanh to??n</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ml-3" href="#" style="color: #fff"> <i class="fa fa-history" aria-hidden="true"></i> L???ch s??? mua</a>
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
<table width="1200" align="center" class="mt-3 tbd">
   <tr>
      <td width="200" valign="top"> <span style="font-weight: 700">Lo???i s??ch</span>
      	<table>
      		<%
      			ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
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
      <td width="800" valign="top" class="pr-4"> <span style="font-weight: 700">Hi???n th??? s??ch</span>
      	<table class="table table-hover mt-2">
      		<% 
      			/*giohangbo gh=
           		(giohangbo)session.getAttribute("gio"); */
           	%>
      		
      		<%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){%>
      		<thead>
      			<tr>
      				<th>Ch???n</th>
      				<th>M?? s??ch</th>
                	<th>T??n s??ch</th>
                	<th>Gi??</th>
                	<th class="pl-5">S??? l?????ng</th>
                	<th>Th??nh ti???n</th>
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
      			<form action="htgioservlet" method="post" class="input-group pl-4 pr-4"> 	<!-- B???t ?????u form s???a x??a -->   
      				<td><input type="checkbox" name="check" value="<%=s.getMasach() %>" /></td>
          			<td> <%=s.getMasach() 	%> </td>
           			<td> <%=s.getTensach() 	%> </td>
           			<td> <%=s.getGia() 		%> </td>
           			<td width="150px">
           				
           				<input type="number" name="txtsl-<%=s.getMasach() %>" value ="<%=s.getSoluong()%>" min=0 class="form-control">
           				  
           			</td>
           			<td> <%=s.getThanhtien()%> </td>
           			<td>
             			<!-- <button type="submit" class="btn btn-info pr-2" name="butsua" value ="Update">
							Update
						</button>
           				<button type="submit" class="btn btn-danger" name="butxoa" value ="Delete">
           					<i class="fa fa-trash" aria-hidden="true"></i>
           				</button> --> <!-- But tu thiet ke, tuong ung voi phan sua xoa da comment -->
           				
           				 <button name="butsua" value="<%=s.getMasach() %>" class="btn btn-info" type="submit">
           					Update
           				</button>
           	 			<button name="butxoa" value="<%=s.getMasach() %>" class="btn btn-danger" type="submit">
           					<i class="fa fa-trash" aria-hidden="true"></i>
           				</button>
           				
            		</td>
            		
      		<%} }%>	
      				<%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){ %>
      					<!-- N??t x??a c??c s???n ph???m c?? check -->
      					<button type=submit class="btn btn-clear-selection">
            				<i class="fa fa-trash" aria-hidden="true" style="color: red; font-size: 18px"></i>
            			</button>    
            		<%} %> 
      			
      			</tr>
      		<%if(session.getAttribute("gio")!=null && gh.ds.size()!=0){ %>
      			
      			<tr>
      				<td></td>
      				<td></td>
      				<td></td>
      				<td></td>
      				<td class="pl-5 pt-3">
      					<span>
      						<b>T???ng ti???n: </b>
      					</span>
      					
      				</td>
      				<td>
      					<input type="text" class="pb-1 pt-1" value="<%=gh.Tongtien()%>" disabled size="8"/>
      				</td>
      				<td>
      					<%-- <a href="xoatatcasach.jsp?sls=<%=gh.Tongtien() %>" class="btn btn-danger">
            				<i class="fa fa-trash" aria-hidden="true" style="color: white;"></i> 
            				<span class="ml-1" style="color: white">X??a t???t c???</span>
      					</a>  --%>    <!-- ??o???n code ch???y tr??n xoatatca.jsp  -->
      					
      					<button type="submit" name="butxoatatca" value="<%=gh.Tongtien() %>" class="btn btn-danger">
            				<i class="fa fa-trash" aria-hidden="true" style="color: white;"></i> 
            				<span class="ml-1" style="color: white">X??a t???t c???</span>
      					</button> 
      				</td>
      			</tr>
      			</form> <!-- K???t th??c form s???a x??a -->   
      		<% }%>
      		</tbody>
      	</table>
      </td>
      <td width="200" valign="top"> <span style="font-weight: 700">T??m ki???m</span>
      	<form action="htsach.jsp" method="post" class="form-group pt-1">
 		 <input  name="txttk" type="text" value="" placeholder="Nh???p th??ng tin s??ch" class="form-control"><br>
  		 <input name="butt" type="submit" value="Search" class="btn btn-success" style="margin-top: -10px">
		</form>
      	
      </td>
   </tr>

</table>
</body>
</html>

