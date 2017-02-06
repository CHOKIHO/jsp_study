package mybatis.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.vo.MemVO;

public class MemDAO {
	
	//mybatis DB 전담객체 (싱글톤)
	private static SqlSessionFactory factory;

	//스태틱 초기화
	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MemVO login(String id, String pwd) {
		
		MemVO mem = new MemVO(id, pwd);
		
		SqlSession ss = factory.openSession();
		MemVO vo = ss.selectOne("mem.login", mem);
		ss.close();
		
		return vo;
	}

	public static boolean addMember(String id, String pwd, String name, String email, String cellphone) {
		
		Map<String,	String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("email", email);
		map.put("phone", cellphone);
		
		SqlSession ss = factory.openSession(true);
		
		MemVO vo = ss.selectOne("mem.getMember", id);
		int cnt =0;
		if (vo == null) {  
			cnt = ss.insert("mem.add", map);
		}
		
		ss.close();
		
		boolean value = false;
		
		if(cnt==1) {
			value = true;
		}
		return value;
	}
	
}
