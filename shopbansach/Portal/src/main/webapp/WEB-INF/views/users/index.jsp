<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="img/bg-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>Mua sắm thả ga tại thế giới sách</span>
                            <h1 style="color:#66CC33;">Siêu ưu đãi</h1>
                        </br>
                            <a href="${base}/contact" class="primary-btn" style="margin-top: 30px">Liên hệ ngay</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Sắp ra mắt</h2>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/bg-3.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>Mua sắm thả ga tại thế giới sách</span>
                            <h1 style="color:#66CC33;">Siêu ưu đãi</h1>
                            <a href="${base}/contact" class="primary-btn" style="margin-top: 30px">Liên hệ ngay</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Sắp ra mắt</h2>
                    </div>
                </div>
            </div>

            <div class="single-hero-items set-bg" data-setbg="img/bg-1.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>Mua sắm thả ga tại thế giới sách</span>
                            <h1 style="color:#66CC33;">Siêu ưu đãi</h1>
                            </br>
                            <a href="${base}/product" class="primary-btn" style="margin-top: 30px">Mua ngay</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Sale<span>10%</span></h2>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- Banner Section Begin -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="img/banner1.jpg" alt="">
                        <div class="inner-text">
                            <h4>Văn Học</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img  src="img/banner-4.png" alt="">
                        <div class="inner-text">
                            <h4>Manga-Comic</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 ">
                    <div class="single-banner">
                        <img src="img/banner3.jpg" alt="">
                        <div class="inner-text">
                            <h4>Kỹ Năng Sống </h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-2">
                    <div class="single-banner">
                        <img src="img/banner-6.png" alt="">
                        <div class="inner-text">
                            <h4>Quản Lý Kinh Doanh</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-2">
                    <div class="single-banner">
                        <img src="img/banner-7.png" alt="">
                        <div class="inner-text">
                            <h4>Sách Thiếu Nhi</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-2">
                    <div class="single-banner">
                        <img src="img/banner-5.png" alt="">
                        <div class="inner-text">
                            <h4>Sách Giáo Khoa</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Hero Section End -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="img/sss.jpg">
                        <h2>Sản phẩm sale</h2>
                        <a href="#">Xem thêm</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active" style="font-weight: 700; font-size: 2rem;">Sản phẩm</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                        <c:forEach items="${products}" var="product">
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img class="card-img-top" src="${base}/file/upload/${product.productImages[0].path}" alt="">
                                    <div class="sale">Sale</div>
                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="quick-view bg-dark"><a href="${base }/product/${product.seo}">Xem chi tiết</a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
<%--                                    <div class="catagory-name">${product.category.name}</div>--%>
                                    <a href="#">
                                        <div style="height: 50px;text-align: center"><h5>${product.title}</h5> </div>
                                    </a>
                                    <div class="product-price">
                                        <fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="${product.price}" type="currency"/>
                                        <span>
                                        <fmt:setLocale value="vi_VN"/>
										<fmt:formatNumber value="${product.price + 20000}" type="currency"/>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
		<!-- Banner Section End -->
<%--    ======================================list product====================================================--%>
    <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Một số sản phẩm</h2>
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


    <div class="container" >
        <div class="chatbox" style="z-index: 999999999999999; position: fixed;">
            <div class="chatbox__support">
                <div class="chatbox__header">
                    <div class="chatbox__image--header">
                        <img src="img/logo.png" alt="image">
                    </div>
                    <div class="chatbox__content--header">
                        <h4 class="chatbox__heading--header">Trò chuyện trực tiếp</h4>
                    </div>
                </div>
                <div class="chatbox__messages">
                    <%--                    // input username--%>
                    <div>
                        <div id="username-page">
                            <div class="username-page-container">
                                <h1 class="title">Nhập tên</h1>
                                <form id="usernameForm" name="usernameForm">
                                    <div class="form-group">
                                        <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="accent username-submit">Bắt đầu trò chuyện</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div id="chat-page" class="hidden">
                            <div class="messages__item messages__item--visitor">
                                Xin chào quý khánh!<br/>
                                Bạn có cần giúp đỡ?
                            </div>

                            <p class="messageArea">
                            </p>
                            <p class="messageArea2">
                            </p>

                            <div class="messages__item messages__item--typing" style="z-index: -10">
                                <span class="messages__dot"></span>
                                <span class="messages__dot"></span>
                                <span class="messages__dot"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="messageForm" name="messageForm" nameForm="messageForm" class="chatbox__footer">
                    <img src="./images/icons/emojis.svg" alt="">
                    <img src="./images/icons/microphone.svg" alt="">
                    <input id="message" type="text" placeholder="Nhập vào đây...">
                    <button type="submit" id="btn-send"><p class="chatbox__send--footer">Gửi</p></button>
                    <img src="./images/icons/attachment.svg" alt="">
                </form>
            </div>
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>
        </div>
    </div>

    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
    <!-- Footer Section End -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<!-- java script -->
	<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>

</body>

</html>
