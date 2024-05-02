package message;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;
import member.ImgDTO;
import member.MemberDTO;

public class MessageDAO extends ConnectPool {
	
	// 받은 쪽지 조회 
	public List<MessageDTO> receiveMsgList(String id, Map<String, Object> map) {
		List<MessageDTO> list = new Vector<MessageDTO>();
//		SimpleDateFormat fmt = new SimpleDateFormat();
//		fmt.format("yyyy-mm-dd HH:mm:ss");
		
		String sql = "select msg.idx as idx, receiveId, receiveName, sendId, sendName, receiveDate, sendDate, readCnt, title, content"
				+ " from message msg "
				+ " where receiveId = ?"
				+ " order by receiveDate desc";
		
		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sql += " Limit " + map.get("page_skip_cnt") + ", " + map.get("page_size");
		}
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setReceiveId(rs.getString("receiveId"));
				dto.setSendId(rs.getString("sendId"));
				dto.setReceiveDate(rs.getString("receiveDate"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReceiveName(rs.getString("receiveName"));
				dto.setSendName(rs.getString("sendName"));
				
				list.add(dto);
			}
		}
		catch (Exception e){
			System.out.println("받은 메세지 리스트 불러오기 실패!");
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 보낸 쪽지 조회 
	public List<MessageDTO> sendMsgList(String id, Map<String, Object> map) {
		List<MessageDTO> list = new Vector<MessageDTO>();
		
		String sql = "select msg.idx as idx, receiveId, receiveName, sendId, sendName, receiveDate, sendDate, readCnt, title, content"
				+ " from message msg "
				+ " where sendId = ?"
				+ " order by sendDate desc";
		

		if (map.get("page_skip_cnt") != null && map.get("page_size") != null) {
			sql += " Limit " + map.get("page_skip_cnt") + ", " + map.get("page_size");
		}
		
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setReceiveId(rs.getString("receiveId"));
				dto.setSendId(rs.getString("sendId"));
				dto.setReceiveDate(rs.getString("receiveDate"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReceiveName(rs.getString("receiveName"));
				dto.setSendName(rs.getString("sendName"));
				
				list.add(dto);
			}
		}
		catch (Exception e){
			System.out.println("보낸 메세지 리스트 불러오기 실패!");
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 받은 쪽지 상세조회 
	public MessageDTO viewMsg(int idx) {
		MessageDTO dto = new MessageDTO();
		
		String sql = "select idx, title, sendName, receiveDate, content"
				+ " from message"
				+ " where idx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setSendName(rs.getString("sendName"));
				dto.setReceiveDate(rs.getString("receiveDate"));
				dto.setContent(rs.getString("content"));
			} else {
				dto = null;
			}
			
		} catch (Exception e){
			System.out.println("쪽지 상세조회 실패!");
			e.printStackTrace();
		}
		
		return dto;
		
	}
	// 보낸 쪽지 상세조회 
	public MessageDTO viewSendMsg(int idx) {
		MessageDTO dto = new MessageDTO();
		
		String sql = "select idx, title, receiveName, sendDate, content, readDate"
				+ " from message"
				+ " where idx = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setReceiveName(rs.getString("receiveName"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setContent(rs.getString("content"));
				dto.setReadDate(rs.getString("readDate"));
			} else {
				dto = null;
			}
			
		} catch (Exception e){
			System.out.println("쪽지 상세조회 실패!");
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	// 쪽지 읽은 횟수 증가 
	public void updateReadCnt(int idx, String id) {
		String sql = "update message set readCnt = readCnt + 1, readDate=now() where idx = ? and receiveId = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setString(2,  id);
			psmt.executeQuery();

		} catch (Exception e) {
			System.out.println("조회 갯수 증가 오류!");
			e.printStackTrace();
		}
	}
	
