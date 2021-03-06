<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf8">
    <title>购物车</title>
    <link type="text/css" rel="stylesheet" href="/static/css/cart.css" charset="utf-8"/>
    <script type="text/javascript" src="/static/js/jquery-3.5.1.min.js"></script>
    <link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
    <script>
        window.onload = function main() {

            /*sub.onclick = function () {
                buy_num.value = parseInt(buy_num.value) - 1;
            }

            add.onclick = function () {
                buy_num.value = parseInt(buy_num.value) + 1;
            }*/
        }
    </script>
</head>
<body>

<!--头部显示栏-->
<div class="header">
    <div class="header_main">
        <div class="left">
            <img src="/static/images/shop.png"
                 onclick="window.location.href='index'" width="55" height="55">
            <div class="header_text">我的购物车</div>
        </div>
        <div class="right">
            <span class="user_order"><a href="order?status=1">我的订单</a></span>
            <span class="user_order"><a href="index">首页</a></span>
            <span class="user_name"><a href="">${sessionScope.username}</a></span>
        </div>
    </div>
</div>
<!--主要显示栏-->
<div class="main">
    <div class="cart_header">
        <div class="header_text"></div>
        <div class="user_name"></div>
        <div class="my_order"></div>
    </div>
    <c:if test="${cartList==null}">
        <div class="nocart">
            <img src="/static/images/kongCart.png" width="1230" height="490">
            <input class="buy" onclick="window.location.href='index'" value="马上去购物">
        </div>
    </c:if>
    <c:if test="${cartList!=null}">
        <div class="order_head">
            <div class="head_select">
                <c:if test="${allFlag==true}">
                    <span onclick="window.location.href='select'" style="cursor: pointer">
                        <img src="/static/images/checked.png" style="margin-top: 23px" width="18" height="18">
                    </span>
                </c:if>
                <c:if test="${allFlag==false}">
                    <span onclick="window.location.href='select'" style="cursor: pointer">
                        <img src="/static/images/kong.png" style="margin-top: 23px" onmouseenter="this.src='/static/images/hover.png';"
                             onmouseleave="this.src='/static/images/kong.png'"
                             width="18" height="18">
                    </span>
                </c:if>
            </div>
            <div class="head_pic">预览图</div>
            <div class="head_name">商品名称</div>
            <div class="head_price">单价</div>
            <div class="head_num">数量</div>
            <div class="head_small_price">小计</div>
            <div class="head_delete">操作</div>
        </div>
        <c:forEach items="${cartList}" var="cart">
            <div class="order_item">
                <div class="select">
                    <c:if test="${cart.flag==1}">
                        <img src="/static/images/checked.png" onclick="window.location.href='select?id=${cart.id}'"
                             width="18" height="18">
                    </c:if>
                    <c:if test="${cart.flag==0}">
                        <img src="/static/images/kong.png" onclick="window.location.href='select?id=${cart.id}'"
                             onmouseenter="this.src='/static/images/hover.png';" onmouseleave="this.src='/static/images/kong.png'"
                             width="18" height="18">
                    </c:if>
                </div>
                <div class="pic"><img src="${cart.imgUrl}" width="80" height="80"/></div>
                <div class="detail">${cart.productName}</div>
                <div class="price">${cart.price}元</div>
                <div class="num">
                    <a id="divNum" href="subNum?id=${cart.id}&&num=${cart.number}">
                        <input id="sub" type="button" value="-">
                    </a>
                    <input id="buy_num" type="text" disabled="disabled" value="${cart.number}" style="cursor: text" name="buy_num" width="90">
                    <a href="addNum?id=${cart.id}">
                        <input id="add" type="button" value="+">
                    </a>
                </div>
                <div class="small_price">${cart.totalPrice}元</div>
                <div class="delete">
                    <div class="delete_content" onclick="window.location.href='deleteCart?id=${cart.id}'">X</div>
                </div>
            </div>
        </c:forEach>
        <div class="pay">
            <div class="pay_info">
                <span><a class="go_index" href="index">继续购物</a></span>
                <span class="static">共<span class="baby_count">${allNum}</span>件商品，已选择<span
                        class="baby_count">${selectNum}</span>件</span>
            </div>
            <div class="pay_btn">
                <input class="go_pay" type="button" onclick="window.location.href='submitOrder'" value="提交订单"/>
                <span class="money_info">合计：<span class="all_money">${allPrice}</span>元</span>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>
