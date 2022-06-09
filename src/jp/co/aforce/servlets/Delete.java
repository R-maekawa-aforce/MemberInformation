package jp.co.aforce.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.dao.MemberDAO;
import jp.co.aforce.tool.ConstNum;

@WebServlet("/jp.co.aforce.servlets/delete")
public class Delete extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
		String member_id = (String) session.getAttribute("member_id");

		try {
			int line = dao.delete(member_id);

			if(line > 0) {
				request.setAttribute("I_WKK0003", ConstNum.I_WKK0003);
				request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
			}else {
				request.setAttribute("E_WKK0004", ConstNum.E_WKK0004);
				request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("E_WKK0000", ConstNum.E_WKK0000);
			request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
			e.printStackTrace();
		}

	}

}
