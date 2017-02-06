package mybatis.vo;

public class MemVO {
	
	/*
		  ID          VARCHAR2(20 BYTE)      NOT NULL, 
		  PWD         VARCHAR2(20 BYTE)      NOT NULL, 
		  NAME        VARCHAR2(50 BYTE)      NOT NULL, 
		  EMAIL       VARCHAR2(100 BYTE)         NULL, 
		  PHONE       VARCHAR2(20 BYTE)          NULL, 
		  REG_DATE    DATE                       NULL
	 */
	String id, pwd, name, email, phone, reg_date;

	public MemVO() {}
	
	
	
	public MemVO(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}



	public MemVO(String id, String pwd, String name, String email, String phone) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
