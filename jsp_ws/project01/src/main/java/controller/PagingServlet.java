package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FreeVO;
import db.FreeDAO;

@WebServlet("/getPage.do")
public class PagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeDAO dao = new FreeDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<FreeVO> list = dao.getFreeList();
	}
}
