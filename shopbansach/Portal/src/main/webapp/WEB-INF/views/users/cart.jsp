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
                    <span>Giỏ hàng</span>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table">

                    <table>
                        <thead>
                            <tr>
                                <th>Ảnh sản phẩm</th>
                                <th class="p-name">Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th onclick="delteALlItems()"><i class="ti-close"></i></th>
                            </tr>
                        </thead>
                        <tbody class="cart-items">
                            <c:forEach items="${GIO_HANG.cartItems}" var="item">
                                <tr class="cart-item">
                                    <td><img style="width: 100px"; height="100px" src="${base}/file/upload/${item.productImage}" alt=""></td>
                                    <td class="cart-title">
                                        <h6>${item.code}</h6><h6>${item.productName}</h6></br>
                                        <span id="cart-productId" style="display: none">${item.productId}</span>
                                    </td>
                                    <td class="p-price">
                                        <span class="price">
                                            ${item.unitPrice}
                                        </span>
                                    </td>
                                    <td class="qua-col">
                                        <div class="wrap-num-product flex-w m-auto">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fa fa-minus"></i>
                                            </div>
                                            <input class="mtext-104 cl3 txt-center num-product quantity" type="number" name="num-product" min="1" max="5" value="${item.quantity}">
                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fa fa-plus"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price">
                                        <span class="total-pr">
                                            ${item.unitPrice * item.quantity}
                                        </span>

                                    </td>
                                    <td class="close-td"><a href="/remove-item?productId=${item.productId}"><i class="ti-close"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                 </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="discount-coupon">
                            <h6>Mã giảm giá</h6>
                            <form  class="coupon-form" >
                                <input type="text" placeholder="Nhập mã giảm giá..." id="code-sale">
                                <a><button type="submit" class="site-btn coupon-btn" id="add-code" >thêm</button></a>
                            </form>
                            <span id="check-code" style="color: red;display: block; margin-top:10px"></span>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">Tổng phụ <span class="total-order">${totalOrder}</span></li>
                                <li class="subtotal">Mã giảm giá <span class="price-sale"></span></li>
                                <li class="cart-total">Thành tiền <span class="total"></span></li>
                                <li class="subtotal"> <span id="total-price-sale"></span></li>
                            </ul>
                            <a href="${base }/check-out" class="proceed-btn" onclick="Check.checkOut()" >Tiến hành thanh toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>


<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>

<script>
    $('#add-code').click(function(e) {
        e.preventDefault();
        let nameSale = $('#code-sale').val();
        $.ajax({
            type: "GET",
            url: "/code-sale/",
            data: {
                nameSale: nameSale
            },
            success: function(response) {
                if(response.quantity <= 0 ){
                    $('#check-code').html("Hết lượt sử dụng");
                }
                else if(response.nameSale != nameSale){
                    $('#check-code').html("Mã không tồn tại");
                    let totalOrder = $('.total-order').text();
                    $('.total').html(totalOrder);
                    $('.price-sale').html("");
                }
                else{
                    $('#check-code').html("Bạn được giảm "+response.priceSale +" VNĐ");
                    $('.price-sale').html(response.priceSale);
                    let totalOrder = $('.total-order').text();
                    $('.total').html(totalOrder-response.priceSale);
                }
            },
            error: function(response) {
                alert('error');
            }
        });
    });

    var Check = {

        checkOut: function() {
                let cart_item_arr = [];
                $('.cart-item').each(function(idx, element) {
                    let $el = $(element);
                    cart_item_arr.push({
                        productId: $el.find('#cart-productId').text(),
                        quantity: $el.find('.qua-col .quantity').val()
                    });
                })
                $.ajax({
                    url: "/order-item",
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify({cartItems : cart_item_arr}),
                    dataType: "json",
                    success: function(jsonResult) {
                        $("#btnCheckout").html("Giỏ hàng("+jsonResult.data+")");
                        $('html, body').animate({
                            scrollTop: $("#btnCheckout").offset().top - 100
                        }, 1000);
                    }
                });
            let priceSale = $('.price-sale').text();
            let total = $('.total').text();
            let nameSale =$('#code-sale').val();
            $.ajax({
                url: "/check-price/", //added '/' in the beginning
                type: 'get',
                data:  {priceSale: priceSale, total:total, nameSale: nameSale},
                dataType: "text",
                contentType: "text/plain", //change
                //mimeType: false,   //remove
                success: function(response) {
                    console.log(data);
                    return false;
                }
            });
        }
    }


    var commaCounter = 10;
    function numberSeparator(Number) {
        Number += '';
        for (var i = 0; i < commaCounter; i++) {
            Number = Number.replace(',', '');
        }
        x = Number.split('.');
        y = x[0];
        z = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(y)) {
            y = y.replace(rgx, '$1' + ',' + '$2');
        }
        commaCounter++;
        return y + z;
    }
    function clearZeroFirst(Number) {
        var number = numberSeparator(Number);
        return number.replace(/^0+/, '');

    }
</script>
</body>
</html>

