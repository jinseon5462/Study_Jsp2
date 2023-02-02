package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.UserDAO;
import vo.UserVO;

@WebServlet("/updateUserInfo.do")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAO dao = new UserDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		UserVO user = new UserVO();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setTel(request.getParameter("tel"));
		user.setUniv(request.getParameter("univ"));
		UserVO updateUser = dao.updateUserInfo(user);
		PrintWriter out = response.getWriter();
		if(updateUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", updateUser);
			out.print(1);
		}else if(updateUser == null) {
			out.print(0);
		}
	}
}
