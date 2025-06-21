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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <!-- Css Styles -->
    <jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>

</head>

<body class="app sidebar-mini">

<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/common/menu.jsp"></jsp:include>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i> Thêm mã giảm giá</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Admin</li>
            <li class="breadcrumb-item active"><a href="#">Quản lý Mã Giảm Giá</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="table-responsive">
                        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                            <h2>Thêm mã giảm giá</h2>
                            <div class="my-4">

                                <form:form  action="/save-sale" modelAttribute="sale">
                                    <div class="form-group">
                                        <label>Mã giảm giá</label>
                                        <form:input type="text" class="form-control" path="nameSale" />
                                        <small id="emailHelp" class="form-text text-muted">
                                            Tối đa 15 kí tự.
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <form:input type="text" class="form-control" path="priceSale" />
                                        <small id="emailHelp" class="form-text text-muted">
                                            Đơn vị tính là VNĐ.
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <form:input type="number" class="form-control" path="quantity" />
                                    </div>
                                    <div class="form-group">
                                        <label>Thời gian</label>
                                        <form:input type="datetime-local"  class="form-control" path="timeSale" />
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm" >Thêm</button>
                                    <a href="${base }/admin/sales" class="btn btn-secondary btn-sm">Quay lại</a>
                                </form:form>
                            </div>
                        </main>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- js-->
<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $('#txtDetailDescription').summernote();
    });

</script>

</body>
</html>
