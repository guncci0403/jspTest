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

@WebServlet("/mulCalculation")
public class MulCalculation extends HttpServlet{
	private static final Logger logger = LoggerFactory.getLogger(MulCalculation.class);

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/mulCalculation.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String scopeStart = req.getParameter("start");
		String scopeEnd = req.getParameter("end");
		
		HttpSession session = req.getSession();
		int a = Integer.parseInt(scopeStart);
		int b = Integer.parseInt(scopeEnd);
		int mul = a * b;

			
		String abc = scopeStart+"*"+scopeEnd+"="+Integer.toString(mul);
		logger.debug(abc);
		
		session.setAttribute("mulResult", abc);
		
		req.getRequestDispatcher("/mulResult.jsp").forward(req, resp);
	}
}
