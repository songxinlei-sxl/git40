package beiyou.java.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beiyou.java.web.service.GameService;
import beiyou.java.web.vo.User;


public class UpdateShopcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateShopcartServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("USER");
		if(null == obj) {
			response.sendRedirect("login.jsp");
			return;
		}
		User user = (User)obj;
		int uid = user.getUid();
		String sidstr = request.getParameter("bid");
		String numstr = request.getParameter("num");
		if(null == sidstr && !sidstr.equals("") || null == numstr && !numstr.equals("")) {
			response.sendRedirect("index.jsp");
			return;
		}
		int sid = Integer.parseInt(sidstr);
		int num = Integer.parseInt(numstr);
	
		GameService bs = new GameService();
		bs.updateShop(uid, sid, num);
		// 跳转到购物车页面
		request.getRequestDispatcher("shopcart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
