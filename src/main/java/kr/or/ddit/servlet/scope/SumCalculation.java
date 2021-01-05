package kr.or.ddit.servlet.scope;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/sumCalculation")
public class SumCalculation extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(SumCalculation.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/sumView.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String scopeStart = req.getParameter("start");
		String scopeEnd = req.getParameter("end");
		
		
		int a = Integer.parseInt(scopeStart);
		int b = Integer.parseInt(scopeEnd);
		
		//start부터 end까지의 합
		int sum = 0;
		for(int i=a; i<=b; i++) {
			sum = sum + i;
		}
			
		logger.debug("{}", sum);
		String abc = scopeStart+"에서"+scopeEnd+"까지합은"+Integer.toString(sum);
		
		HttpSession session = req.getSession();
		session.setAttribute("sumResult", abc);
		
		req.getRequestDispatcher("/sumResult.jsp").forward(req, resp);
	}
}
