package beiyou.java.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beiyou.java.web.service.GameService;
import beiyou.java.web.vo.User;


public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");
		String rem = request.getParameter("rem");
		System.out.println("用户名:" + username);
		System.out.println("密码:" + password);
		System.out.println("身份:" + identity);
		System.out.println("记住密码:" + rem);
		// 2. 调用service方法，判断账号的正确性
		// 3. 根据账号的正确与否做相应的操作
		GameService bs = new GameService();
		if(bs.isRightUser(username, password)) {

			HttpSession session = request.getSession();
			User user = bs.findUserByName(username);
			session.setAttribute("USER", user);
			// 2. 记住密码的处理
			Cookie ckName = null;
			Cookie ckPass = null;
			if(null == rem) { // 没有勾选记住密码
				ckName = new Cookie("USERNAME", "");
				ckPass = new Cookie("PASSWORD", "");
			}else { // 勾选了记住密码
				ckName = new Cookie("USERNAME", URLEncoder.encode(username,"UTF-8"));
				ckPass = new Cookie("PASSWORD", password);
				ckName.setMaxAge(60*60*24*30);
				ckPass.setMaxAge(60*60*24*30);
			}
			response.addCookie(ckName);
			response.addCookie(ckPass);
			// 3. 根据身份做相应跳转
			// 选择了管理员并且账号是管理员账号，才能进入admin.jsp,否则进入index.jsp
			if(identity.equals("1") && bs.isAdmin(username)) {
				out.println("<script>alert('管理员登录成功');location.href='admin.jsp';</script>");
			}else {
				Object obj = session.getAttribute("page");
				String page = "";
				if(null == obj) {
					page = "index.jsp";
				}else {
					page = String.valueOf(obj);
				}
				out.println("<script>alert('会员登录成功');location.href='" + page + "';</script>");
			}
			
		}else {
			// 错误的用户，直接跳向登录页面
			out.println("<script>alert('登录失败');location.href='login.jsp';</script>");
		}
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
