package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dto.OrderDTO;

@WebServlet("/charge.do")
public class ChargeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CartDAO dao = new CartDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String[] products = request.getParameterValues("products");
		ArrayList<OrderDTO> list = dao.charge(products);
		request.setAttribute("list", list);
		request.getRequestDispatcher("ordered.jsp").forward(request, response);
	}
}
