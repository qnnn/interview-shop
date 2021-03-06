<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 用户管理</title>
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
                用户管理
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
                                        <label for="username" class="col-sm-4 control-label">姓名</label>
                                        <div class="col-sm-8">
                                            <input id="username" class="form-control" placeholder="姓名"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <label for="email" class="col-sm-4 control-label">邮箱</label>
                                        <div class="col-sm-8">
                                            <input id="email" class="form-control" placeholder="邮箱"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="form-group">
                                        <label for="phone" class="col-sm-4 control-label">手机</label>
                                        <div class="col-sm-8">
                                            <input id="phone" class="form-control" placeholder="手机"/>
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
                            <h3 class="box-title">用户列表</h3>
                        </div>
                        <div class="box-body">
                            <a href="/user/form" type="button" class="btn btn-sm btn-default"><i class="fa fa-plus" >新增</i></a>&nbsp&nbsp&nbsp
                            <button type="button" class="btn btn-sm btn-default" onclick="App.deleteMulti('/user/delete')" ><i class="fa fa-trash-o">删除</i></button>&nbsp&nbsp&nbsp
                            <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-download" >导入</i></a>&nbsp&nbsp&nbsp
                            <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-upload" >导出</i></a>&nbsp&nbsp&nbsp
                            <!-- 类选择器 .box-info-search -->
                            <button type="button" class="btn btn-sm btn-primary" onclick="$('.box-info-search').css('display') == 'none'?$('.box-info-search').show('fast'):$('.box-info-search').hide('fast')"><i class="fa fa-search" >搜索</i></button>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="minimal icheck_master" ></th>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>手机号</th>
                                    <th>邮箱</th>
                                    <th>注册时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--<c:forEach items="${tbUsers}" var="tbUser">
                                    <tr>
                                        <td><input id="${tbUser.id}" type="checkbox" class="minimal" ></td>
                                        <td>${tbUser.id}</td>
                                        <td>${tbUser.username}</td>
                                        <td>${tbUser.phone}</td>
                                        <td>${tbUser.email}</td>
                                        <td><fmt:formatDate value="${tbUser.updated}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                                        <td>
                                            <!-- 跳转要换成a标签 -->
                                            <a href="#" type="button" class="btn btn-sm btn-default"><i class="fa fa-search">查看</i></a>&nbsp&nbsp&nbsp
                                            <a href="#" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit">编辑</i></a>&nbsp&nbsp&nbsp
                                            <a href="#" type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash-o">删除</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>--%>
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
        var _columns=[
            {
                "data": function (row, type, val, meta) {
                    return '<input id="' + row.id + '" type="checkbox" class="minimal" >';
                }
            },
            {"data": "id"},
            {"data": "username"},
            {"data": "phone"},
            {"data": "email"},
            {"data": function (row, type, val, meta) {
                    return DateTime.format(row.created, "yyyy-MM-dd  hh:mm:ss");
                }
            },
            {
                "data": function (row, type, val, meta) {
                    var detailUrl ="/user/personal?id=" +row.id;
                    var deleteUrl ="/user/delete";
                    <!-- 跳转要换成a标签 -->
                    return '<button type="button" class="btn btn-sm btn-default" onclick="App.showDetail(\''+ detailUrl +'\')"><i class="fa fa-search">查看</i></button>&nbsp&nbsp&nbsp' +
                        '<a href="/user/form?id='+row.id+'" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit">编辑</i></a>&nbsp&nbsp&nbsp' +
                        '<a href="#" type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle(\'' + deleteUrl + '\',\'' + row.id +'\')" lass="fa fa-trash-o">删除</i></a>';
                }
            }
        ]
        _dataTable = App.initDataTables("/user/page", _columns);
    });

    function  search() {
        var username = $("#username").val();
        var phone = $("#phone").val();
        var email = $("#email").val();

        var param = {
            "username":username,
            "phone":phone,
            "email":email
        };
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    }
</script>

</body>

</html>