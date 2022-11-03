package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getLoai(){
		ArrayList<loaibean> ds= new ArrayList<loaibean>();
		
		try {
			//b1: Ket noi vao csdl
			KetNoi kn = new KetNoi();
			kn.KetNoi();
			//b2: Lay du lieu ve
			String sql = "select * from loai";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			//b3: Luu tat ca du lieu vao mang ds
			while(rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				ds.add(new loaibean(maloai, tenloai));
			}
			//b4: Dong ket noi
			rs.close();
			kn.cn.close();
			return ds;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		/*ds.add(new loaibean("tin", "Công nghệ thông tin"));
		ds.add(new loaibean("toan", "Toán kinh tế"));
		ds.add(new loaibean("ly", "Vật lý"));
		ds.add(new loaibean("hoa", "Hóa hữu cơ"));
		
		return ds;*/	//Truoc khi key noi sql
	}
}
