package mybatis.vo;

public class MemoVO {
	
	/*
   
	  IDX        NUMBER                  NOT NULL, 
	  TITLE      VARCHAR2(50 BYTE)           NULL, 
	  CONTENT    VARCHAR2(1000 BYTE)         NULL, 
	  PWD        VARCHAR2(20 BYTE)           NULL, 
	  WRITER     VARCHAR2(30 BYTE)           NULL, 
	  IP         VARCHAR2(20 BYTE)           NULL, 
	  WDT        DATE                        NULL
  
	 */

	String idx, title, content, pwd, writer, ip, wdt, filename;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public MemoVO() {}
	
	public MemoVO(String title, String content, String pwd, String writer, String ip) {
		super();
		this.title = title;
		this.content = content;
		this.pwd = pwd;
		this.writer = writer;
		this.ip = ip;
	}

	
	public MemoVO(String title, String content, String pwd, String writer, String ip, String filename) {
		super();
		this.title = title;
		this.content = content;
		this.pwd = pwd;
		this.writer = writer;
		this.ip = ip;
		this.filename = filename;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getWdt() {
		return wdt;
	}

	public void setWdt(String wdt) {
		this.wdt = wdt;
	}

	
}