	// 쪽지 총 갯수 확인 
	public int cntMsg() {
		int cntMsg = 0;
		String sql = "select count(*) from message";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			cntMsg = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("쪽지 총 갯수 확인 실패!");
			e.printStackTrace();
		}
		
		return cntMsg;
	}
	//보낸 쪽지 총 갯수 확인 
	public int cntSendMsg(String id) {
		int cntMsg = 0;
		String sql = "select count(*) from message where sendId = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			cntMsg = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("쪽지 총 갯수 확인 실패!");
			e.printStackTrace();
		}
		
		return cntMsg;
	}
	
	//받은 쪽지 총 갯수 확인 
	public int cntReceiveMsg(String id) {
		int cntMsg = 0;
		String sql = "select count(*) from message where receiveId = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			cntMsg = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("쪽지 총 갯수 확인 실패!");
			e.printStackTrace();
		}
		
		return cntMsg;
	}
	
	// 읽지 않은 쪽지 갯수 확인
	public int readMsg(String id) {
		int readMsg = 0;
		String sql = "select count(*) from message where readCnt < 1 and receiveId=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			readMsg = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("읽은 쪽지 갯수 확인 실패!");
			e.printStackTrace();
		}
		
		return readMsg;
		
	}
	
	//쪽지 쓰기
	public int writeMsg (String receiveId, String sendId, String title, String content, String receiveName, String sendName) {
		int result = 0;
		
		String sql = "insert into message (receiveId, sendId, receiveDate, sendDate, title, content, receiveName, sendName)"
				+ " values (?, ?, now(), now(), ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, receiveId);
			psmt.setString(2, sendId);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setString(5,  receiveName);
			psmt.setString(6, sendName);
			
			
			result = psmt.executeUpdate();
			
			
		} catch(Exception e) {
			System.out.println("쪽지 쓰기 실패!");
			e.printStackTrace();
		}
		return result;
		
	}
	
	//쪽지 보낼 회원 조회
	public List<MemberDTO> memberList(String id) {
		List<MemberDTO> memList = new Vector<MemberDTO>();
		
		String sql = "select id, name from member where id != ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			System.out.println(rs);
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				
				memList.add(dto);
			
			}
			
		} catch (Exception e) {
			System.out.println("쪽지 보낼 회원 조회 실패!");
			e.printStackTrace();
		}
		
		return memList;
	}
	
	//쪽지 보낼 회원 이름 조회
	public String receiveName(String receiveId) {
		String id ="";
		
		String sql = "select distinct name "
				+ " from member m "
				+ " inner join message msg on msg.receiveId = m.id"
				+ " where msg.receiveId = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, receiveId);
			
			rs = psmt.executeQuery();
			
			rs.next();
			id = rs.getString(1);
		} catch(Exception e) {
			System.out.println("쪽지 보낼 회원 이름 조회 실패!");
			e.printStackTrace();
		}
	
		
		return id;
		
		
	}
	
	// 쪽지 삭제
	public int msgDelete(int idx) {
		int result = 0;
		
		String sql = "delete from message where idx=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("쪽지 삭제 실패!");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//쪽지 첨부파일 등록 
	public int registFile(FileDTO dto) {
		int result = 0;
		
		try {
			
			String sql = "insert into file (id, orgFile, saveFile, receiveId)"
					+ " values(?, ?, ?, ?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,  dto.getId());
			psmt.setString(2,  dto.getOrgFile());
			psmt.setString(3, dto.getSaveFile());
			psmt.setString(4, dto.getReceiveId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("파일 등록 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
	//쪽지 첨부파일 수정
	public int modifyFile(FileDTO dto) {
		int result = 0;
		
		try {
			
			String sql = "update file set orgFile = ?, saveFile = ? where id = ?";
			
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
	
	//쪽지 첨부파일 삭제 
	public int deleteFile(FileDTO dto) {
		int result = 0;
		
		try {
			
			String sql = "delete file where id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,  dto.getId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("파일 삭제 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
}
