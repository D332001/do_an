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
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DG Book</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <jsp:include page="/WEB-INF/views/users/common/css.jsp"></jsp:include>

</head>

<body>
<%--header--%>
<jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section" style="margin-top: 100px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="${base}/"><i class="fa fa-home"></i> Trang chủ</a>
                    <a href="${base}/shop">Danh Mục</a>
                    <span>Thanh toán</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="checkout-section spad">
    <div class="container">
        <form action="/finish" id="formname" method="post" class="checkout-form">
            <div class="row">
                <div class="col-lg-6">
                    <h4>Thông tin thanh toán</h4>
                    <div class="row" >

                            <div class="col-lg-12" >
                                <label for="name">Tên đầy đủ<span>*</span></label>
                                <input type="text" style=" margin-bottom: 0px" id="name" name="customerName" path="name">
                                <div style="height: 20px"><span style="color:red;" id="text1"></span></div>

                            </div>
                            <div class="col-lg-12" style=" margin-top: 25px">
                                <label for="address" >Địa chỉ<span>*</span></label>
                                <input type="text" style=" margin-bottom: 0px" id="address" name="customerAddress" path="address">
                                <div style="height: 20px"><span style="color:red;" id="text2"></span></div>
                            </div>
                            <div class="col-lg-12" style=" margin-top: 25px">
                                <label for="phone">Số điện thoại<span>*</span></label>
                                <input type="text" style=" margin-bottom: 0px" id="phone" class="street-first" name="customerPhone" path="phone">
                                <div style="height: 20px"><span style="color:red;" id="text3"></span></div>
                            </div>
                            <div class="col-lg-12" style=" margin-top: 25px">
                                <label for="email">Email<span></span></label>
                                <input type="text" id="email"  class="street-first" name="customerEmail">

                            </div>

                    </div>
                </div>
                <div class="col-lg-6">

                    <div class="place-order">
                        <h4>Đơn hàng</h4>
                        <div class="order-total
                            <ul class="order-table">
                                <li>Sản phẩm <span style ="color:red">Thành tiền</span></li>
                                <c:forEach items="${GIO_HANG.cartItems}" var="item">
                                    <li class="fw-normal cart-item">${item.productName} x ${item.quantity}
                                        <span class="total-pr">${item.unitPrice * item.quantity}</span>
                                    </li>
                                </c:forEach>
                                </br></br></br></br></br>
                                <li class="fw-normal">Tổng phụ <span>
                                    ${lastPrice + priceSale} VNĐ
                                </span></li>
                                <li class="fw-normal">Mã giảm giá <span>${priceSale} VNĐ</span></li>
                                <li class="fw-normal" style="display: none">Mã giảm giá <span id="name-sale">${nameSale} VNĐ</span></li>
                                <li class="total-price">Thành tiền <span>${lastPrice} VNĐ</span></li>
                            </ul>
                            <div class="order-btn">
                                <button  id="order-item" class="site-btn place-btn">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Shopping Cart Section End -->

<!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>



<script>
    $(document).ready(function() {
        $("#formname").submit(function (e) {
            if ($("#name").val() == "" ) {
                document.getElementById("text1").innerHTML="Không được bỏ trống";
                e.preventDefault();
            }else{
                document.getElementById("text1").innerHTML="";
            }
            if ($("#address").val() == "" ) {
                document.getElementById("text2").innerHTML="Không được bỏ trống";
                e.preventDefault();
            }else{
                document.getElementById("text2").innerHTML="";
            }
            if ($("#phone").val() == "" ) {
                document.getElementById("text3").innerHTML="Không được bỏ trống";
                e.preventDefault();
            }else{
                document.getElementById("text3").innerHTML="";
            }
        });
    });

    $('#order-item').click(function (){
            let nameSale =  $('#name-sale').text();
            $.ajax({
                url:"http://localhost:8081/update-quantity",
                type:"post",
                data:{nameSale: nameSale},
                dataType:"text",
                success:function (){
                    alert("oke");
                }
            });
    });

</script>
</body>

</html>