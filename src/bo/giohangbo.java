package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void them(String masach, String tensach, long gia, long soluong) {
		for(giohangbean h: ds) 
			if(h.getMasach().equals(masach)) {
				h.setSoluong(h.getSoluong() + soluong);
				return;		//Return de thoat ra luon ko qua cau lenh phia duoi
			}
		ds.add( new giohangbean(masach, tensach, gia, soluong));
	}
	public long Tongtien() {
		long s=0;
		for(giohangbean h: ds) {
			s=s+ h.getThanhtien();
		}
		return s;
	}
	public void xoaMotSach(String masach){
		for (int i=0; i< ds.size(); i++) {
			if(ds.get(i).getMasach().equals(masach))
				ds.remove(i);
		}
	}
	public void xoaTatCa() {
		ds.clear();
	}
	public void CapnhapCart(String masach, long soluong) {
        int n = ds.size();
        for(int i=0; i<n; i++) 
           for(giohangbean item: ds)
               if(item.getMasach().equals(masach)){

                   item.setSoluong(soluong);
               }

    }
}
