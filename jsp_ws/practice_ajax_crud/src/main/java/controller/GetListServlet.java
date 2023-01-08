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

@WebServlet("/getList.do")
public class GetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO dao = new MemberDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberVO> list = dao.selectAll();
		JSONArray jArr = new JSONArray(list);
		
		PrintWriter out = response.getWriter();
		out.print(jArr.toString());
	}
}
