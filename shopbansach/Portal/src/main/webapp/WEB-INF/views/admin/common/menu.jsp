 <!-- sử dụng tiếng việt -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <ul class="app-menu">
        <li><a class="app-menu__item" href="${base}/admin/report"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Báo cáo thông kê</span></a></li>
        <li><a class="app-menu__item" href="${base}/admin/list-product"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
        <li><a class="app-menu__item" href="${base}/admin/list-order"><i class="app-menu__icon fa fa-truck"></i><span class="app-menu__label">Quản lý Đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="${base}/admin/contacts"><i class="app-menu__icon fa fa-envelope"></i><span class="app-menu__label">Quản lý liên hệ</span></a></li>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
            <li><a class="app-menu__item" href="${base}/manager/users"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Quản lý tài khoản</span></a></li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
            <li><a class="app-menu__item" href="${base}/admin/list-role"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">Phân quyền</span></a></li>
        </sec:authorize>
        <li><a class="app-menu__item" href="${base}/admin/list-category"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Quản lý danh mục</span></a></li>
        <li><a class="app-menu__item" href="${base}/admin/sales"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">Quản lý mã giảm giá</span></a></li>
    </ul>
</aside>