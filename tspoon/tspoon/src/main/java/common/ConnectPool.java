/**
 * 
 */
package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 
 */
public class ConnectPool {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public ConnectPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");	//형변환 필수
			DataSource ds = (DataSource) ctx.lookup("jdbc_tspoon");
			
			conn = ds.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("DB 커넥션 풀 연결 실패ㅜㅜ");
			e.printStackTrace();
		}
		
	}
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (conn != null) conn.close();
			
			System.out.println("DB 커넥션 풀 자원 해지 성공");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
