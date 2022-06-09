package jp.co.aforce.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.beans.MemberInfo;
import jp.co.aforce.dao.MemberDAO;
import jp.co.aforce.tool.ConstNum;


@WebServlet("/jp.co.aforce.servlets/search2")
public class Search2 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_id = request.getParameter("member_id");
		MemberDAO dao = new MemberDAO();

			try {
				MemberInfo m = dao.seach(member_id);
				String last_name = m.getLast_name();

				if(last_name != null) {
					session.setAttribute("member_id", m.getMember_id());
					request.setAttribute("member", m);
					request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
				}else {
					request.setAttribute("E_WKK0003", ConstNum.E_WKK0003);
					request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
				}
			} catch (Exception e) {
				request.setAttribute("E_WKK0005", ConstNum.E_WKK0005);
				request.getRequestDispatcher("../views/delete.jsp").forward(request, response);
				e.printStackTrace();
			}

		}

}
