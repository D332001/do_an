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
        <div class="div">
          <h1><i class="fa fa-laptop"></i> Chi tiết đơn hàng</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i>admin</li>
          <li class="breadcrumb-item"><a href="#">Chi tiết đơn hàng</a></li>
        </ul>
      </div>
      <!-- Buttons-->
      <div class="tile mb-4">
        <div class="page-header">
          <div class="row">
            <div class="col-lg-12">
              <h2 class="mb-3 line-head" id="buttons">${orders.id}</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-7">
            <div class="bs-component">
              <span style="font-size: 1.2rem; font-weight: 700;">Tên khách hàng: </span> <span id="customerName" style="font-size: 1rem;"> &ensp;  ${orders.customerName}</span>
              </br></br>
              <span style="font-size: 1.2rem; font-weight: 700;">Số điện thoại: </span> <span style="font-size: 1rem;"> &ensp;  ${orders.customerPhone}</span>
              </br></br>
              <span style="font-size: 1.2rem; font-weight: 700;">Địa chỉ: </span> <span style="font-size: 1rem;"> &ensp; ${orders.customerAddress}</span>
              </br></br>
              <span style="font-size: 1.2rem; font-weight: 700;">Email: </span> <span id="customer-email" style="font-size: 1rem;">${orders.customerEmail}</span>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="form-group">
              <label for="exampleSelect1">Tình trạng đơn hàng</label>
              <select class="form-control" id="exampleSelect1">
                <option <c:if test="${orders.statusOrder == 'Da giao'}">selected</c:if>>Da giao</option>
                <option <c:if test="${orders.statusOrder == 'Da huy'}">selected</c:if>>Da huy</option>
                <option <c:if test="${orders.statusOrder == 'Dang cho'}">selected</c:if>>Dang cho</option>

              </select>
            </div>
          </div>
        </div>
        <div class="row" style="margin-top: 50px;">
          <div class="col-md-12">
            <div class="tile">
              <div class="tile-body">
                <div class="table-responsive">
                  <table class="table table-hover table-bordered" id="sampleTable">
                    <thead>
                      <tr>
                        <th>Mã đơn hàng</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Dung tích</th>
                        <th>Phong cách</th>
                        <th>Năm sản xuất</th>

                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${orderProducts}" var="orderProduct">
                        <tr class="list-product">
                          <td>${orderProduct.id}</td>
                          <td id="name-product">${orderProduct.name}</td>
                          <td id="quantity-product">${orderProduct.quality}</td>
                          <td id="quantity-product">${orderProduct.size}</td>
                          <td id="quantity-product">${orderProduct.style}</td>
                          <td id="quantity-product">${orderProduct.year}</td>

<%--                          </td>--%>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><span style="font-size: 1.2rem; font-weight: 700;float: right;">Tổng tiền: <span style="color:#E7AB3C;" id="total">${orders.total} &ensp;</span></span>
            <button id="order-out" style="width:10%; height:10%">Xuất đơn</button>
            <button id="save-status" style="width:10%; height:10%">Lưu</button>
            <button style="width:10%; height:10%"><a href="/admin/list-order" style="color:black;">Quay lại</a></button>
          </div>
        </div>
      </div>

    </main>
    <!-- js-->
    <jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
  <script>

    $('#save-status').click(function(e) {
      e.preventDefault();
       let statusOrder = $('#exampleSelect1 :selected').text();
        let id = $('#buttons').text();
      $.ajax({
        url: "http://localhost:8081/order/save-status",
        type: "post",
        data:{"statusOrder":statusOrder, "id":id},
        dataType: "text",
        error: function(result) {
          window.location = "http://localhost:8088/admin/list-order";
        }
      });
    });

    $('#order-out').click(function(e) {
      e.preventDefault();
      let email = $('#customer-email').text();
      let customerName = $('#customerName').text();
      let statusOrder = $('#exampleSelect1 :selected').text();
      let total = $('#total').text();
      let id = $('#buttons').text();
      $.ajax({
        url: "/admin/send-mail",
        type: "post",
        data:{"id":id,
          "customerName":customerName,
          "customerEmail": email,
          "statusOrder": statusOrder,
          "statusOrder": statusOrder,
          "statusOrder": statusOrder,
          "statusOrder": statusOrder,
          "total": total},
        dataType: "text",
        error: function(result) {
          window.location = "http://localhost:8088/admin/list-order";
        }
      });

    });
  </script>
  </body>
</html>
