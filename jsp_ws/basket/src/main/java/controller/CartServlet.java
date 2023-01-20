package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.ProductDTO;

@WebServlet("/cart.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProductDAO pDao = new ProductDAO();
	CartDAO cDao = new CartDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CartDTO> cartList = cDao.getCartList();
		request.setAttribute("cartList", cartList);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductDTO prod = new ProductDTO();
		prod.setPcode(request.getParameter("pcode"));
		prod.setPname(request.getParameter("pname"));
		prod.setPrice(Integer.parseInt(request.getParameter("price")));
		prod.setPinfo(request.getParameter("pinfo"));
		prod.setPhoto(request.getParameter("photo"));
		cDao.insert(prod);
		doGet(request, response);
	}
}
