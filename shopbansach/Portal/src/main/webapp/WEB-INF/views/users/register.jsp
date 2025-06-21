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
                       <span>Đăng ký</span>
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
                    <div class="register-form">
                        <h2>Đăng ký</h2>
                        <form>
                            <div class="group-input">
                                <label for="username">Tên đăng nhập</label>
                                <input type="text"  id="username" path="username"  class="form-control"/><span style="color:red;" id="numloc1"></span><br/>
                            </div>
                            <div class="group-input">
                                <label for="password">Mật khẩu</label>
                                <input type="password" id="password" path="password" class="form-control" name="password"/><span style="color:red;" id="numloc2"></span><br/>
                            </div>
                            <div class="group-input">
                                <label for="email">Email</label>
                                <input type="text" id="email" path="email" class="form-control" /><span style="color:red;" id="numloc3"></span><br/>
                            </div>
                            <div class="group-input">
                                <label for="phone">Số điện thoại</label>
                                <input type="text" id="phone" path="phone" class="form-control" /><span style="color:red;" id="numloc4"></span><br/>
                            </div>
                            <div class="group-input">
                                <label for="address">Địa chỉ</label>
                                <input type="text" id="address" path="address" class="form-control" />
                            </div>
                            <button type="button" onclick="formValidation()" id="btn-register" class="site-btn register-btn">Đăng ký</button>
                        </form>
                        <div class="switch-login">
                            <a href="${base}/login" class="or-login">Hoặc đăng nhập</a>
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

    <script>
        // Select all input elements for varification
        const name = document.getElementById("username");
        const email = document.getElementById("email");
        const password = document.getElementById("password");
        const phoneNumber = document.getElementById("phone");
        // function for form varification
        function formValidation() {
            // checking name length
            var check = new Boolean(true);
            if (name.value.length < 2 || name.value.length > 20) {
                document.getElementById("numloc1").innerHTML="Name length should be more than 2 and less than 21";
                name.focus();
                check == false;
                return check;
            }document.getElementById("numloc1").innerHTML="";
            // checking email
            if (!email.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
                document.getElementById("numloc3").innerHTML="Please enter a valid email!";
                email.focus();
                return false;
            }document.getElementById("numloc3").innerHTML="";
            // checking password
            if (!password.value.match(/^.{5,15}$/)) {
                document.getElementById("numloc2").innerHTML="Password length must be between 5-15 characters!";
                password.focus();
                return false;
            }document.getElementById("numloc2").innerHTML="";
            // checking phone number
            if (!phoneNumber.value.match(/^[0-9]{10}$/)) {
                document.getElementById("numloc4").innerHTML="Phone number must be 10 characters long number and first digit can't be 0!";
                phoneNumber.focus();
                return false;
            }document.getElementById("numloc4").innerHTML="";
            if(check == true){
                var data = {};
                data["username"] = $('#username').val();
                data["password"] = $('#password').val();
                data["address"] = $('#address').val();
                data["phone"] = $('#phone').val();
                data["email"] = $('#email').val();
                $.ajax({
                    url:"/save-user",
                    type:"post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    dataType: "json"
                });
                window.location.href="http://localhost:8088/login";
            }
        }
    </script>
</body>

</html>
