<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 商品分类管理</title>
    <jsp:include page="../includes/header.jsp"/>
    <link rel="stylesheet" href="/static/assets/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css"/>
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
                商品分类管理
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
                            <h3 class="box-title">${tbContentCategory.id == null ?"新增":"编辑"}商品分类信息</h3>
                        </div>
                        <!-- /.box-header -->

                        <!-- form start -->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/content/category/save" method="post" modelAttribute="tbContentCategory">
                            <!-- 隐藏域 -->
                            <form:hidden path="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父级类目</label>
                                    <div class="col-sm-10">
                                        <form:hidden id="categoryId" path="parent.id"/>
                                        <input class="form-control" id="categoryName" value="${tbContentCategory.parent.name}" placeholder="请选择父级类目" readonly="" onclick="showTree()">
                                        <div class="ztree form-control" style="display:none;height: auto">
                                            <ul id="myTree"></ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">分类名称</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="name" placeholder="请输入分类名称"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="sortOrder" class="col-sm-2 control-label">分类排序</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="sortOrder" placeholder="请输入分类排序"/>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                                <button type="submit" class="btn btn-info pull-right">提交</button>
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


<script>
    function showTree() {
        App.initZTree("/content/category/tree/data",["id"],function (nodes) {
            var node = nodes[0];
            $('#categoryId').val(node.id);
            $('#categoryName').val(node.name);
        });
    }
</script>
</body>
</html>
