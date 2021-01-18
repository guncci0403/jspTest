package kr.or.ddit.user.service;

import java.util.List;

import kr.or.ddit.user.model.EmpVo;


public interface EmpServiceI {
	
	//전체 사용자 정보 조회
	/* SELECT *
	 * FROM users;
	 */
	
	//반환타입 메소드명();
	List<EmpVo> selectAllEmp();
	


	
	
}
