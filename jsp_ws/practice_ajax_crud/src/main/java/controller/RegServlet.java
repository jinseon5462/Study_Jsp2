package controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		MemberVO member = new MemberVO();
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		
		int result = dao.insert(member);
		
		PrintWriter out = response.getWriter();
		if(result == 1) {
			out.print("등록결과 : 등록완료");
		}else {
			out.print("등록결과 : 등록실패");
		}
	}
}
