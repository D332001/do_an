<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Css Styles -->
    <jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>

</head>

<body class="app sidebar-mini">

<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/common/menu.jsp"></jsp:include>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> Phân quyền</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i> Admin</li>
            <li class="breadcrumb-item"><a href="#">Phân quyền</a></li>
        </ul>
    </div>
    <div class="row">
        <%--        <div class="col-md-3"><a class="mb-2 btn btn-primary btn-block" href="">Mail</a>--%>
        <%--          <div class="tile p-0">--%>
        <%--            <div class="tile-body">--%>
        <%--              <ul class="nav nav-pills flex-column mail-nav">--%>
        <%--                <li class="nav-item active"><a class="nav-link" href="#"><i class="fa fa-inbox fa-fw"></i> Hộp thư đến<span class="badge badge-pill badge-primary float-right">12</span></a></li>--%>
        <%--                <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-envelope-o fa-fw"></i> Thư đã gửi</a></li>--%>
        <%--                <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-file-text-o fa-fw"></i> Bản nháp</a></li>--%>
        <%--                <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-trash-o fa-fw"></i> Rác</a></li>--%>
        <%--              </ul>--%>
        <%--            </div>--%>
        <%--          </div>--%>
        <%--        </div>--%>
            <div class="col-md-12">
                <a href="${base }/admin/add-role" class="btn btn-primary btn-sm">Thêm quyền mới</a>
                <div class="tile">
                    <div class="tile-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                <tr>
                                    <th>Mã quyền</th>
                                    <th>Tên quyền</th>
                                    <th>Mô tả</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${roles}" var="role">
                                    <tr>
                                        <td>${role.id}</td>
                                        <td>${role.name } </td>
                                        <td>${role.description }</td>

                                        <td>
                                            <c:choose>
                                                <c:when test="${role.status == 'true' }">
                                                    <span class="badge badge-success">Active</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-danger">InActive</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="${base }/admin/edit-role/${role.id}"><button type="button" class="btn btn-success">Sửa</button></a>
                                            &nbsp<a href="${base }/admin/delete-role/${role.id}"><button type="button" class="btn btn-danger">Xóa</button></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</main>
<!-- js-->
<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
</body>
</html>