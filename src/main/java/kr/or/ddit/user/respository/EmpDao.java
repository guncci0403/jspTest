package kr.or.ddit.user.respository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.db.MybatisUtil;
import kr.or.ddit.user.model.EmpVo;

public class EmpDao implements EmpDaoI{
private static final Logger logger = LoggerFactory.getLogger(EmpDao.class);

	@Override
	public List<EmpVo> selectAllEmp() {
		SqlSession sqlSession = MybatisUtil.getSqlSession();
	
		// select : 리턴되는 값의 복수 유무를 판단
		// 			1. 단건 : 일반객체를 반환(UserVo) selectOne()
		//			2. 여러건 : List<UserVo> selectList()
		// insert, update, delete : insert, update, delete
		
		// 메소드 이름과 실행한 sql id 를 동일하게 맞추자(유지보수- 다른 개발자의 가독성)
		
		List<EmpVo> empList = sqlSession.selectList("emp.selectAllEmp");
		// 사용한 자원 반환
		sqlSession.close();
		
		return empList;
	}


}
