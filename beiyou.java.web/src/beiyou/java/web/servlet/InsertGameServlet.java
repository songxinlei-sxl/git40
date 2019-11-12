package beiyou.java.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beiyou.java.web.service.GameService;
import beiyou.java.web.vo.Game;


public class InsertGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收页面的所有数据
		String sname = request.getParameter("sname");
		String details = request.getParameter("details");
		String type = request.getParameter("type");
		String maker = request.getParameter("maker");
		String countstr = request.getParameter("count");
		int count = Integer.parseInt(countstr);
		String src = request.getParameter("src");
		String desc = request.getParameter("desc");
		String pricestr = request.getParameter("price");
		double price = Double.parseDouble(pricestr);
		
		Game game = new Game(count, sname, details, type, maker, count, src, desc, price);
		GameService bs = new GameService();
		bs.insertGame(game);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
