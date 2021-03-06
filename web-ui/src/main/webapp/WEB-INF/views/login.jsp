<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>登录|注册</title>
    <link rel="stylesheet" href="/static/css/login.css">
    <link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
</head>
<body>
    <div class="main" id="main">
        <div class="form-container sign-up-container">
            <form action="register" method="post">
                <h1>注 册</h1>
                <span>&nbsp;</span>
                <input type="email" name="email" placeholder="电子邮箱">
                <input type="text" name="username" placeholder="用户名">
                <input type="password" name="password" placeholder="密 码">
                <c:if test="${registerBaseResult == null}">
                    <div>&nbsp;</div>
                </c:if>
                <c:if test="${registerBaseResult != null}">
                    <div class="red">${registerBaseResult.message}</div>
                </c:if>
                <button type="submit">注 册</button>
                <a type="button" onclick="window.location.href='index'">返回首页</a>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="login" method="post">
                <h1>登 录</h1>
                <span>&nbsp;</span>
                <input type="email" name="username" placeholder="电子邮箱">
                <input type="password" name="password" placeholder="密 码">
                <c:if test="${loginBaseResult == null}">
                    <div>&nbsp;</div>
                </c:if>
                <c:if test="${loginBaseResult != null}">
                    <div class="red">${loginBaseResult.message}</div>
                </c:if>
                <button type="submit">登 录</button>
                <a type="button" onclick="window.location.href='index'">返回首页</a>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>已有帐号？</h1>
                    <p>请使用您的帐号进行登录</p>
                    <button class="switcher" id="btnLogin">登 录</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>没有帐号？</h1>
                    <p>立即注册加入我们，和我们一起开始旅程吧</p>
                    <button class="switcher" id="btnRegister">注 册</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    const container = document.getElementById('main');
    const btnRegister = document.getElementById('btnRegister');
    const btnLogin = document.getElementById('btnLogin');


    btnRegister.addEventListener('click', function () {
        container.classList.add('right-panel-active')
    })

    btnLogin.addEventListener('click', function () {
        container.classList.remove('right-panel-active')
    })

</script>

</html>
