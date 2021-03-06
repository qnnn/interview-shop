<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ch">
<head>
    <meta charset="UTF-8"/>
    <title>Web购物商城</title>
    <link type="text/css" href="/static/css/index.css" rel="stylesheet" charset="utf-8"/>
    <script type="text/javascript" src="/static/js/jquery-3.5.1.min.js"></script>
    <link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
    <link rel="stylesheet" type="text/css" href="/static/css/dialog.css" />
    <link rel="stylesheet" href="/static/layui/css/layui.css" />
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>
    <!--商品栏-->
    <div id="good" class="all_width">
        <div id="good_menu">
            <div id="good_background"></div>
            <div id="good_menu_type">
                <c:forEach items="${productCategories}" var="productCategory" end="7">
                    <div class="good_menu_type_name" onclick="window.location.href='index?productCategoryId=${productCategory.id}'">
                            ${productCategory.name}
                        <span>></span>
                    </div>
                </c:forEach>
                <div class="good_menu_type_name_detail">
                    <!--八个产品-->
                    <div class="good_item_list">
                        <c:forEach items="${products}" var="product"  end="7">
                            <div class="good_item">
                                <div class="good_item_new"></div>
                                <div class="good_item_img">
                                    <a href="detail?id=${product.id}" target="_self"><img src="${product.img1}" width="160" height="160"/></a>
                                </div>
                                <div class="good_item_name">
                                        ${product.name}
                                </div>
                                <div class="good_item_price">
                                        ${product.price}元
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${products==null}">
                            <div id="good_item_list">
                                <img src="/static/images/kongchaxun.png" />
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
