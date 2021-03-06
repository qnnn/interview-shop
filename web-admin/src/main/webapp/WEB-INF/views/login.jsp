<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head th:replace="admin/_fragments :: head(~{::title})">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品后台登录</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="/static/assets/css/me.css">
    <link rel="icon" href="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=565509049,1683957450&fm=26&gp=0.jpg">
</head>
<body background: url()>


<br>
<br>
<br>
<div class="m-container-small m-padded-tb-massive " style="max-width: 30em !important;">
    <div class="ur container">
        <div class="ui middle aligned center aligned grid">
            <div class="column">
                <h2 class="ui teal image header">
                    <div class="content">
                        管理后台登录
                    </div>
                </h2>
                <form class="ui large form" method="post" action="/login">

                    <div class="ui  segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="email" placeholder="邮箱" value="${email}">
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="password" placeholder="密码" value="${password}">
                            </div>
                        </div>
                        <button class="ui fluid large teal submit button">登   录</button>
                    </div>

                    <div class="ui error mini message"></div>
                    <div class="ui mini negative message" ${message==null?"style='display:none;'":""}>
                        用户名或密码错误
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--/*/<th:block th:replace="_fragments :: script">/*/-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<!--/*/</th:block>/*/-->

<script>
    $('.ui.form').form({
        fields : {
            username : {
                identifier: 'email',
                rules: [{
                    type : 'empty',
                    prompt: '请输入邮箱'
                }]
            },
            password : {
                identifier: 'password',
                rules: [{
                    type : 'empty',
                    prompt: '请输入密码'
                }]
            }
        }
    });
</script>

</body>
</html>
