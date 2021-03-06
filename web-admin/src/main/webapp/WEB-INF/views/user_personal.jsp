<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>我的商城 | 用户详情</title>
    <jsp:include page="../includes/header.jsp"/>
</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="box-body">
    <table id="dataTable" class="table table-hover">
        <tbody>
        <tr>
            <td>
                <!-- Profile Image -->
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="/static/assets/img/naichagou.jpg"
                             alt="User profile picture">

                        <h3 class="profile-username text-center">${tbUser.username}</h3>

                        <p class="text-muted text-center">buger</p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>邮箱</b> <a class="pull-right">${tbUser.email}</a>
                            </li>
                            <li class="list-group-item">
                                <b>手机</b> <a class="pull-right">${tbUser.phone}</a>
                            </li>
                            <li class="list-group-item">
                                <b>创建时间</b> <a class="pull-right"><fmt:formatDate value="${tbUser.created}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
                            </li>
                            <li class="list-group-item">
                                <b>更新时间</b> <a class="pull-right"><fmt:formatDate value="${tbUser.updated}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
                            </li>
                        </ul>

                    </div>
                    <!-- /.box-body -->
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../includes/footer.jsp"/>

</body>
</html>