package model1.bbs;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BbsDAO extends JDBConnect {
	public BbsDAO() {}
	
	public BbsDAO(ServletContext application) {
		super(application);
	}
	
	public int bbsTotalCount(Map<String, Object> map) {
		int total_count = 0;
		
		/* 이렇게 해줘두 돼
		String sql = "SELECT COUNT(*) FROM tbl_bbs";
		if (map != null) {
			sql += "WHERE " + map.get("search_category");
			sql += " LIKE '%" + map.get("search_word") + "%;";
		}
		*/

		StringBuilder sb = new StringBuilder(); //동적으로 생성되거나 문자열을 계속 추가해야 할 때
		sb.append("SELECT COUNT(*) FROM tbl_bbs");
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE " + map.get("search_category")); //컬럼명
			sb.append(" LIKE '%" + map.get("search_word") + "%'"); //컬럼명 서치하는 키워드
		}
		
		try {
			String sql = sb.toString();//StringBuilder 타입이라서 형변환
			psmt = conn.prepareStatement(sql); 
			//psmt.setString(1, map.get("search_category"));//위에서 ? 처리 했으면 여기서 넣어주면 돼
			//psmt.setString(2, map.get("search_word"));
			rs = psmt.executeQuery();  
			rs.next(); 
			total_count = rs.getInt(1); //count(*)한 결과
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 갯수 조회 에러");
		}
		
		return total_count;
	}
	
	public List<BbsDTO> bbsList(Map<String, Object> map) {
		List<BbsDTO> list = new Vector<BbsDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt");
		sb.append(", display_date, reg_date, modify_date");
		//sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		if (map.get("search_category") != null && map.get("search_word") != null) {
			sb.append(" WHERE " + map.get("search_category"));
			sb.append(" LIKE '%" + map.get("search_word") + "%'");
		}
		sb.append(" ORDER BY idx DESC");
		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sb.append(" LIMIT " + map.get("page_skip_cnt") + ", " + map.get("page_size")); // ?로 쓰는게 더 좋아
		}
		
		
		
		try {
			psmt = conn.prepareStatement(sb.toString()); //쿼리 만든거 커넥션에서 실행. 그걸 psmt에 넣음
			
			rs = psmt.executeQuery(); //그걸 resultSet에 넣음
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("reg_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
				
				list.add(dto); //list[0] = 첫번째 목록. list[1] = 두번째 목록 ...
			}
		} catch (Exception e) {
			System.out.println("게시물 리스트 조회 에러");
		}
		
		return list;
	}
	
	
	public BbsDTO bbsView(int idx) {
		BbsDTO dto = new BbsDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT idx, ref_idx, level_idx, sort_order");
		sb.append(", user_id, title, content, read_cnt");
		sb.append(", display_date, reg_date, modify_date");
		//sb.append(", file_path, file_name, file_ext, file_size");
		sb.append(" FROM tbl_bbs");
		sb.append(" WHERE idx = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setRef_idx(rs.getInt("ref_idx"));
				dto.setLevel_idx(rs.getInt("level_idx"));
				dto.setSort_order(rs.getInt("sort_order"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRead_cnt(rs.getInt("read_cnt"));
				dto.setDisplay_date(rs.getString("reg_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
			}
		} catch (Exception e) {
			System.out.println("게시판 데이터 조회 오류" + e.getMessage());
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int bbsRegist(BbsDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs (user_id, title, content) VALUES(?, ?, ?)");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 등록 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int bbsDelete(int idx) {
		int result = 0;
		
		//StringBuilder sb = new StringBuilder();
		//sb.append("DELETE FROM tbl_bbs WHERE idx = ?");
		
		String sql = "DELETE FROM tbl_bbs WHERE idx = ?"; //단문이니까 이거 하자
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 삭제 오류!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	
	}
	
	public int bbsModify (BbsDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE tbl_bbs SET title = ?, content = ?, modify_date = now()");
		sb.append(" WHERE idx = ?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getIdx());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 수정 중 오류 발생!" + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
}
