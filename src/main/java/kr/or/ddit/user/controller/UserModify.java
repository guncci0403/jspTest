package kr.or.ddit.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceI;
import kr.or.ddit.util.FileUtil;
@MultipartConfig
@WebServlet("/userModify")
public class UserModify extends HttpServlet{
	
	private static final Logger logger = LoggerFactory.getLogger(UserModify.class);
	private UserServiceI userService = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		UserVo user = userService.selectUser(userid);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/user/userModify.jsp").forward(req, resp);
	}

	//사용자 정보 수정 요청 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터를 읽기 전에 실행
		//servlet의 doPost 메소드 마다 실행 필요 ==> Filter
		req.setCharacterEncoding("utf-8");
		
		String userid	= req.getParameter("userid"); 
		String usernm	= req.getParameter("usernm"); 
		String pass		= req.getParameter("pass");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date reg_dt		= null;
		
		try {
			reg_dt = sdf.parse(req.getParameter("reg_dt"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String alias	= req.getParameter("alias");  
		String addr1	= req.getParameter("addr1");  
		String addr2	= req.getParameter("addr2");  
		String zipcode	= req.getParameter("zipcode");
		
		//사용자가 profile을 업로드 한경우
		// 전송한 파일 이름 (filename)
		// 서버에 저장할 파일 이름(realfilename)
		// 서버에 지정된 공간에 저장
		Part profile = req.getPart("profile");
		/* int = userService.selectUser("") */
		String filename ="";
		String realfilename = "";
		if(profile.getSize() > 0) {
			filename = FileUtil.getFileName(profile.getHeader("Content-Disposition"));
			String fileExtension = FileUtil.getFileExtension(filename);
			//brown / brown.png
			realfilename = UUID.randomUUID().toString() + fileExtension;
			
			profile.write("d:\\upload\\" + realfilename);
		}
		
		UserVo userVo = new UserVo(userid, usernm, pass, reg_dt, alias, addr1, addr2, zipcode, filename, realfilename);
		
		int updateCnt = userService.modifyUser(userVo);
		
		//사용자 수정이 정상적으로 된 경우	==> 해당 사용자의 상세조회 페이지로 이동
		if(updateCnt == 1) {
			resp.sendRedirect(req.getContextPath()+"/user?userid=" + userid);
		}
		//사용자 수정이 비정상적으로 된 경우 ==> 해당 사용자의 정보 수정 페이지로 이동
		else {
			doGet(req, resp);
		}
	}
}