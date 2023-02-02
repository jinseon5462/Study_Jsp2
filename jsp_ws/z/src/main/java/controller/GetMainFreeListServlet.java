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

import db.FreeDAO;
import vo.FreeVO;

@WebServlet("/getMainFreeList.do")
public class GetMainFreeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FreeDAO dao = new FreeDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		ArrayList<FreeVO> list = dao.getMainFreeList();
		JSONArray arr = new JSONArray(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

}
