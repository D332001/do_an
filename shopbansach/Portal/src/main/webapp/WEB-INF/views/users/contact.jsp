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

</head>

<body>
<%--header--%>
    <jsp:include page="/WEB-INF/views/users/common/header.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section" style="margin-top: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Trang chủ</a>
                        <span>Liên hệ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Map Section Begin -->
    <div class="map spad">
        <div class="container">
            <div class="map-inner">
                <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d7447.147698380444!2d105.73116859988491!3d21.049730760005243!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1660663020741!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" width="600" height="600" style="border:0;" allowfullscreen="" loading="lazy" ></iframe>
                <div class="icon">
                    <i class="fa fa-map-marker"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact-title">
                        <h4>Liên hệ với chúng tôi</h4>
                        <p>Cửa hàng VH Store</p>
                    </div>
                    <div class="contact-widget">
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-location-pin"></i>
                            </div>
                            <div class="ci-text">
                                <span>Đia chỉ:</span>
                                <p>Phương Canh - Nam Từ Liêm - Hà Nội</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-mobile"></i>
                            </div>
                            <div class="ci-text">
                                <span>Số điện thoại:</span>
                                <p>0868686868</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-email"></i>
                            </div>
                            <div class="ci-text">
                                <span>Email:</span>
                                <p>hieu0303@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="contact-form">
                        <div class="leave-comment">
                            <h4>Để lại bình luận</h4>
                            <p>Nhân viên của chúng tôi sẽ gọi lại sau và giải đáp các thắc mắc của bạn.</p>
                            <p id="notify" style="display:none; padding:10px;margin-bottom:10px;color: #19c1dc; box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; text-align: center"></p><br />
                            <form class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input id="username" type="text" placeholder="Tên đầy đủ" />
                                    </div>
                                    <div class="col-lg-6">
                                        <input id="email" type="text" placeholder="Email" />
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea id="mess" placeholder="Lời nhắn" ></textarea>
                                        <button id="send" type="button" class="site-btn">Gửi tin nhắn</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
    <jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>

    <jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>
</body>
    <script>
        $('#send').click(function (){
           let username = $('#username').val();
           let email = $('#email').val();
           let mess = $('#mess').val();
           var data = {
               fullName: username,
               email: email,
               message: mess
           }
            if (username == "" ) {
                alert("thiếu tên");
            }else if(email == "" ) {
                alert("thiếu email");
            }else if(mess == "" ) {
                alert("bach lời nhắn");
            }else{
                $.ajax({
                    url:"/save-contact",
                    type:"post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success:function (){
                        $("#notify").css("display", "block");
                        $('#notify').html("Thành công");
                        setTimeout(function() {
                            $('#notify').fadeOut('fast');
                        }, 1000);
                    }
                });
            }

        });
    </script>
</html>