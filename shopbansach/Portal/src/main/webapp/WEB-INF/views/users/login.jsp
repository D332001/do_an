<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        .btn-facebook {
            color: #fff;
            background-color: #3b5998;
            border-color: rgba(0,0,0,0.2);
        }

        .btn-social {
            position: relative;
            padding-left: 55px;
            text-align: left;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .btn-social:hover {
            color: #eee;
        }

        .btn-social :first-child {
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 40px;
            padding: 7px;
            font-size: 1.6em;
            text-align: center;
            border-right: 1px solid rgba(0,0,0,0.2);
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
                    <a href="./home.html"><i class="fa fa-home"></i> Trang chủ</a>
                    <span>Đăng nhập</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Register Section Begin -->
<div class="register-login-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3" id="log">
                <div class="login-form">

                    <h2>Đăng nhập</h2>
                    <form method="POST" action="http://localhost:8088/perform_login">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <c:if test="${not empty param.login_error}">
                            <div class="alert alert-danger" role="alert">
                                Login attempt was not successful, try again.
                            </div>
                        </c:if>
                        <div class="group-input">
                            <label for="username">Tên đăng nhập/Email</label>
                            <input type="text" id="username" name="username" class="form-control" required>
                        </div>
                        <div class="group-input">
                            <label for="password">Mật khẩu</label>
                            <input type="password" id="password" class="form-control" name="password" required>
                        </div>
                        <div class="group-input gi-check">
                            <div class="gi-more">
                                <label for="save-pass">
                                    Lưu mật khẩu
                                    <input type="checkbox" id="save-pass">
                                    <span class="checkmark"></span>
                                </label>
                                <a href="#" class="forget-pass">Quên mật khẩu</a>
                            </div>
                        </div>
                            <button type="submit" class="site-btn login-btn">Đăng nhập</button>
                    </form>
                    <div class="container" style="margin-top: 30px;">
                        <a class="btn btn-lg  btn-facebook btn-social" style="color: white;">
                            <i class="fa fa-facebook fa-fw"></i> Sign in with Facebook
                        </a>
                        <a class="btn btn-lg btn-social" style="border: 1px solid black;" href="#">
                            <img src="https://img.icons8.com/color/16/000000/google-logo.png"> Signup Using Google
                        </a>
                    </div>
                    <div class="switch-login">
                        <a href="${base}/register" style="margin-right: 20px" class="or-login">
                            Hoặc tạo tài khoản</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Form Section End -->

<!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- java script -->
<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>
</body>

</html>