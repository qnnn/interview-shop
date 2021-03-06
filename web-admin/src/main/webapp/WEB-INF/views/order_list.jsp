<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 订单管理</title>
    <jsp:include page="../includes/header.jsp"/>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                订单查询
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">控制面板</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- 牛逼 -->
                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <div class="box box-info box-info-search" style="display: none;">
                        <div class="box-header">
                            <h3 class="box-title">高级搜索</h3>
                        </div>
                        <div class="box-body">
                            <div class="row form-horizontal">
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">订单号</label>
                                        <div class="col-sm-8">
                                            <input id="orderId" class="form-control" placeholder="请输入订单号"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <label for="username" class="col-sm-4 control-label">用户名</label>
                                        <div class="col-sm-8">
                                            <input id="username" class="form-control" placeholder="请输入用户名"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <label for="productName" class="col-sm-4 control-label">商品名称</label>
                                        <div class="col-sm-8">
                                            <input id="productName" class="form-control" placeholder="请输入商品名称"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" class="btn btn-info pull-right" onclick="search();">搜索</button>
                        </div>
                    </div>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">订单列表</h3>
                        </div>
                        <div class="box-body">
                            <!-- 类选择器 .box-info-search -->
                            <button type="button" class="btn btn-sm btn-primary"
                                    onclick="$('.box-info-search').css('display') == 'none'?$('.box-info-search').show('fast'):$('.box-info-search').hide('fast')">
                                <i class="fa fa-search">搜索</i></button>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="dataTable" class="table table-hover" style="overflow-x: auto">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>订单号</th>
                                    <th>客户ID</th>
                                    <th>客户昵称</th>
                                    <th>客户手机号</th>
                                    <th>商品ID</th>
                                    <th>商品名称</th>
                                    <th>商品单价</th>
                                    <th>商品总价</th>
                                    <th>地区</th>
                                    <th>详细地址</th>
                                    <th>订单备注</th>
                                    <th>支付方式</th>
                                    <th>支付状态</th>
                                    <th>快递单号</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="../includes/copyright.jsp"/>
</div>

<jsp:include page="../includes/footer.jsp"/>

<!-- 自定义模态框 -->
<sys:modal/>

<script>
    var _dataTable;

    $(function () {
        var _columns = [
            {"data": "id"}, {"data": "orderNo"},
            {"data": "receivingInfo.tbUser.id"},
            {"data": "receivingInfo.tbUser.username"},
            {"data": "receivingInfo.tbUser.phone"},
            {"data": "product.id"},
            {"data": "product.name"},
            {"data": "product.price"},
            {"data": "totalPrice"},
            {"data": "receivingInfo.location"},
            {"data": "receivingInfo.address"},
            {"data": "receivingInfo.userMessage"},
            {"data": "payMethod"},
            {
                "data": function (row, type, val, meta) {
                    var message1 = "未支付";
                    var message2 = "已支付";
                    var message3 = "运输中";
                    var message4 = "订单结束"
                    if (row.status === 1) {
                        return message1;
                    } else if (row.status === 2) {
                        return message2;
                    } else if (row.status === 3) {
                        return message3;
                    } else if (row.status === 4) {
                        return message4;
                    }
                }
            },
            // {"data":"status"},
            {"data": "trackingNo"},
            {"data": function (row, type, val, meta) {
                    return DateTime.format(row.created, "yyyy-MM-dd  hh:mm:ss");
                }
            },
            {
                "data": function (row, type, val, meta) {
                    var detailUrl = "/order/detail?id=" + row.id;
                    <!-- 跳转要换成a标签 -->
                    return '<button type="button" class="btn btn-sm btn-default" onclick="App.showDetail(\'' + detailUrl + '\')"><i class="fa fa-search">查看</i></button>&nbsp&nbsp&nbsp' +
                        '<a href="/order/form?id=' + row.id + '" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit">编辑</i></a>&nbsp&nbsp&nbsp';
                }
            }
        ]
        _dataTable = App.initDataTables("/order/page", _columns);
    });

    function search() {
        var orderId = $("#orderId").val();
        var username = $("#username").val();
        var productName = $("#productName").val();

        var param = {
            "orderNo": orderId,
            "receivingInfo.tbUser.username": username,
            "product.name": productName
        };
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    }
</script>

</body>

</html>
