package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;
// 구버전 -> import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection conn;
	//커넥션을 만들어서
	public Statement stmt;
	public PreparedStatement psmt;
	//구문을 맺고
	public ResultSet rs;
	//받아
	
	public JDBConnect() {	//기본 생성자로 이렇게 생성해서 사용하기도 해. 거의 안써. 혼자 공부할 때 써
		// 고정해놓고 끝. 수정 안됨(생성자에
		try {
			Class.forName("org.mariadb.jdbc.Driver"); // driver 갖구와
			//driver 직접 부를 때 forName 이용한다
			String url = "jdbc:mariadb://localhost:3306/maria";
			String dbid = "root";
			String dbPwd = "1234";
			conn = DriverManager.getConnection(url, dbid, dbPwd);
			//연결은 drivermanager를 이용한다. 파일/네트워크/하드드라이버든 다 이걸로 연결할 수 있다.
			System.out.println("DB 연결 성공 : 기본 생성자");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect(String driver, String url, String dbId, String dbPwd) {	//작은 프로젝트들은 이거 써. db 여러개면 이거 그냥 호출해서 써도 돼
		//이렇게 생성자 정의하면 좋은것은?
		//만들어서 쓰는 놈이 매개변수 바꿔서 쓰면 되니까 더 간편함
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPwd);
			System.out.println("DB 연결 성공 : 사용자 정의 생성자1");
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect (ServletContext application) {	//대부분 이거 써. db 여러개 쓰면 어떤놈 쓸건지 받는 매개변수도 있어야해 String dbType
		
		try {
			//웹서버에서 초기화 되어 있는 아이 갖고와(wdb.xml에서) 
			String driver = application.getInitParameter("Driver");
			Class.forName(driver);
			
			String url = application.getInitParameter("URL");
			String id = application.getInitParameter("dbId");
			String pwd = application.getInitParameter("dbPwd");
			
			conn = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공 : 사용자 정의 생성자2");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public void close() { //밑에서부터 차례로 close
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (conn != null) conn.close();
			
			System.out.println("JDBC 연결 자원 해지 성공");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
