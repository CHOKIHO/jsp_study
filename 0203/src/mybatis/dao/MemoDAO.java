package mybatis.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.vo.MemoVO;

public class MemoDAO {
	
	//mybatis DB 전담객체 (싱글톤)
	private static SqlSessionFactory factory;
	
	//스태틱 초기화 (생성자보다 먼저 초기화된다.)
	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static MemoVO[] getAll() {
		
		SqlSession ss = factory.openSession();
		List<MemoVO> list = ss.selectList("memo.all");
		ss.close();
		
		MemoVO[] ar = null;

		if (list !=null && list.size() >0) {
			ar = new MemoVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}

	public static boolean add(String title, String content, String pwd, String writer, String ip) {

		boolean value = false;
		
		MemoVO vo = new MemoVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setWriter(writer);
		vo.setIp(ip);
		
		SqlSession ss = factory.openSession(false);		
		int cnt = ss.insert("memo.add", vo);
		
		if (cnt ==1 ) {
			value = true;
			ss.commit();
		} else {
			ss.rollback();
		}

		ss.close();		
		return value;
	}
	
}
