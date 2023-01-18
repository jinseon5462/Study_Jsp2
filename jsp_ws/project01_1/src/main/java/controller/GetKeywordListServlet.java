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

import common.FreeVO;
import db.FreeDAO;

@WebServlet("/getKeywordList.do")
public class GetKeywordListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeDAO dao = new FreeDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sel = request.getParameter("sel");
		String keyword = request.getParameter("keyword");
		ArrayList<FreeVO> list = dao.getKeywordList(sel, keyword);
		JSONArray arr = new JSONArray(list);
		PrintWriter out = response.getWriter();
		out.print(arr.toString());
	}
}
