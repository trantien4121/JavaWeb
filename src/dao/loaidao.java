package dao;

import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getLoai(){
		ArrayList<loaibean> ds= new ArrayList<loaibean>();
		ds.add(new loaibean("tin", "Công nghệ thông tin"));
		ds.add(new loaibean("toan", "Toán kinh tế"));
		ds.add(new loaibean("ly", "Vật lý"));
		ds.add(new loaibean("hoa", "Hóa hữu cơ"));
		return ds;
	}
}
