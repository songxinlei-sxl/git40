<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			h1{text-align: center;}
			table{
				margin: 20px auto;
			}
			td{
				width: 280px;
				height: 50px;
				text-align: center;
				font-size: 20px;
			}
			.wh{
				width: 200px;
				height: 30px;
				font-size: 20px;
			}
			.big{
				font-size:20px;
			}
		</style>
	</head>
	<body bgcolor="lightgreen">
		<h1>欢迎访问博览群书</h1>
		<hr size="5" color="green" />
		<%
			// Cookie
			String uname = "";
			String upass = "";
			Cookie[] cks = request.getCookies();
			if(null != cks){
				for(Cookie ck: cks){
					if(ck.getName().equals("USERNAME")){
						uname = ck.getValue();
						// 中文解码
						uname = URLDecoder.decode(uname,"UTF-8");
					}
					if(ck.getName().equals("PASSWORD")){
						upass = ck.getValue();
					}
				}
			}
		%>
		<form action="login" method="post" onsubmit="return checkuser();">
			<table border="1">
				<tr>
					<td>用户名</td>
					<td>
						<input type="text" name="username" class="wh" value="<%=uname %>" placeholder="请输入用户名" />
					</td>
				</tr>
				<tr>
					<td>密码</td>
					<td>
						<input type="password" name="password" class="wh" value="<%=upass %>" placeholder="请输入4-20位密码" />
					</td>
				</tr>
				<tr>
					<td>身份</td>
					<td>
						<input type="radio" name="identity" value="0" checked />会员
						<input type="radio" name="identity" value="1" />管理员
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="rem" />记住密码<br/>
						<input type="submit" class="big" value="登录" />
						<input type="reset" class="big" value="取消" />
						<a href="register.jsp">用户注册</a>
					</td>
				</tr>
			</table>
		</form>
		<script>
			// 获取用户名和密码框
			var user_input = document.getElementsByName("username")[0];
			var pass_input = document.getElementsByName("password")[0];
			// 如果之前记住密码，需要自动勾选记住密码框
			var username = "<%=uname %>";
			var password = "<%=upass %>";
			var rem_input = document.getElementsByName("rem")[0];
			if(username != "" && password != ""){
				// 说明之前记住密码
				rem_input.checked = true;
			}
			
			// 在前端进行基本规则验证
			function checkuser(){
				// 获取用户名和密码文本
				var user_txt = user_input.value;
				var pass_txt = pass_input.value;
				// 账号 2-20
				if(user_txt.length<2 || user_txt.length>20){
					alert("用户名不正确");
					return false;
				}
				// 密码 4-20
				if(pass_txt.length<4 || pass_txt.length>20){
					alert("密码长度不符合要求");
					return false;
				}
				//  必须同时包含字母和数字
				var numberCount = 0;
				var letterCount = 0;
				for(var i=0;i<pass_txt.length;i++){
					var ch = pass_txt.charAt(i);
					if(ch>='0' && ch<='9'){
						numberCount++;
					}
					if(ch>='a' && ch<='z' || ch>='A' && ch<='Z'){
						letterCount++;
					}
				}
				if(numberCount==0 || letterCount==0){
					alert("密码必须同时包含字母和数字");
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>

















































