package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import common.MemberVO;
import db.MemberDAO;

@WebServlet("/searchKeyword.do")
public class SerchKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao = new MemberDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		ArrayList<MemberVO> list = dao.getKeywordList(select, keyword);
		
		JSONArray arr = new JSONArray(list);
		PrintWriter out = response.getWriter();
		out.print(arr.toString());
	}
}
