package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.MemberVO;
import db.MemberDAO;

@WebServlet("/reg.do")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao = new MemberDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVO member = new MemberVO();
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		dao.insert(member);
		
	}
}
