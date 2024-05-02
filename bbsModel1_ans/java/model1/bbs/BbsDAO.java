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
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tbl_bbs");
		
		if ( map.get("search_category") != null && map.get("search_word") != null ) {
			sb.append(" WHERE "+ map.get("search_category"));
			sb.append(" LIKE '%"+ map.get("search_word") + "%'");
		}
		
		try {
			String sql = sb.toString();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total_count = rs.getInt(1);
		} catch(Exception e) {
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
		if ( map.get("search_category") != null && map.get("search_word") != null ) {
			sb.append(" WHERE "+ map.get("search_category"));
			sb.append(" LIKE '%"+ map.get("search_word") +"%'");
		}
		sb.append(" ORDER BY idx DESC");
		if ( map.get("page_skip_cnt") != null && map.get("page_size") != null ) {
			sb.append(" LIMIT "+ map.get("page_skip_cnt") +", "+ map.get("page_size"));
		}
		
		System.out.println("sql : " + sb.toString());
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
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
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("게시물 리스트 조회 에러");
			e.printStackTrace();
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
				dto.setDisplay_date(rs.getString("display_date"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setModify_date(rs.getDate("modify_date"));
			}
		} catch(Exception e) {
			System.out.println("게시판 데이터 조회 오류 : "+ e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
	
	public int bbsRegist(BbsDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_bbs(user_id, title, content, reg_date)");
		sb.append(" VALUES (?, ?, ?, now())");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 등록 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int bbsModify(BbsDTO dto) {
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
		} catch(Exception e) {
			System.out.println("게시물 수정 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int bbsDelete(int idx) {
		int result = 0;
		String sql = "DELETE FROM tbl_bbs WHERE idx = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 삭제 중 에러 발생 : "+ e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
}
