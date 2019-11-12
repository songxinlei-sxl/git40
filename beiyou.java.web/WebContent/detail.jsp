<%@page import="beiyou.java.web.vo.Game"%>
<%@page import="beiyou.java.web.service.GameService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			h1,h2{text-align: center;}
			table{
				font-size: 20px;
				margin-left: 100px;
			}
			td{
				width: 350px;
				height: 50px;
				padding-left: 30px;
			}
			td img{
				display: block;
				width: 90%;
				height: 800%;
				margin: 0 auto;
			}
			#num{
				width: 50px;
				height: 20px;
				font-size: 20px;
			}
			.big{
				font-size: 20px;
			}
			a{
				font-size: 20px;
				margin-left: 30px;
				text-decoration: none;
			}
		</style>
	</head>
	<body bgcolor="lightgreen">
		<h1>游戏详情</h1>
		<a href="index.jsp">首页</a>
		<hr size="5" color="green" />
		<%
			String sidstr = request.getParameter("sid");
			if(null == sidstr){
				response.sendRedirect("index.jsp");
				return;
			}
			int sid = Integer.parseInt(sidstr);
			GameService bs = new GameService();
			Game game = bs.findGameById(sid);
			session.setAttribute("page", "detail.jsp?sid=" + sid);
		%>
		<form action="updateShopcart" method="post">
			<table>
				<tr>
					<td rowspan="8">
						<img src="<%=game.getSrc() %>" />
					</td>
					<td>
						编号: <%=game.getSid() %>
						<input type="hidden" name="sid" value="<%=game.getSid() %>" />
					</td>
				</tr>
				<tr>
					<td>游戏名: <%=game.getSname() %></td>
				</tr>
				<tr>
					<td>类型: <%=game.getType() %></td>
				</tr>
				<tr>
					<td>价格: <%=game.getPrice() %></td>
				</tr>
				<tr>
					<td>平台: <%=game.getMaker() %></td>
				</tr>
				<tr>
					<td>
						数量: <input type="number" id="num" name="num" value="1" min="1" />部
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" class="sig" value="立即购买" />
						<input type="submit" class="sig" value="添加购物车" >
					</td>
				</tr>
			</table>
		</form>
		<hr size="5" color="green" />
		<h2>内容简介</h2>
		<%=game.getDesc() %>
		<br/><br/><br/><br/><br/><br/>
		<script>
			var num_input = document.getElementById("num");
			num_input.onblur = function(){
				if(this.value == null || this.value == ""){
					this.value = 1;
				}
			}
			num_input.onkeydown = function(ev){
				var keyCode = ev.keyCode;
				var ch = String.fromCharCode(keyCode);
				if(ch>='0' && ch<='9' || keyCode==8 || keyCode==37 || keyCode==39){
					return true;
				}
				return false;
			}
		
		</script>
	</body>
</html>










