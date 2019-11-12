<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加游戏</title>
	</head>
	<body>
		<h2>添加游戏</h2>
		<form action="insertGame" method="post">
			<!-- disabled 禁用 -->
			游戏名: <input type="text" name="bname" /><br/><br/>
			平台: <input type="text" name="author" /><br/><br/>
			类型: 
				<select name="type">
					<option hidden>类型</option>
					<option value="1">礼包</option>
					<option value="2">射击</option>
					<option value="3">动作</option>
					<option value="4">战争</option>
					<option value="5">武侠</option>
				</select>
			<br/><br/>
			平台: <input type="text" name="publisher" /><br/><br/>
			库存: <input type="number" name="count" min="1" /><br/><br/>
			图片路径: <input type="text" name="src" /><br/><br/>
			描述: <input type="text" name="desc" /><br/><br/>
			价格: <input type="text" name="price" /><br/><br/>
			<input type="submit" value="添加" />
			<input type="reset" />
		</form>
	</body>
</html>












