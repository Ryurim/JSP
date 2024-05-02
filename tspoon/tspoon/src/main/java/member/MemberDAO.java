package member;

import java.util.List;
import java.util.Vector;

import common.ConnectPool;
import message.FileDTO;

public class MemberDAO extends ConnectPool {
	
	// 로그인 회원 조회
	public MemberDTO getMemberInfo(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("pwd").equals(pwd)) {
					dto.setIdx(rs.getInt("idx"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setPwd(rs.getString("pwd"));
					dto.setSex(rs.getString("sex"));
					dto.setTel(rs.getString("tel"));
					dto.setEmail(rs.getString("email"));
					dto.setInterest(rs.getString("interest"));
					dto.setGrade(rs.getString("grade"));
					dto.setBirthY(rs.getString("birthY"));
					dto.setBirthM(rs.getString("birthM"));
					dto.setBirthD(rs.getString("birthD"));
				}
			} else {
				dto = null;
			}
		} catch (Exception e) {
			System.out.println("로그인 회원 조회 실패!");
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	// 회원 가입
	public int registMember(MemberDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("insert into member (name, id, pwd, sex, tel, email, interest, grade, birthY, birthM, birthD)");
		sb.append("values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getSex());
			psmt.setString(5, dto.getTel());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7,  dto.getInterest());
			psmt.setString(8, dto.getGrade());
			psmt.setString(9, dto.getBirthY());
			psmt.setString(10, dto.getBirthM());
			psmt.setString(11, dto.getBirthD());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원가입 실패!");
			e.printStackTrace();
		}
		
		
		
		return result;
	}
		
	// 아이디 중복 조회
	public int getIdCount(String id) {
		int result = 0;
		String sql = "select count(id) from member where id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("아이디 중복 조회 위한 count 실패!");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//아이디 찾기 - 아이디 일부 조회
	public List<MemberDTO> searchId (String name, String tel) {
		List<MemberDTO> idList = new Vector<>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("select concat(substring(id, 1, 4),'****') as id, substring(birthY,3) as birthY, birthM, birthD, tel, interest from member where name = ? and tel = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, name);
			psmt.setString(2, tel);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				MemberDTO dto = new MemberDTO();
			
				dto.setId(rs.getString("id"));
				dto.setBirthY(rs.getString("birthY"));
				dto.setBirthM(rs.getString("birthM"));
				dto.setBirthD(rs.getString("birthD"));
				dto.setTel(rs.getString("tel"));
				dto.setInterest(rs.getString("interest"));
				
				idList.add(dto);
			}
			
		}
		catch(Exception e) {
			System.out.println("아이디 찾기 실패!");
			e.printStackTrace();
		}
		
		
		return idList;
	}
	
	// 비밀번호찾기
	public MemberDTO searchPwd (String id, String name, String tel) {
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("select id, substring(birthY,3) as birthY, birthM, birthD, pwd from member where id = ? and name = ? and tel = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, tel);
			
			rs = psmt.executeQuery();
			System.out.println(rs);
			
			if (rs.next()) {
			
				dto.setId(rs.getString("id"));
				dto.setBirthY(rs.getString("birthY"));
				dto.setBirthM(rs.getString("birthM"));
				dto.setBirthD(rs.getString("birthD"));
				dto.setPwd(rs.getString("pwd"));
				
			} else {
				dto = null;
			}
			
		}
		catch(Exception e) {
			System.out.println("비밀번호 찾기 실패!");
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	//비밀번호 변경 
	public int modifyPwd (String id, String pwd) {
		int result = 0;
		
		String sql = "update member set pwd = ? where id= ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pwd);
			psmt.setString(2, id);
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("비밀번호 변경 실패!");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//개인정보 변경 - 비밀번호 확인
	public MemberDTO pwdInfo (String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		
		String sql = "select id, name, pwd, birthY, birthM, birthD, sex, tel from member where id=? and pwd=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				dto.setBirthY(rs.getString("birthY"));
				dto.setBirthM(rs.getString("birthY"));
				dto.setBirthM(rs.getString("birthM"));
				dto.setBirthD(rs.getString("birthD"));
				dto.setSex(rs.getString("sex"));
				dto.setTel(rs.getString("tel"));
			}
			else {
				dto = null;
			}
		} catch (Exception e) {
			System.out.println("개인정보 변경 - 비밀번호 확인 실패!");
			e.printStackTrace();
		}
		return dto;
	}
	
	//개인정보 변경 - 전화번호 변경 
	public int modifyTel(String id, String tel) {
		int result = 0;
		
		String sql = "update member set tel = ? where id=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, id);
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("개인정보 변경 - 전화번호 변경 실패!");
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	//마이페이지 프로필사진 등록 
	public int registFile(ImgDTO dto) {
		int result = 0;
		
		try {
			
			String sql = "insert into img (id, orgFile, saveFile)"
					+ " values(?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,  dto.getId());
			psmt.setString(2,  dto.getOrgFile());
			psmt.setString(3, dto.getSaveFile());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("이미지 등록 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	//마이페이지 이미지 사진 갖고오기
	
	
	//마이페이지 프로필사진 수정
		public int modifyFile(FileDTO dto) {
			int result = 0;
			
			try {
				
				String sql = "update img set orgFile = ?, saveFile = ? where id = ?";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,  dto.getOrgFile());
				psmt.setString(2, dto.getSaveFile());
				psmt.setString(3,  dto.getId());
				result = psmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("파일 수정 에러 : " + e.getMessage());
				e.printStackTrace();
			}
			
			return result;
		}
		
	
}
