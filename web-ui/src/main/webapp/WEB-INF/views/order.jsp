<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ch">
<head>
    <meta charset="utf-8"/>
    <title>我的订单</title>
    <link type="text/css" href="/static/css/index_style.css" rel="stylesheet" charset="utf-8"/>
    <link type="text/css" href="/static/css/order.css" rel="stylesheet" charset="utf-8"/>
    <link rel="icon" href="/static/images/favicon.ico" rel="icon" type="image/x-ico">
    <script type="text/javascript" src="/static/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.SuperSlide.2.1.1.js" ></script>
    <script type="text/javascript" src="/static/layui/extend/city-picker/city-picker.data.js"></script>
    <script type="text/javascript" src="/static/layui/layui.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/layui/extend/city-picker/city-picker.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/dialog.css" />
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="main">
    <!--订单名-->
    <c:if test="${status==1}">
        <div class="order_title">
            <a class="cur_page" href="order?status=1">待付款</a>
            <span class="partition"></span>
            <a href="order?status=2">待发货</a>
            <span class="partition"></span>
            <a href="order?status=3">运输中</a>
            <span class="partition"></span>
            <a href="order?status=4">购买历史</a>
        </div>
    </c:if>
    <c:if test="${status==2}">
        <div class="order_title">
            <a href="order?status=1">待付款</a>
            <span class="partition"></span>
            <a class="cur_page" href="order?status=2">待发货</a>
            <span class="partition"></span>
            <a href="order?status=3">运输中</a>
            <span class="partition"></span>
            <a href="order?status=4">购买历史</a>
        </div>
    </c:if>
    <c:if test="${status==3}">
        <div class="order_title">
            <a href="order?status=1">待付款</a>
            <span class="partition"></span>
            <a href="order?status=2">待发货</a>
            <span class="partition"></span>
            <a class="cur_page" href="order?status=3">运输中</a>
            <span class="partition"></span>
            <a href="order?status=4">购买历史</a>
        </div>
    </c:if>
    <c:if test="${status==4}">
        <div class="order_title">
            <a href="order?status=1">待付款</a>
            <span class="partition"></span>
            <a href="order?status=2">待发货</a>
            <span class="partition"></span>
            <a href="order?status=3">运输中</a>
            <span class="partition"></span>
            <a class="cur_page" href="order?status=4">购买历史</a>
        </div>
    </c:if>
    <!--订单页显示内容循环-->
    <div class="order_content">
        <!--当没有订单时，在待支付页显示图片提示-->
        <c:if test="${status==1&&orderLists==null}">
            <div class="noOrder">
                <a href="index"><img src="/static/images/kongchaxun.png" width="1230" height="630"/></a>
            </div>
        </c:if>
        <!--有订单时，显示待支付订单列表-->
        <c:if test="${status==1&&orderLists!=null}">
            <c:forEach items="${orderLists}" var="orderList" varStatus="idxStatus">
                <div class="order_info">
                    <div class="order_head">
                        <div class="help_info">等待付款</div>
                        <div class="order_content">
                            <span>订单号：${orderList.get(0).orderNo}</span>
                            <span>${sessionScope.username}</span>
                            <span>在线支付</span>
                        </div>
                        <div class="order_money">
                            <span>共 <span class="money">${orderList.get(0).allNumber}</span>件商品 应付金额：<span class="money">${orderList.get(0).allPrice}</span>元</span>
                        </div>
                    </div>
                    <div class="order_list">
                        <c:forEach items="${orderList}" var="order">
                            <div class="order_item">
                                <div class="pic"><img src="${order.imgUrl}" width="80" height="80"/></div>
                                <div class="detail">${order.productName}</div>
                                <div class="price">${order.price}元</div>
                                <div class="num">x${order.number}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="submit">
                        <input class="go_pay" type="button" onclick="payOrder('${orderList.get(0).receivingInfoId}', '${orderList.get(0).orderNo}')" value="支付订单"/>
                        <input class="delete" type="button" onclick="window.location.href='deleteOrder?orderNo=${orderList.get(0).orderNo}'" value="删除订单"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!--当没有订单时，在待发货页显示图片提示-->
        <c:if test="${status==2&&orderLists==null}">
            <div class="noOrder">
                <a href="index"><img src="/static/images/kongchaxun.png" width="1230" height="630"/></a>
            </div>
        </c:if>
        <!--显示待发货订单列表-->
        <c:if test="${status==2&&orderLists!=null}">
            <c:forEach items="${orderLists}" var="orderList" varStatus="idxStatus">
                <div class="order_info" style="border: 1px solid #9de0fe;">
                    <div class="order_head" style="background: rgba(157,224,254,0.4);">
                        <div class="help_info">等待发货</div>
                        <div class="order_content">
                            <span>支付宝在线支付</span>
                        </div>
                        <div class="order_money">
                            <span>支付金额：<span class="money">${orderList.get(0).allPrice}</span>元</span>
                        </div>
                    </div>
                    <div class="order_list">
                        <c:forEach items="${orderList}" var="order">
                            <div class="order_item">
                                <div class="pic"><img src="${order.imgUrl}" width="80" height="80"/></div>
                                <div class="detail">${order.productName}</div>
                                <div class="price">${order.price}元</div>
                                <div class="num">x${order.number}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="submit">
                        <input class="go_pay" type="button" value="提醒发货"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!--当没有订单时，在运输中页显示图片提示-->
        <c:if test="${status==3&&orderLists==null}">
            <div class="noOrder">
                <a href="index"><img src="/static/images/kongchaxun.png" width="1230" height="630"/></a>
            </div>
        </c:if>
        <!--显示运输中订单列表-->
        <c:if test="${status==3&&orderLists!=null}">
            <c:forEach items="${orderLists}" var="orderList" varStatus="idxStatus">
                <div class="order_info" style="border: 1px solid #9de0fe;">
                    <div class="order_head" style="background: rgba(157,224,254,0.4);">
                        <div class="help_info">已发货</div>
                        <div class="order_content">
                            <span>快递货单号：${orderList.get(0).trackingNo}</span>
                        </div>
                        <div class="order_money">
                            <span>支付金额：<span class="money">${orderList.get(0).allPrice}</span>元</span>
                        </div>
                    </div>
                    <div class="order_list">
                        <c:forEach items="${orderList}" var="order">
                            <div class="order_item">
                                <div class="pic"><img src="${order.imgUrl}" width="80" height="80"/></div>
                                <div class="detail">${order.productName}</div>
                                <div class="price">${order.price}元</div>
                                <div class="num">x${order.number}</div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="submit">
                        <input class="go_pay" type="button" onclick="window.location.href='confirmReceipt?orderNo=${orderList.get(0).orderNo}'" value="确认收货"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <!--当没有订单时，在购买历史页显示图片提示-->
        <c:if test="${status==4&&orderLists==null}">
            <div class="noOrder">
                <a href="index"><img src="/static/images/kongchaxun.png" width="1230" height="630"/></a>
            </div>
        </c:if>
        <!--显示购买历史订单列表-->
        <c:if test="${status==4&&orderLists!=null}">
            <c:forEach items="${orderLists}" var="orderList" varStatus="idxStatus">
                <div class="order_info" style="border: 1px solid #9de0fe;">
                    <div class="order_head" style="background: rgba(157,224,254,0.4);">
                        <div class="help_info">购买历史</div>
                        <div class="order_content">
                            <span>购买时间：${orderList.get(0).created}</span>
                        </div>
                        <div class="order_money">
                            <span>支付金额：<span class="money">${orderList.get(0).allPrice}</span>元</span>
                        </div>
                    </div>
                    <div class="order_list">
                        <c:forEach items="${orderList}" var="order">
                            <div class="order_item">
                                <div class="pic"><img src="${order.imgUrl}" width="80" height="80"/></div>
                                <div class="detail">${order.productName}</div>
                                <div class="price">${order.price}元</div>
                                <div class="num">x${order.number}</div>
                                <div class="submit">
                                    <input class="go_pay" type="button" onclick="window.location.href='index'" value="回到首页"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<form action="payOrder" class="layui-form" method="post">
    <div class="layui-form" id="pay" style="display: none; width: 650px; position: relative; top:10%;">
        <input type="hidden" id="orderNo" name="orderNo"/>
        <input type="hidden" id="id" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" placeholder="请填写姓名（必填）" class="layui-input" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="tel" name="userPhone" placeholder="请填写手机号码（必填）" class="layui-input" lay-verify="phone">
            </div>
        </div>
        <div class="layui-form-item layui-col-md8">
            <label class="layui-form-label">所在地区</label>
            <div class="layui-input-block">
                <input type="text" name="userLocation" style="width: 520px" utocomplete="on" required lay-verify="required" class="layui-input" id="address" readonly="readonly" data-toggle="city-picker" placeholder="请选择">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">详细地址</label>
            <div class="layui-input-block">
                <input type="text" name="userAddress" lay-verify="required" placeholder="请填写详细地址（必填）" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">留言</label>
            <div class="layui-input-block">
                <textarea name="userMessage" class="layui-textarea" placeholder="请填写留言" style="min-height:60px; height: 160px"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn orderbtn" lay-submit lay-filter="payForm" id="LAY-back-submit" >立即提交订单</button>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    function payOrder(receivingInfoId, orderNo) {
        console.log(receivingInfoId, orderNo)
        $("#orderNo").attr("value",orderNo);
        $("#id").attr("value",receivingInfoId);
        layui.extend({
            citypicker:'{/}./static/layui/extend/city-picker/city-picker'
        }).use(['jquery','citypicker','form','layer'],function(){
            var $ = layui.$,
                form = layui.form,
                citypicker = layui.citypicker,
                layer = parent.layer === undefined ? layui.layer : top.layer;

            var cityPicker = new citypicker("#address",{
                provincename:"provinceId",
                cityname:"cityId",
                districtname: "districtId",
                level: 'districtId',// 级别
            })
            layer.open({
                skin : 'layui-layer-molv',
                type : 1,
                title : '填写收货信息',
                offset:['80px'],
                area : [ '700px', '560px' ],
                shade : 0.8, // 遮罩层透明度
                id : 'LAY_layuipro', //设定一个id，防止重复弹出
                resize : false, //是否允许拉伸
                // btn : [ '确认', '关闭' ],
                moveType : 1, //拖拽模式，0或者1
                content :  $('#pay'),
                // yes: function(index, layero){  // 确认按钮回调方法,两个参数分别为当前层索引、当前层DOM对象
                //     layer.msg('数据请求中,请稍候...', {icon: 16, scrollbar: false, time: 0, shade: [0.8, '#393D49']});
                // }
            });
            //监听提交
            // form.on('submit(payForm)', function(data){
            //     layer.msg('数据请求中,请稍候...', {icon: 16, scrollbar: false, time: 0, shade: [0.8, '#393D49']});
            // });
        })
    }
</script>
</body>
</html>

