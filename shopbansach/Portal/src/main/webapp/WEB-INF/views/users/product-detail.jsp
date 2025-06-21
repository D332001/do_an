<%@ page import="java.util.Locale" %>
<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <style>
        .radio-item input[type=radio]{
            width: 45px;
            height: 38px;
        }
        .radio-item input[type=radio]:checked + label {
            background-color: black;
            color: white;
        }

        .popup {
            background: white;
            padding: .2rem;
            opacity: .8;
            box-shadow: 0 0 12px .4px black;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            width: 200px;
            position: fixed;
            top: 120px;
            right: -320px;
            z-index: 10000000;
        }

        .swag {
            right: 30px;
            animation: anim 3s;
        }
        .opacity {
            transition: .8s;
            opacity: 0;
        }

        @keyframes anim {
            from{right: -320px}
            to{right: 30px}
        }
    </style>

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
                    <a href="${base}/shop">Danh mục</a>
                    <span>Chi tiết sản phẩm</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad page-details">
    <div class="container">
        <div class="row">
            <div class="col-lg-3" style="margin-top: -50px">
                <div class="filter-widget">
                    <h4 class="fw-title">Danh mục</h4>
                    <ul class="filter-catagories">
                        <c:forEach items="${categories}" var="category">
                            <li><a href="/shop">${category.name}</a></li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
            <div class="col-lg-9" style="margin-top: -50px">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-pic-zoom">
                            <c:choose>
                                <c:when test = "${empty product.productImages }">
                                    <img class="card-img-top" src="${base}/images/users/700x400.png" alt="">
                                </c:when>
                                <c:otherwise>
                                    <img class="card-img-top" width="400px" height="500px" src="${base}/file/upload/${product.productImages[0].path}" alt="">
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                    <div class="col-lg-6" >
                        <div class="product-details">
                            <div class="pd-title">
                                <span>${product.category.name}</span>
                                <div style="display: flex">
                                    <h3>${product.title }</h3>

                                </div>
                                <a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
                            </div>
                            <h3 hidden id="size">${product.size}</h3>
                            <h3 hidden id="style">${product.style}</h3>
                            <h3 hidden id="year">${product.year}</h3>
                            <span class="row-infor tacgia">
                                <span class="bold_black">Tác giả : </span><span  class="bold_blue" style="color: #007bff;">
                                    ${product.style}
                                </span><br />
                                <span class="bold_black">Nhà xuất bản : </span><span  class="bold_blue" style="color: #007bff;">
                                ${product.size}
                            </span><br />
                                <span class="bold_black">Năm xuất bản : </span><span  class="bold_blue" style="color: #007bff;">
                                ${product.year}
                            </span>
				            </span>
                            <div class="pd-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span>(5)</span>
                            </div>
                            <div class="pd-desc">
                                <p></p>
                                <h4> <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${product.price}" type="currency"/><span><fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${product.price + 20000}" type="currency"/></span></h4>
                            </div>
                            <div class="quantity">
                                <div class="wrap-num-product flex-w m-r-30">
                                    <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                        <i class="fa fa-minus"></i>
                                    </div>

                                    <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" minlength="1" value="1">

                                    <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                        <i class="fa fa-plus"></i>
                                    </div>
                                </div>
                                <div id="action"><a href="#" class="primary-btn pd-cart" onclick="Shop.addItemToCart(${product.id})">Thêm vào giỏ</a></div>
                                <div class="popup" style="background: #50a923;">
                                    <p style="text-align: center; color: white">Đã thêm vào giỏ</p>
                                    <button onclick="removeFn()">Đóng</button>
                                </div>
                            </div>
                            <ul class="pd-tags">
                                <li><span>Note</span>: Kiểm tra hàng trước khi trả tiền!</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="product-tab">
                    <div class="tab-item">
                        <ul class="nav" role="tablist">
                            <li>
                                <a class="active" data-toggle="tab" href="#tab-1" role="tab">Mô tả sản phẩm</a>
                            </li>



                            <li>
                                <a data-toggle="tab" href="#tab-3" role="tab">Đánh giá</a>
                            </li>

                        </ul>
                    </div>
                    <div class="tab-item-content">
                        <div class="tab-content">
                            <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                <div class="product-content">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p>${product.shortDetails}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                <div class="customer-review-option">
                                    <h4>${size} bình luận</h4>
                                    <div class="comment-option">
                                        <c:forEach items="${comments}" var="comment">
                                            <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="${base}/images/icons/user.png" alt="">
                                                </div>
                                                <div class="avatar-text">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5 >User<span id="time">${comment.createdDate}</span></h5>
                                                    <div id="comment" class="at-reply">${comment.comment}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="leave-comment">
                                        <h4>Để lại bình luận</h4>
                                        <form class="comment-form">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <textarea id="content-comment" placeholder="Nhập bình luận..."></textarea>
                                                    <span id="product-id" style="display: none">${product.id}</span>
                                                    <button type="button" id="send-comment" class="site-btn">Gửi</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="related-products spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Sản phẩm khác</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${products}" var="product">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                                <%--                                ============================images=================================--%>
                            <a href="#">
                                <c:choose>
                                    <c:when test = "${empty product.productImages }">
                                        <img class="card-img-top" src="${base}/images/users/700x400.png" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="card-img-top" src="${base}/file/upload/${product.productImages[0].path}" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="quick-view"><a href="${base }/product/${product.seo}">Xem chi tiết</a></li>
                            </ul>
                        </div>
                        <div class="pi-text">

                            <a href="#">
                                <h5>${product.title}</h5>
                            </a>
                            <div class="product-price">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${product.price}" type="currency"/>
                                <span>
                                        <fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${product.price + 50000}" type="currency"/>
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Load more -->
            <div class="flex-c-m flex-w w-full p-t-45">
                <a href="${base}/shop" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
                    Xem thêm
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>

<script>
    $('#send-comment').click(function (){
        let productId= $('#product-id').text();
        let messenge = $('#content-comment').val();
        var data ={
            productComment:{id : productId},
            comment: messenge
        }
        $.ajax({
            url: "/save-comment",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "json",
            success: function(response) {
                $('#comment').html(response.comment);
                $('#time').html(response.createdDate);
                $('#content-comment').val('');
            },
        });
    });
</script>
<script>
    var Shop = {
        addItemToCart: function(productId) {
            let quantity = $('.num-product').val();
            let code = $('#product-code').text();
            let size = $('#size').text();
            let style = $('#style').text();
            let year = $('#year').text();
            var data = {
                "productId": productId,
                "quantity": quantity,
                "size":size,
                "style":style,
                "year":year,
                "code":code
            };
            $.ajax({
                url: "/add-to-cart",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(data),
                dataType: "json",
                success: function(jsonResult) {

                }
            });
        },
    }
</script>
<script>
    const button = document.querySelector("#action")
    const popup = document.querySelector(".popup")

    button.addEventListener("click", function() {
        popup.classList.add("swag")
        let remove = setTimeout(removeFn, 2000)
    })

    function removeFn() {
        popup.classList.add("opacity")
        let turnR = setTimeout(ausgang, 500)


    }
    function ausgang() {
        console.log("ausgang!!")
        popup.classList.remove("swag")
        popup.classList.remove("opacity")
    }

</script>
</body>

</html>