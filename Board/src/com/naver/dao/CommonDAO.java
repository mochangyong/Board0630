package com.naver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CommonDAO {
	
	private final String driverName="oracle.jdbc.driver.OracleDriver";
	private final String url="jdbc:oracle:thin:@127.0.0.1:1522:xe";
	private final String uid="oraclejava";
	private final String upd="oraclejava";
	//접속에 팔요한 변수를 선언합니다.
	private Connection con = null;
	private Statement stmt = null;
	//db접속정보를 가시조, 접속후에 SQL문을 사용하기위해 필요한 statement 객체를 반환하는 
	//openConnection 메소드를 구현합니다.
	public Statement openConnection(){
		 try{             
			 Class.forName(driverName);             
			 con=DriverManager.getConnection(url,uid,upd);             
			 stmt=con.createStatement();         
			 }catch(Exception e){             
				 System.err.println("Oracle Database Connection Something Problem!!");             
				 System.out.println(e.getMessage());             
				 e.printStackTrace();         
				 }         
		 return stmt;     
		 }           
	//접속을 종료하기위한 closeConnection 메소드를 구현합니다.     
	public void closeConnection(){         
		try {             
			if(!con.isClosed())//닫히지 않았으면               
				con.close();         
			} catch (SQLException e) {             
				e.printStackTrace();
	}
	}
}
