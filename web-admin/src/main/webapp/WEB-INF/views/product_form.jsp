<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 商品管理</title>
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
                商品管理
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
                            <h3 class="box-title">${product.id == null ?"新增":"编辑"}商品</h3>
                        </div>
                        <!-- /.box-header -->

                        <!-- form start -->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/product/save" method="post" modelAttribute="product">
                            <!-- 隐藏域 -->
                            <form:hidden path="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父级类目</label>
                                    <div class="col-sm-10">
                                        <form:hidden id="categoryId" path="tbContentCategory.id"/>
                                        <input class="form-control required" id="categoryName" value="${product.tbContentCategory.name}" placeholder="请选择商品分类" readonly="" onclick="showTree()">
                                        <div class="ztree form-control" style="display:none;height: auto">
                                            <ul id="myTree"></ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">商品名称</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="name" placeholder="请输入商品名称"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price" class="col-sm-2 control-label">价格</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="price" placeholder="请输入价格"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="img1" class="col-sm-2 control-label">图片1</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="img1" placeholder="请上传图片1"/>
                                        <div id="dropz" class="dropzone"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="img2" class="col-sm-2 control-label">图片2</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="img2" placeholder="请上传图片2"/>
                                        <div id="dropz2" class="dropzone"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="img3" class="col-sm-2 control-label">图片3</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="img3" placeholder="请上传图片3"/>
                                        <div id="dropz3" class="dropzone"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="img4" class="col-sm-2 control-label">图片4</label>
                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="img4" placeholder="请上传图片4"/>
                                        <div id="dropz4" class="dropzone"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="describe" class="col-sm-2 control-label">详情描述</label>
                                    <div class="col-sm-10">
                                        <form:hidden path="describe"/>
                                        <div id="editor">${product.describe}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="stockNum" class="col-sm-2 control-label">库存</label>
                                <div class="col-sm-10">
                                    <form:input cssClass="form-control required" path="stockNum" placeholder="库存"/>
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
    function showTree() {
        App.initZTree("/content/category/tree/data",["id"],function (nodes) {
            var node = nodes[0];
            $('#categoryId').val(node.id);
            $('#categoryName').val(node.name);
        });
    }



    App.initDropZone({
        id:"#dropz",
        url:"/upload",

        init: function () {
            this.on("success", function (file, data) {
                $("#img1").val(data.fileName);
            });
        }
    });

    App.initDropZone({
        id:"#dropz2",
        url:"/upload",

        init: function () {
            this.on("success", function (file, data) {
                $("#img2").val(data.fileName);
            });
        }
    });

    App.initDropZone({
        id:"#dropz3",
        url:"/upload",

        init: function () {
            this.on("success", function (file, data) {
                $("#img3").val(data.fileName);
            });
        }
    });

    App.initDropZone({
        id:"#dropz4",
        url:"/upload",

        init: function () {
            this.on("success", function (file, data) {
                $("#img4").val(data.fileName);
            });
        }
    })

    function InitWangEditor(){
        var E = window.wangEditor;
        var editor = new E('#editor');

        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '/upload';
        editor.customConfig.uploadFileName = 'editorFiles';
        editor.create();

        $("#btnSubmit").bind("click",function () {
            var contentHtml = editor.txt.html();
            $("#describe").val(contentHtml);
            // return false; false阻止submit提交
        });
    }

    $(function () {
        InitWangEditor();
    })



</script>

</body>
</html>
