<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.giohangbean"%>
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
	/*String ms = request.getParameter("ms");
	giohangbo gh = (giohangbo) session.getAttribute("gio");
	if (request.getParameter("butsua") != null) {
		long sl = Long.parseLong(request.getParameter("txtsl"));
		gh.CapnhapCart(ms, sl);
	} else {
		gh.xoaMotSach(ms);
	}
	session.setAttribute("gio", gh);
	if (gh.ds.size() != 0)
		response.sendRedirect("htgio.jsp");
	else
		response.sendRedirect("htsach.jsp");*/
		giohangbo gh = (giohangbo) session.getAttribute("gio");
			
		ArrayList<String> lstDieuKien = new ArrayList<>();
		ArrayList<String> lstGiaTri = new ArrayList<>();
		  
		Enumeration<String> d= request.getParameterNames();
		   while(d.hasMoreElements()){
			   String tendk=d.nextElement();
			   if(request.getParameter(tendk)!=null){	//tendk: check, txtsl, butsua/butxoa
			   	lstDieuKien.add(tendk);
				String gt=request.getParameter(tendk);	//gt: s1, 1, update/delete
				lstGiaTri.add(gt);
			   }
		   }
		   	/*for (String dk: lstDieuKien)
				   out.print(dk + "<br>");
			out.print("<hr>");
			for (String gt: lstGiaTri)
				out.print(gt + "<br>");*/ //Hiển thị để xem lưu trữ thế nào
			
		   for(int i=0; i<lstGiaTri.size(); i++){
			   //Xóa trên 1 sp
				if (lstGiaTri.get(i).equals("Delete")){
					String mssuaxoa = lstDieuKien.get(i-1).substring(6,8);	//cắt ra mã sản phầm cần xóa
					gh.xoaMotSach(mssuaxoa);  
			   }
			   //Update trên 1 sp
				if(lstGiaTri.get(i).equals("Update")){
					String mssuaxoa = lstDieuKien.get(i-1).substring(6,8);
					long sl = Long.parseLong(request.getParameter("txtsl"+"-"+mssuaxoa));	//cắt ra mã sản phẩm cần update
					gh.CapnhapCart(mssuaxoa, sl);
				}
		   }
			//Hàm xóa các sản phẩm có check
			if(request.getParameterValues("check")!=null){
				String[] gtcheck=request.getParameterValues("check");
				if(request.getParameterValues("butsua")==null && request.getParameterValues("butxoa")==null)
				   for(String ss: gtcheck)
					   gh.xoaMotSach(ss);
			}
			
			session.setAttribute("gio", gh);
			if (gh.ds.size() != 0)
				response.sendRedirect("htgio.jsp");
			else
				response.sendRedirect("htsach.jsp");
		   
		
	%>
</body>
</html>