package kr.or.ddit.servlet.basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TimesTablesServlet
 */
public class TimesTablesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter pw = resp.getWriter(); //test
		pw.println("<html>");	//동적인 콘텐츠를 만드는 과정
		pw.println("	<head>");
		pw.println("		<title>TimesTablesServlet</title>");
		pw.println("	<style>");
		pw.println("		td{ ");
		pw.println("			border: 1px solid pink; ");
		pw.println("		} ");
		pw.println("		table{ ");
		pw.println("			width: 100%; ");
		pw.println("		} ");
		pw.println("	</style>");
		pw.println("	</head>");
		pw.println("	<body>");
		pw.println("		<table border="+1+">");
		
		for(int j = 1; j <= 9; j++) {
			pw.println("		<tr>");
			for(int i = 2; i<= 9; i++) {
				pw.println("			<td>"+i+"*"+j+"="+i*j+"</td>");
			}
			pw.println("		</tr>");
		}
		
		pw.println("		</table>");
		
		pw.println("	</body>");
		pw.println("</html>");
		
		pw.flush();		//더이상 작성할 내용이 없으므로 작업을 마무리 한다
		pw.close();		//사용한 자원 반납
	}


}
