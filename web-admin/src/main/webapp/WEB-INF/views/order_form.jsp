<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 订单管理</title>
    <jsp:include page="../includes/header.jsp"/>
    <link rel="stylesheet" href="/static/assets/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css"/>
    <link rel="stylesheet" href="/static/assets/plugins/dropzone-5.7.0/dist/dropzone.css"/>
    <link rel="stylesheet" href="/static/assets/plugins/dropzone-5.7.0/dist/min/basic.min.css"/>
    <link rel="stylesheet" href="/static/assets/plugins/wangEditor/wangEditor.min.css"/>
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
                订单管理
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
                <div class="col-md-12">
                    <!-- 牛逼 -->
                    <c:if test="${baseResult != null}">
                        <div class="alert alert-${baseResult.status == 200 ? "success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">编辑订单</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/order/save" method="post" modelAttribute="order">
                            <!-- 隐藏域 -->
                            <form:hidden path="id"/>
                            <div class="box-body">

                                <div class="form-group">
                                    <label for="orderNo" class="col-sm-2 control-label">订单号为</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="orderNo" readonly="true" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="trackingNo" class="col-sm-2 control-label">快递单号</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="trackingNo" placeholder="请输入快递单号"/>
                                    </div>
                                </div>
                            </div>

                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                <button id="btnSubmit" type="submit" class="btn btn-info pull-right">提交</button>
                            </div>
                            <!-- /.box-footer -->
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <jsp:include page="../includes/copyright.jsp"/>
</div>

<jsp:include page="../includes/footer.jsp"/>
<script src="/static/assets/plugins/zTree_v3/js/jquery.ztree.core.min.js"></script>
<script src="/static/assets/plugins/dropzone-5.7.0/dist/min/dropzone.min.js"></script>
<script src="/static/assets/plugins/wangEditor/wangEditor.min.js"></script>
<%--<sys:modal title="请选择" message="<ul id='myTree' class='ztree'></ul>"/>--%>


<script>
</script>

</body>
</html>
