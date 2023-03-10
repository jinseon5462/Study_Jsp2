package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserDAO;
import vo.UserVO;


@WebServlet("/signUp.do")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO dao = new UserDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserVO user = new UserVO();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setTel(request.getParameter("tel"));
		user.setUniv(request.getParameter("univ"));
		int result = dao.insert(user);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
