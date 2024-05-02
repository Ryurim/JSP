/**
 * 
 */
package member;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

/**
 * 
 */
public class MemberDAO extends JDBConnect { //만들 때 이거 상속 체크 안하면 자동 최상위 parent Object 상속받는거로 생략됨
											//JDBConnect가 Object 상속 받았기 때문에 여기선 Object 자동 상속임!
	//멤버필드가 static이나 final일 경우 그냥 갖다 쓸 수 있음. super의 생성자를 하나라도 쓰지 않으면 멤버필드 갖다 쓸 수 없음.
	public MemberDAO() {} //항상 public. 쓰지 않더라도 만들어 놓을 것
	
	public MemberDAO(String driver, String url, String dbId, String dbPwd) { //db 커넥션 맺기
		super(driver, url, dbId, dbPwd); //부모가 JDBConnect라서 거기 있는거 바로 갖구오자. 자기의 직접적인 부모만 호출 가능. Object 호출하고 싶으면 JDBConnect에서 호출하기
	} //사실 이렇게 잘 안해. 객체 생성하자마자 커넥션 맺게 되는거니까. 공부할 때만 사용! 
	  //프로세스는 알고 있을 것! 스프링가면 이 코드 없고 걍 @Override 요렇게 되어있음. 그것만 봐도 파악할 줄 알아야해
	public MemberDAO(ServletContext application) {
		super(application);
	}
	public MemberDTO getMemberInfo(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * from tbl_member WHERE memberId = ?"; // and pwd = ? 이런거 넣으면(비교정보+인증정보 한번에) 100% 뚫려 밑에 1. 2. 순서대로 해야해
																	// 절대 정보수단과 인증수단을 같이 넣으면 안됨! 항상 분리해서 작성
		try {
			psmt = conn.prepareStatement(sql); // 어? 이 필드명 없는데?? -> 부모가 갖고있네. 어떻게 여기서 바로 가져다 쓰는걸까? super의 사용자 정의 생성자를 불렀기 때문에
												// super가 갖고있는 모든것을 다 가져오게 돼.
			psmt.setString(1, id); //1. id로 갖고온 후
			rs = psmt.executeQuery();
			
			if (rs.next()) {//데이터가 존재해?
				if (rs.getString("pwd").equals(pwd)) {// 2. db에서 갖고온 pwd와 같은지 확인. 그래야 동일한 사람인지 체크 가능	
					dto.setMemberId(rs.getString("memberId"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					dto.setJumin(rs.getString("jumin"));
				}
				
				/*
				dto.setMemberId(rs.getString("memberId"));//인덱스 혹은 컬럼명으로 줄 수 있는데 인덱스보다 컬럼명이 더 나아.
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				dto.setJumin(rs.getString("jumin"));
				*/
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	

}
