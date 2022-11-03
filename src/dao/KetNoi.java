package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sachbean;

public class KetNoi {

	public Connection cn;
	public void KetNoi() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("xong B1");
			
			String url = "jdbc:sqlserver://LAPTOP-05F01F8L\\SQLEXPRESS:1433;databaseName=QlSach;user=sa; password=123";
			cn = DriverManager.getConnection(url);
			System.out.println("xong B2");
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		KetNoi kn = new KetNoi();
		kn.KetNoi();
	}

}
