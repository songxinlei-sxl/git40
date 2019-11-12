<%@page import="beiyou.java.web.vo.GameShop"%>
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
			h1{text-align: center;}
			#user{
				font-size: 20px;
				padding-left: 20px;
			}
			table{
				font-size: 20px;
				text-align: center;
				margin: 20px auto;
			}
			td,th{
				width: 180px;
				height: 40px;
			}
			a{
				font-size: 20px;
				margin-left: 30px;
			}
		</style>
	</head>
	<body bgcolor="lightgreen">
		<%
			Object obj = session.getAttribute("USER");
			if(null == obj){
				response.sendRedirect("login.jsp");
				return;
			}
			User user = (User)obj;
		%>
		<h1>购物车</h1>
		<div id="user">当前用户: <%=user.getUname() %></div>
		<hr size="5" color="green" />
		<table border="1">
			<tr>
				<th>
					<input type="checkbox" id="allSelected" />
					编号
				</th>
				<th>游戏名</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
			<%
				GameService bs = new GameService();
				// 当前登录用户的购物车信息
				List<GameShop> gameShops = bs.findGameShop(user.getUid());
				double total = 0; // 总价
				for(GameShop gameShop: gameShops){
					double subtotal = gameShop.getNum()*gameShop.getPrice();
					total += subtotal;
			%>		
				<tr>
					<td>
						<input type="checkbox" class="game" onclick="changeMoney(this,<%=subtotal %>);" />
						<%=gameShop.getSid() %>
					</td>
					<td><%=gameShop.getSname() %></td>
					<td><%=gameShop.getPrice() %></td>
					<td><%=gameShop.getNum() %></td>
					<td><%=subtotal %></td>
					<td>
						<a href="#">移除购物车</a>
					</td>
				</tr>	
			<%		
				}
			%>
			<tr>
				<td colspan="6">
					总计: <span id="cash">0.00</span>元
					<button>支付结算</button>
				</td>
			</tr>
		</table>
		<a href="index.jsp">继续购物</a>
		<script>
			// 获取全选框和所有的书的复选框
			var allSelected = document.getElementById("allSelected");
			var books = document.getElementsByClassName("book");
			var money_span = document.getElementById("cash");
			// 给全选框添加点击事件
			allSelected.onclick = function(){
				for(var i=0;i<books.length;i++){
					books[i].checked = this.checked;
				}
				// 改变总价
				if(this.checked){
					money_span.innerHTML = <%=total %>;
				}else{
					money_span.innerHTML = "0.00";
				}
			}
		
			// 操作复选框更新总价
			function changeMoney(book_input,subtotal){
				// book_input 点击的复选框
				// subtotal 点击的复选框对应的小计
				// 判断book_input的选中状态，勾选则在原来的总价基础上加上小计，反之减去小计
				// 获取当前总价
				var moneystr = money_span.innerHTML.trim();
				// string --> number
				var money = parseFloat(moneystr);
				console.log("当前总价:" + money);
				if(book_input.checked){ // 勾选
					money += subtotal;
				}else{ // 取消勾选
					money -= subtotal;
					// 任何一个复选框取消勾选，则将全选框取消勾选
					allSelected.checked = false;
				}
				money_span.innerHTML = money;
			}
		
		
		</script>
	</body>
</html>



























