<%@ page import="com.portal.entities.User" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- spring taglibs -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url value="${pageContext.request.contextPath}" var="base" />

<!-- sử dụng tiếng việt -->
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<header>
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar" >
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar" style="font-size: 1rem;">
                    HotLine: 0946182681
                </div>
                <div class="right-top-bar flex-w h-full" >
                    <sec:authorize access="isAuthenticated()">
                            <%
                                String username = "";
                                Object principal = org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                                if (principal instanceof org.springframework.security.core.userdetails.UserDetails) {
                                    username = ((User)principal).getUsername().toUpperCase(Locale.ROOT);
                                }
                            %>
                            <p style="display: none" id="nameAD"><%=username %></p>
                            <a class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;" href="${base}/">
                               Xin chào <%=username %>!
                            </a>
                            <a class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;" href="${base}/logout">
                                <i class="fa fa-sign-out"></i>&ensp;Đăng xuất
                            </a>
                        <sec:authorize access="hasAnyRole('ROLE _ADMIN','ROLE_STAFF')">
                            <a href="${base}/admin/report" id="accessAD" class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;">
                                Trang quản trị
                            </a>
                        </sec:authorize
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="${base}/login" class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;">
                            <i class="fa fa-user"></i>&ensp;Đăng nhập
                        </a>
                        <a href="${base}/register" class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;">
                            <i class="fa fa-user-plus"></i></i>&ensp;Đăng ký
                        </a>
                    </sec:authorize>


                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop container">

                <!-- Logo Shop -->
                <a href="${base}/" class="logo">
                    <img src="${base}/img/logo.png" alt="IMG-LOGO">
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu" >
                        <li class="active-menu">
                            <a style="font-size: 22px;" href="${base}/">Trang chủ</a>
                        </li>

                        <li>
                            <a style="font-size: 22px;" href="${base}/shop">Danh mục</a>
                        </li>

                        <li>
                            <a style="font-size: 22px;" href="${base}/blog">Tin tức</a>
                        </li>

                        <li>
                            <a style="font-size: 22px;" href="${base}/contact">Liên hệ</a>
                        </li>
                    </ul>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m"><a href="${base}/cart">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${SL_GIO_HANG}">
                        <i class="fa fa-shopping-cart"></i>
                    </div></a>
                </div>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="${base}/"><img src="${base}/img/logo.png" alt="IMG-LOGO"></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">

            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                <i class="fa fa-shopping-cart"></i>
            </div>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"><i style="font-size: 2rem;" class="fa fa-bars"></i></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar" style="font-size: 1rem;">
                    HotLine: 0868686868
                </div>
            </li>
            <li>
                <div class="right-top-bar flex-w h-full" >
                    <a href="${base}/login" class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;">
                        <i class="fa fa-user"></i>&ensp;Đăng nhập
                    </a>

                    <a href="${base}/register" class="flex-c-m trans-04 p-lr-25" style="font-size: 1rem;">
                        <i class="fa fa-sign-out"></i>&ensp;Đăng ký
                    </a>


                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li>
                <a href="${base}/">Trang chủ</a>
            </li>

            <li>
                <a href="${base}/shop">Danh mục</a>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="${base}/blog">Tin tức</a>
            </li>

            <li>
                <a href="${base}/contact">Liên hệ</a>
            </li>
        </ul>
    </div>

</header>
