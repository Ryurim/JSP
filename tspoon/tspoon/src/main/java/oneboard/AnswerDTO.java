package oneboard;

import java.sql.Date;

public class AnswerDTO {
	private int idx;
	private String regDate;
	private int oneboardIdx;
	private String title;
	private String content;
	
	public AnswerDTO() {}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	
	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	public int getOneboardIdx() {
		return oneboardIdx;
	}

	public void setOneboardIdx(int oneboardIdx) {
		this.oneboardIdx = oneboardIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
