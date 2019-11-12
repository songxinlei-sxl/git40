<%@page import="beiyou.java.web.vo.Game"%>
<%@page import="java.util.List"%>
<%@page import="beiyou.java.web.service.GameService"%>
<%@page import="beiyou.java.web.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			a{text-decoration: none;}
			#head{
				font-size: 20px;
				text-align: right;
				margin-top: 20px;
				padding-right: 50px;
			}
			.book{
				width: 20%;
				height: 380px;
				float: left;
				margin: 20px 30px;
			}
			.book img{
				display: block;
				margin: 0 auto;
			}
			.book div{
				font-size: 20px;
				text-align: center;
				margin-top: 10px;
			}
			.center{text-align: center;}
			hr{clear: both;}
			#foot{
				font-size: 20px;
				text-align: center;
			}
		</style>
	</head>
	<body bgcolor="lightgreen">
		<div id="head">
		<%
			String flag = request.getParameter("flag");
			if(null != flag && flag.equals("exit")){
				session.invalidate();
				session = request.getSession(true);
			}
			Object obj = session.getAttribute("USER");
			if(null == obj){ 
		%>
				请<a href="login.jsp">登录</a>或<a href="register.jsp">注册</a>
		<%		
			}else{ 
				User user = (User)obj;
		%>
				你好，<%=user.getUname() %>
				<a href="index.jsp?flag=exit">退出</a>
		<%		
			}
		%>
			<a href="shopcart.jsp">购物车</a>
			<a href="history.jsp">所有订单</a>
		</div>
		<h1 class="center">泰坦网络</h1>
		<hr size="5" color="green" />
		<%
		GameService bs = new GameService();
			List<Game> games = bs.findAllGame();
			for(Game game: games){
		%>	
			<div class="game">
				<a href="detail.jsp?bid=<%=game.getSid() %>">
					<img src="<%=game.getSrc() %>" />
				</a>
				<div>
					游戏名: <%=game.getSname() %><br/>
					价格:￥<%=game.getPrice() %>元
				</div>
			</div>
		<%		
			}
		%>
		<hr size="5" color="green" />
		<div id="foot">
			公司地址：西安市长安北路体育场<br/>
			电话：029-12345678<br/>
			©泰坦网络 <br/><br/><br/><br/><br/><br/><br/>
		</div>
	</body>
</html>






















