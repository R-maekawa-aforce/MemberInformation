package jp.co.aforce.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.dao.MemberDAO;
import jp.co.aforce.tool.ConstNum;


@WebServlet("/jp.co.aforce.servlets/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();

		ArrayList<String>list = new ArrayList<String>();
		if(request.getParameter("last_name") == "") list.add("名前_性");
		if(request.getParameter("first_name") == "") list.add("名前_名");
		if(request.getParameter("sex") == null) list.add("性別");
		if(request.getParameter("birth_year") == null) list.add("生年月日_年");
		if(request.getParameter("birth_month") == null) list.add("生年月日_月");
		if(request.getParameter("birth_day") == null) list.add("生年月日_日");
		if(request.getParameter("phone_number") == "") list.add("電話番号");
		if(request.getParameter("mail_address") == "") list.add("メールアドレス");
		if(request.getParameter("job") == null) list.add("職業");

		if(request.getParameter("last_name") == "" ||
			request.getParameter("first_name") == "" ||
			request.getParameter("sex") == null ||
			request.getParameter("birth_year") == null||
			request.getParameter("birth_month") == null||
			request.getParameter("birth_day") == null||
			request.getParameter("phone_number") == ""||
			request.getParameter("mail_address") == ""||
			request.getParameter("job") == null) {

			request.setAttribute("W_CCM0001", ConstNum.W_CCM0001);
			request.setAttribute("list", list);
			request.getRequestDispatcher("../views/update.jsp").forward(request, response);
		}else {
			try {
				String last_name = request.getParameter("last_name");
				String first_name = request.getParameter("first_name");
				String sex = request.getParameter("sex");
				int birth_year = Integer.parseInt(request.getParameter("birth_year"));
				int birth_month = Integer.parseInt(request.getParameter("birth_month"));
				int birth_day = Integer.parseInt(request.getParameter("birth_day"));
				String phone_number = request.getParameter("phone_number");
				String mail_address = request.getParameter("mail_address");
				String job = request.getParameter("job");
				String member_id = (String) session.getAttribute("member_id");

				int line = dao.update(member_id, last_name, first_name, sex, birth_year, birth_month, birth_day, job, phone_number, mail_address);

				if(line > 0) {
					request.setAttribute("I_WKK0002", ConstNum.I_WKK0002);
					request.getRequestDispatcher("../views/update.jsp").forward(request, response);
				}else {
					request.setAttribute("E_WKK0002", ConstNum.E_WKK0002);
					request.getRequestDispatcher("../views/update.jsp").forward(request, response);
				}
			}catch (Exception e){
				request.setAttribute("E_WKK0000", ConstNum.E_WKK0000);
				request.getRequestDispatcher("../views/update.jsp").forward(request, response);
				e.printStackTrace();
			}
		}

	}
}
