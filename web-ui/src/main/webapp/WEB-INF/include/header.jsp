<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/static/js/jquery-3.5.1.js"></script>
<script src="/static/js/dialog.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<div id="top" class="all_width">
    <div id="top_menu">
        <div id="top_menu_left" class="top_menu_left_a">
            <div><a href="">Web购物商城</a></div>
            <div><a href="about">关于</a></div>
        </div>
        <div id="top_menu_right" class="top_menu_right_a">
            <c:if test="${tbUser == null}">
                <div><a href="login" target="_blank" class="buy_car">购物车</a></div>
                <div><a href="login">登陆&nbsp;|&nbsp;注册</a></div>
            </c:if>
            <c:if test="${tbUser != null}">
                <div><a href="cart" target="_blank" class="buy_car">购物车（${chatNum}）</a></div>
                <div><a href="order?status=1">我的订单</a></div>
                <div><a href="logout">退出</a></div>
                <div><a id="openDialog1">个人信息</a></div>
                <div>${tbUser.username}</div>
                <input type="hidden" id="username" value="${tbUser.username}"/>
                <input type="hidden" id="password" value="${tbUser.password}"/>
                <input type="hidden" id="phone" value="${tbUser.phone}"/>
                <input type="hidden" id="email" value="${tbUser.email}"/>
            </c:if>
        </div>
    </div>
</div>
<div id="search" class="all_width">
    <div id="search_content">
        <div id="search_content_log">
            <a href="index"><img src="/static/images/shop.png" width="55" height="55" style="position: relative;top:20px;left: 12px"></a>
        </div>
        <div id="shop_name">
            <a class="shop_name_key" href="index">723购物商城</a>
        </div>
        <div id="search_content_key">
            <div><a href="" class="search_content_key_word">手机</a></div>
            <div><a href="" class="search_content_key_word">笔记本</a></div>
            <div><a href="" class="search_content_key_word">电视</a></div>
            <div><a href="" class="search_content_key_word">笔记本</a></div>
            <div><a href="" class="search_content_key_word">家电</a></div>
            <div><a href="" class="search_content_key_word">路由器</a></div>
            <div><a href="" class="search_content_key_word">智能硬件</a></div>
            <div><a href="" class="search_content_key_word">服务</a></div>
            <div><a href="" class="search_content_key_word">社区</a></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var username = $("#username").val()
    var password = $("#password").val()
    var email = $("#email").val()
    var phone = $("#phone").val()
    $("#openDialog1").dialog({
        id: "superDialog", //必填,必须和已有id不同
        title: "个人信息", //对话框的标题 默认值: 我的标题
        type: 0, //0 对话框有确认按钮和取消按钮 1 对话框只有关闭按钮
        easyClose: true, // 点击遮罩层也可以关闭窗口,默认值false
        form: [{
            description: "用户名",
            type: "text",
            name: "username",
            value: username
        }, {
            description: "密码",
            type: "password",
            name: "password",
            value: ""
        }, {
            description: "邮箱",
            type: "email",
            name: "email",
            value: email
        }, {
            description: "电话",
            type: "phone",
            name: "phone",
            value: phone
        }], //form 是填充表单的数据,必填
        submit: function(data) {
            //data是表单收集的数据
            console.log(data);
            $.ajax({
                type: "post",
                url: "saveUserInfo",
                data: data,
                success:function(data){
                    console.log(data)
                    layui.use(['layer'],function(){
                        var $ = layui.$,
                            layer = parent.layer === undefined ? layui.layer : top.layer;
                        if(data == "501"){
                            layer.msg("用户名为空或格式有误(由数字、26个英文字母或者下划线组成)");
                        }else if(data == "502"){
                            layer.msg("密码为空或格式有误(密码的长度(6~18位))");
                        }else if(data == "503"){
                            layer.msg("邮箱为空或格式有误！");
                        }else if(data == "504"){
                            layer.msg("电话为空或格式有误！");
                        }else if(data == "success"){
                            layer.msg("修改成功！")
                        }
                    })

                }
            })

        }
    })
</script>
