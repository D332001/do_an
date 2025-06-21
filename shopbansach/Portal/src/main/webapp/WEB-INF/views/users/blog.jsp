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

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section" style="margin-top: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="${base}/"><i class="fa fa-home"></i> Trang chủ</a>
                        <span>Tin tức</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 order-1 order-lg-2">
                <div class="row">
                    <div class="col-lg-6 col-sm-6">
                        <div class="blog-item">
                            <div class="bi-pic">
                                <img src="img/blog/blog1.jpg" alt="">
                            </div>
                            <div class="bi-text">
                                <a href="./blog-details.html">
                                    <h4>Những câu chuyện hàng ngày trong cuộc sống?</h4>
                                </a>
                                <p> <span> 24/03/2023</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="blog-item">
                            <div class="bi-pic">
                                <img src="img/blog/blog2.jpg" alt="">
                            </div>
                            <div class="bi-text">
                                <a href="./blog-details.html">
                                    <h4>Tâm trạng con người</h4>
                                </a>
                                <p> <span> 20/03/2023</span></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-sm-6">
                        <div class="blog-item">
                            <div class="bi-pic">
                                <img src="img/blog/blog3.jpg" alt="">
                            </div>
                            <div class="bi-text">
                                <a href="./blog-details.html">
                                    <h4>Truyện tranh siêu hot sắp ra mắt</h4>
                                </a>
                                <p> <span> 18/3/2023</span></p>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-6 col-sm-6">
                        <div class="blog-item">
                            <div class="bi-pic">
                                <img src="img/blog/blog4.jpg" alt="">
                            </div>
                            <div class="bi-text">
                                <a href="./blog-details.html">
                                    <h4>Những lá thư liên lạc giữa ông và em trai Van Gogh</h4>
                                </a>
                                <p> <span> 18/03/2023</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
    <!-- Footer Section End -->

    <!-- java script -->
    <jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>
</body>

</html>