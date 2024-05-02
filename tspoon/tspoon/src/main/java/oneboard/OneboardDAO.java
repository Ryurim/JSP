package oneboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class OneboardDAO extends ConnectPool {
	
	// 1:1 게시판 글 작성
	public int writeBoard(String id, String title, String content, String select1, String select2) {
		int result = 0;
		
		String sql = "insert into oneboard (id, title, content, select1, select2)"
				+ " values (?, ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, title);
			psmt.setString(3, content);
			psmt.setString(4, select1);
			psmt.setString(5, select2);
			
			result = psmt.executeUpdate();
		
		} catch(Exception e) {
			System.out.println("1:1 게시판 글 작성 실패!");
			e.printStackTrace();
		}
		
		return result;
	}

	//1:1 게시판 글 리스트 
	public List<OneboardDTO> boardList(String id, Map<String, Object> map) {
		List<OneboardDTO> list = new Vector<OneboardDTO>();
		
		String sql = "select idx, id, title, content, regDate, select1, select2, answerIdx"
				+ " from oneboard"
				+ " where id = ?"
				+ " order by regDate desc";
		
		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sql += " Limit " + map.get("page_skip_cnt") + ", " + map.get("page_size");
		}
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				OneboardDTO dto = new OneboardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setSelect1(rs.getString("select1"));
				dto.setSelect2(rs.getString("select2"));
				dto.setAnswerIdx(rs.getInt("answerIdx"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("1:1 게시판 글 리스트 조회 실패!");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	//1:1 게시판 글 갯수
	public int boardCnt(String id) {
		int cnt = 0;
		
		String sql = "select count(*) from oneboard where id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			rs.next();
			
			cnt = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("1:1 게시판 글 갯수 조회 실패!");
			e.printStackTrace();
		}
		
		
		return cnt;
	}
	
	//1:1 게시판 글 상세 
	public OneboardDTO boardView(int idx) {
		OneboardDTO dto = new OneboardDTO();
		
		String sql = "select idx, id, title, content, regDate, select1, select2, answerIdx"
				+ " from oneboard"
				+ " where idx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setSelect1(rs.getString("select1"));
				dto.setSelect2(rs.getString("select2"));
				dto.setAnswerIdx(rs.getInt("answerIdx"));
			} else {
				dto = null;
			}
		} catch (Exception e) {
			System.out.println("1:1 게시판 글 상세 조회 실패!");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//1:1 게시판 글 상세 답변 
	public AnswerDTO answerView(int idx) {
		AnswerDTO dto = new AnswerDTO();
		
		String sql = "select idx, regDate, title, content, oneboardIdx"
				+ " from answer"
				+ " where oneboardIdx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setOneboardIdx(rs.getInt("oneboardIdx"));
			} else {
				dto = null;
			}
		} catch (Exception e) {
			System.out.println("1:1 게시판 답 상세 조회 실패!");
			e.printStackTrace();
		}
		return dto;
	}

	//1:1 게시판 글 수정
	public int boardModify(String title, String content, String select1, String select2, int idx) {
		int result = 0;
		String sql = "update oneboard\n"
				+ " set title= ?, content = ?, select1 = ?, select2 = ?"
				+ " where idx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2,  content);
			psmt.setString(3, select1);
			psmt.setString(4, select2);
			psmt.setInt(5, idx);
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("1:1 게시판 글 수정 실패!");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//1:1 게시판 글 삭제 
	public int boardDelete(int idx) {
		int result = 0;
		
		String sql = "delete from oneboard where idx=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("1:1 게시판 글 삭제 실패!");
			e.printStackTrace();
		}
		
		return result;
	}
}
