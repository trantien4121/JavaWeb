<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Web</title>
</head>
<body>
<table width="1000" border="1" align="center">
     <tr>
     	<td colspan="3" bgcolor="red"> Menu ngang </td>
     </tr>
     <tr>
     	<td valign="top" width="200"> 
     	    <a href="ht.jsp"> Trang chủ</a> <hr>
            <a href="http://docbao.vn"> Đọc báo</a><hr>
            <a href="Them-thuoc.docx"> Tải bài giảng</a> <hr>
     	</td>
     	<td width="600">
     	    <img src="cau6_1.jpg" width="200"> <br>
     	    Noi dung <hr>Noi dung <hr>Noi dung <hr>Noi dung <hr>Noi dung <hr>Noi dung <hr> </td>
     	<td width="200"> 
     		<form action="ht.jsp" method= "post">
     			Tên đăng nhập: <input name="txtun" type="text"> <br>
     			Mật khẩu: <input name="txtpass" type="password"> <br>
     			Tải ảnh: <input name="txtfileup" type="file"> <br>
     			<input name="but1" type="submit" value="Đăng ký">
     			Comment<br>
     			<textarea row=6 col=10>
     				Nội dung
     			</textarea> <br>
     			Chọn quốc gia:
     			<select name="s1">
     				<option>Vn</option>
     				<option selected="selected">Lao</option>
     				<option>Cam</option>
     			</select>
     		</form>
     	</td>
     </tr>
 	 <tr>
     	<td colspan="3"> Ban quyen: .....</td>
     </tr>
  </table>

</body>
</html>