<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>支付成功</title>
	<link rel="stylesheet" href="/static/particle/css/style.css" media="screen" type="text/css" />
	<link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
</head>
<body>
	<canvas id="text" width="500" height="100"></canvas>
	<canvas id="stage" width="500" height="100"></canvas>
	<input type="hidden"  id="inputText" value="pay success!"/>
	<input type="submit" value="回到首页" onclick="window.location.href='index'">
	<script src='/static/particle/js/EasePack.min.js'></script>
	<script src='/static/particle/js/TweenLite.min.js'></script>
	<script src='/static/particle/js/easeljs-0.7.1.min.js'></script>
	<script src='/static/particle/js/requestAnimationFrame.js'></script>
	<script src="/static/particle/js/index.js"></script>
</body>
</html>