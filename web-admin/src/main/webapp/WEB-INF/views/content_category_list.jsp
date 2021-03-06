<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 分类管理</title>
    <jsp:include page="../includes/header.jsp"/>
    <link rel="stylesheet" href="/static/assets/plugins/treetable/css/jquery.treetable.css"/>
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
                分类管理
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



                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">分类列表</h3>
                        </div>
                        <div class="box-body">
                            <a href="/content/category/form" type="button" class="btn btn-sm btn-default"><i class="fa fa-plus" >新增</i></a>&nbsp&nbsp&nbsp
                            <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-download" >导入</i></a>&nbsp&nbsp&nbsp
                            <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-upload" >导出</i></a>&nbsp&nbsp&nbsp
                            <!-- 类选择器 .box-info-search -->
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="treeTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>名称</th>
                                    <th>排序</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${tbContentCategories}" var="tbContentCategory">
                                    <tr data-tt-id="${tbContentCategory.id}"  data-tt-parent-id="${tbContentCategory.parent.id}">
                                        <td>${tbContentCategory.id}</td>
                                        <td>${tbContentCategory.name}</td>
                                        <td>${tbContentCategory.sortOrder}</td>
                                        <td>
                                            <a href="/content/category/form?id=${tbContentCategory.id}" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit">编辑</i></a>&nbsp&nbsp&nbsp
                                            <button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle('/content/category/delete','${tbContentCategory.id}','警告: 该删除操作会将包括选择类目在内的全部子类目及属于类目的内容一并删除，请谨慎操作！')"><i class="fa fa-trash-o">删除</i></button>&nbsp&nbsp&nbsp
                                            <a href="/content/category/form?parent.id=${tbContentCategory.id}&parent.name=${tbContentCategory.name}" type="button" class="btn btn-sm btn-default"><i class="fa fa-plus">新增下级菜单</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
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
<script src="/static/assets/plugins/treetable/jquery.treetable.js"></script>
<!-- 自定义模态框 -->
<sys:modal/>

<script>
    $(function () {
        $('#treeTable').treetable({
            column:1,
            clickableNodeNames: true,
            initialState: "expand",
            expandable: true
        });
    });

</script>


</body>

</html>