package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.UserVO;
import db.UserDAO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDAO dao = new UserDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserVO user = dao.login(id, pw);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		if(user != null) {
			JSONObject obj = new JSONObject(user);
			PrintWriter out = response.getWriter();
			out.print(obj.toString());
		}else {
			PrintWriter out = response.getWriter();
			out.print(0);
		}
	}
}
