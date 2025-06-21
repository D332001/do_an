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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Css Styles -->
    <jsp:include page="/WEB-INF/views/admin/common/css.jsp"></jsp:include>
    <style>#barChart{
        background-color: grey;
        border-radius: 6px;
    }</style>
</head>

<body class="app sidebar-mini">

<jsp:include page="/WEB-INF/views/admin/common/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/common/menu.jsp"></jsp:include>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-th-list"></i>Báo cáo thống kê</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item">Admin</li>
            <li class="breadcrumb-item active"><a href="#">Báo cáo thống kê</a></li>
        </ul>
    </div>
    <div class="container" style="display: flex; justify-content: space-between;">
        <div>
            <p style="text-align: center; font-size: 2rem;">Thống kê tài khoản</p>
            <canvas id="doughnut-chart" style="width:500px; max-height: 500px"></canvas>
        </div>
        <div>
            <p  style="text-align: center;font-size: 2rem;">Thống kê đơn hàng</p>
            <canvas id="doughnut-chart2" style="width:500px; max-height: 500px"></canvas>
        </div>
    </div>
</main>

<!-- js-->
<jsp:include page="/WEB-INF/views/admin/common/js.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    new Chart(document.getElementById("doughnut-chart"), {
        type: 'doughnut',
        data: {
            labels: ["Admin", "staff", "customer"],
            datasets: [
                {
                    label: "Population (millions)",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f"],
                    data: [2,3,4]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Predicted world population (millions) in 2050'
            }
        }
    });
    new Chart(document.getElementById("doughnut-chart2"), {
        type: 'doughnut',
        data: {
            labels: ["Đã Giao", "Đang Chờ", "Đã Hủy"],
            datasets: [
                {
                    label: "Population (millions)",
                    backgroundColor: ["#3cba9f","#e8c3b9","#c45850"],
                    data: [${order.delivered},${order.waiting},${order.cancel}]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Predicted world population (millions) in 2050'
            }
        }
    });
</script>
</body>
</html>
