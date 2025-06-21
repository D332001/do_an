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
          <h1><i class="fa fa-th-list"></i> Quản lý Mã Giảm Giá</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Admin</li>
          <li class="breadcrumb-item active"><a href="#">Quản lý Mã Giảm Giá</a></li>
        </ul>
      </div>
     <div class="row">
        <div class="col-md-12">
            <a href="${base}/admin/add-sale" class="btn btn-primary btn-sm">Thêm mã mới</a>
        <div class="tile" style="text-align: center;">
            <div class="tile-body">
            <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable" style="border: 1px solid #dee2e6;">
                <thead>
                    <tr>
                    <th>ID</th>
                    <th>Mã giảm giá</th>
                    <th>Số tiền</th>
                        <th>Số lượt</th>
                        <th>Hạn sử dụng</th>
                    <th>Hành động</th>                     
                    </tr>
                </thead>
                <tbody>
                   <c:forEach items="${sales}" var="sale">
                       <tr>
                            <td>${sale.id}</td>
                            <td>${sale.nameSale}</td>
                            <td>${sale.priceSale}</td>
                           <td>${sale.quantity}</td>
                           <td>${sale.timeSale}</td>
                            <td>
                                <a href="${base}/admin/edit-sale/${sale.id}"><button type="button" class="btn btn-success">Sửa</button></a>&nbsp
                                <a href="${base }/delete-sale?id=${sale.id}"><button type="button" class="btn btn-danger">Xóa</button></a>
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
<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
  </body>
</html>

