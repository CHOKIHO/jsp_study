package mybatis.dao;

import java.io.Reader;

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

	public static int addMember(MemVO mem) {
		
		SqlSession ss = factory.openSession(true);
		int cnt = ss.insert("mem.add", mem);
		ss.close();
		return cnt;
	}
	
}
