<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 内容管理</title>
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
                内容管理
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
                            <h3 class="box-title">${tbContent.id == null ?"新增":"编辑"}内容</h3>
                        </div>
                        <!-- /.box-header -->

                        <!-- form start -->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/content/save" method="post" modelAttribute="tbContent">
                            <!-- 隐藏域 -->
                            <form:hidden path="id"/>
                            <div class="box-body">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">父级类目</label>
                                    <div class="col-sm-10">
                                        <form:hidden id="categoryId" path="tbContentCategory.id"/>
                                        <input class="form-control required" id="categoryName" value="${tbContent.tbContentCategory.name}" placeholder="请选择父级类目" readonly="" onclick="showTree()">
                                        <div class="ztree form-control" style="display:none;height: auto">
                                            <ul id="myTree"></ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">标题</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control" path="title" placeholder="请输入标题"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="subTitle" class="col-sm-2 control-label">子标题</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="subTitle" placeholder="请输入子标题"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="titleDesc" class="col-sm-2 control-label">标题描述</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="titleDesc" placeholder="请输入标题描述"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="url" class="col-sm-2 control-label">链接</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="url" placeholder="请输入链接"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="pic" class="col-sm-2 control-label">图片1</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="pic" placeholder="请输入图片1"/>
                                        <div id="dropz" class="dropzone"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="pic2" class="col-sm-2 control-label">图片2</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="pic2" placeholder="请输入图片2"/>
                                        <div id="dropz2" class="dropzone"></div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label for="content" class="col-sm-2 control-label">详情</label>

                                    <div class="col-sm-10">
                                        <form:hidden path="content"/>
                                        <div id="editor">${tbContent.content}</div>
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
                $("#pic").val(data.fileName);
            });
        }
    });

    App.initDropZone({
        id:"#dropz2",
        url:"/upload",

        init: function () {
            this.on("success", function (file, data) {
                $("#pic2").val(data.fileName);
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
            $("#content").val(contentHtml);
            // return false; false阻止submit提交
        });
    }

    $(function () {
        InitWangEditor();
    })



</script>

</body>
</html>