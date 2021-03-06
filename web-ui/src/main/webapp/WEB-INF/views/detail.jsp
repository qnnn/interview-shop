<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf8">
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="/static/css/detail.css" charset="utf-8"/>
    <script type="text/javascript" src="/static/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="/static/js/index.js"></script>
    <link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
    <link rel="stylesheet" type="text/css" href="/static/css/dialog.css" />
    <link rel="stylesheet" href="/static/layui/css/layui.css" />
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<!--商品信息-->
<div id="xianshi" class="all_width">
    <div id="xianshi_content">
        <span class="text">
            <a href="index">首页</a>
        </span>
        <span class="text">
            >
        </span>
        <span class="text">
            商品详情
        </span>
    </div>
</div>
<div id="good" class="all_width">
    <div id="good_menu">
        <div id="good_menu_picture">
            <div class="good_picture">
                <img src="${productInfo.img1}" width="69" height="69" onclick="changeImg('${productInfo.img1}')">
            </div>
            <div class="good_picture">
                <img src="${productInfo.img2}" width="69" height="69" onclick="changeImg('${productInfo.img2}')">
            </div>
            <div class="good_picture">
                <img src="${productInfo.img3}" width="69" height="69" onclick="changeImg('${productInfo.img3}')">
            </div>
            <div class="good_picture">
                <img src="${productInfo.img4}" width="69" height="69" onclick="changeImg('${productInfo.img4}')">
            </div>
        </div>
        <div id="good_menu_type">
            <div id="good_menu_type_picture1">
                <img id="imgId" src="${productInfo.img1}" width="467" height="467">
            </div>
        </div>
        <br><br>
        <div id="good_menu_list">
            <h1>${productInfo.name} </h1>
            <br>
            <p>${productInfo.describe}</p>
            <br>
            <div id="xiao_zong">
                <div id="xiao">
                    <div id="xiao_picture1">&#8195;已售：${productInfo.soldNum}</div>
                    <div id="xiao_picture2">&#8195;库存：${productInfo.stockNum}</div>
                </div>
            </div>
            <br>
            <div class="price">
                <div id="xiao2">
                    ￥${productInfo.price}
                    <span class="yuan">元</span>
                </div>
            </div>
            <div id="xiao5">
                <input id="xiao3" type="button" onclick="window.location.href='addCart?productId=${productInfo.id}'" value="加入购物车"/>
                <input id="xiao4" type="button" onclick="window.location.href='cart'" value="立即购买">
            </div>
        </div>
    </div>
</div>
</body>
</html>