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
		<title>管理员页面</title>
		<style>
			h1{text-align: center;}
			#user{
				font-size: 20px;
				padding-left: 30px;
			}
			table{
				font-size: 20px;
				margin: 20px auto;
			}
			td,th{
				width: 140px;
				height: 40px;
				text-align: center;
			}
			th{
				background-color: yellow;
			}
			tr:nth-child(2n+2){
				background-color: skyblue;
			}
			tr:nth-child(2n+1){
				background-color: white;
			}
			button{
				font-size: 20px;
				margin-left: 155px;
				margin-top: 10px;
			}
		</style>
	</head>
	<body bgcolor="lightgreen">
		<h1>游戏网</h1>
		<%@ include file="nologin.jsp" %>
		<div id="user">
			你好，<%=user.getUname() %>
			<a href="index.jsp?flag=exit">退出</a>
		</div>
		<hr size="5" color="green" />
		<button onclick="location.href='insertgame.jsp';">+添加游戏</button>
		<%
			int pageSize = 4;
			int count = 0;
			int pageNum = 1;
			String pn = request.getParameter("pn"); // "3"
			if(null != pn){
				pageNum = Integer.parseInt(pn);
			}
			int pageCount = 0;
			GameService bs = new GameService();
			List<Game> games = bs.findAllGame();
			count = games.size();
			pageCount = count%pageSize==0?count/pageSize:count/pageSize+1;
			int begin = (pageNum-1)*pageSize;
			int end = pageNum==pageCount?count-1:pageNum*pageSize-1;
		%>
		<table border="1">
			<tr>
				<td colspan="7">
					每页显示<%=pageSize %>条，共<%=count %>条， 当前是第<%=pageNum %>页，共<%=pageCount %>页。
				</td>
			</tr>
			<tr>
				<th>编号</th>
				<th>游戏名</th>
				<th>价格</th>
				<th>类型</th>
				<th>平台</th>
				<th>操作</th>
			</tr>
			<%
				for(int i=begin;i<=end;i++){
					Game game = games.get(i);
			%>
				<tr>
					<td><%=game.getSid() %></td>
					<td><%=game.getSname() %></td>
					<td><%=game.getPrice() %></td>
					<td><%=game.getMaker() %></td>
					<td><%=game.getType() %></td>
					<td>
						<a href="#">修改</a>
						<a href="deleteBook?bid=<%=game.getSid() %>">删除</a>
					</td>
				</tr>
			<%		
				}
			%>
			<tr>
				<td colspan="7">
				<%
					if(pageNum==1){ // 第一页
				%>	
						首页 上一页	
				<%		
					}else{
				%>
						<a href="admin.jsp?pn=1">首页</a>
						<a href="admin.jsp?pn=<%=pageNum-1 %>">上一页</a>
				<%		
					}
				%>
				<%
					if(pageNum==pageCount){ // 最后一页
				%>	
						下一页 末页	
				<%		
					}else{
				%>
						<a href="admin.jsp?pn=<%=pageNum+1 %>">下一页</a>
						<a href="admin.jsp?pn=<%=pageCount %>">末页</a>
				<%		
					}
				%>
				
				
				
				</td>
			</tr>
		</table>
	</body>
</html>




























