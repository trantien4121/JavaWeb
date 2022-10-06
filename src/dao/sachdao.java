package dao;
import java.util.ArrayList;

import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getSach(){
		ArrayList<sachbean> ds= new ArrayList<sachbean>();
		ds.add(new sachbean("s2", "Cấu trúc dữ liệu", "Lê Nam", 10 ,150, "b1.jpg", "tin"));
		ds.add(new sachbean("s1", "Cấu trúc dữ liệu 2", "Lê Nam", 10 ,150, "b2.jpg", "tin"));
		ds.add(new sachbean("s3", "Cấu trúc dữ liệu 3", "Lê Nam", 10 ,150, "b3.jpg", "tin"));
		ds.add(new sachbean("s4", "Giải tích", "Lê Tu", 10 ,150, "b4.jpg", "toan"));
		ds.add(new sachbean("s5", "Giải tích 2", "Lê Tu 2", 10 ,150, "b5.jpg", "tin"));
		ds.add(new sachbean("s6", "Lý đại cương", "Lê Nam", 10 ,150, "b6.jpg", "ly"));
		return ds;

	}
}
