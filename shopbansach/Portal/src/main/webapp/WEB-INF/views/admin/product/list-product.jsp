<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
      <h1><i class="fa fa-th-list"></i> Quản lý sản phẩm</h1>
    </div>
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
      <li class="breadcrumb-item">Admin</li>
      <li class="breadcrumb-item active"><a href="#">Quản lý sản phẩm</a></li>
    </ul>
  </div>
  <div class="row">

    <div class="col-md-12">
      <a href="${base }/admin/add-product" class="btn btn-primary btn-sm">Thêm mới sản phẩm</a>
      <div class="tile">
        <div class="tile-body">
          <div class="table-responsive">
            <table class="table table-hover table-bordered" id="sampleTable">
              <thead>
              <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Mô tả</th>
                <th>giá</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${products}" var="product">
                <tr>
                  <td>${product.code}</td>
                  <td>${product.title } </td>
                  <td>${product.shortDes }</td>
                  <td>${product.price }</td>
                  <td>
                    <c:choose>
                      <c:when test="${product.status == 'true' }">
                        <span class="badge badge-success">Active</span>
                      </c:when>
                      <c:otherwise>
                        <span class="badge badge-danger">InActive</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <a href="${base }/admin/edit-product/${product.seo}"><button type="button" class="btn btn-success">Sửa</button></a>
                    &nbsp<a href="${base }/admin/delete-product/${product.id}"><button type="button" class="btn btn-danger">Xóa</button></a>
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



<%--<tbody>--%>
<%--<c:forEach items="${products}" var="product">--%>
<%--  <tr>--%>
<%--    <td>${product.title } </td>--%>
<%--    <td>${product.shortDes }</td>--%>
<%--    <td>${product.price }</td>--%>
<%--    <td>--%>
<%--      <c:choose>--%>
<%--        <c:when test="${product.status == 'true' }">--%>
<%--          <span class="badge badge-success">Active</span>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--          <span class="badge badge-danger">InActive</span>--%>
<%--        </c:otherwise>--%>
<%--      </c:choose>--%>
<%--    </td>--%>
<%--    <td><button type="button" class="btn btn-success">Sửa</button>&nbsp<button type="button" class="btn btn-danger">Xóa</button></td>--%>
<%--    <td><a href="${base }/admin/edit-product/${product.seo}"><button type="button" class="btn btn-success">Sửa</button></a>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--</c:forEach>--%>
<%--</tbody>--%>