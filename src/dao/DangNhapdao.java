package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DangNhapdao {
	public boolean KtDangNhap(String un, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.KetNoi();
		String sql="select * from DangNhap where TenDangNhap='"+ un + "' and MatKhau='" +pass+ "'";  
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		r.close();
		return kq;
	}
}
