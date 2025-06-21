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
							<span>Danh mục</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->
    <section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1 check-cate" data-filter="*">
						Tất cả
					</button>
					<c:forEach items="${categories}" var="cate">
						<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=.${cate.code}>
								${cate.name}
						</button>
					</c:forEach>
				</div>

				<div class="flex-w flex-c-m m-tb-10">

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Tìm kiếm
					</div>
				</div>

				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<form action="/search-product" class="bor8 dis-flex p-l-15">
						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="keyword" id="keyword" size="50" value="${keyword}" placeholder="Search">
						<button type="submit" class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i style="font-size: 1.5rem; margin-right: 30px" class="fa fa-search"></i>
						</button>
					</form>
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27" style="width:50%;">
							<div class="mtext-102 cl2 p-b-15">
								Sắp xếp
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Mặc định
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Theo mã sản phẩm
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Theo tên sản phẩm
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 ">
										Giá thấp đến cao
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Giá cao đến thấp
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27" style="width:50%;">
							<div class="mtext-102 cl2 p-b-15">
								Giá
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Tất cả
									</a>
								</li>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										50.000-200.000 VND
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										200.000-500.000 VND
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										500.000-1.000.000 VND
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Trên 1.000.000 VND
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row isotope-grid">
				<c:forEach items="${listProducts}" var="product">
					<div class="categories">
						<div  class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item category">
							<!-- Block2 -->
							<span class="123"></span>
							<div class="block2">
								<p class="check-cate" style="display: none">${product.category.code}</p>
								<div class="block2-pic hov-img0">
									<img src="${base}/file/upload/${product.productImages[0].path}">

									<a href="${base }/product/${product.seo}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
										Xem chi tiết
									</a>
								</div>

								<div class="block2-txt flex-w flex-t p-t-14" >
									<div class="block2-txt-child1 flex-col-l " style="align-items: center; width: 100%">
										<div style="height: 50px;text-align: center">${product.title}</div>

										<div class="product-price" style="color: #e7ab3c;font-size: 20px;font-weight: 700;">
											<fmt:setLocale value="vi_VN"/>
											<fmt:formatNumber value="${product.price}" type="currency"/>

											<span style="font-size: 14px;font-weight: 400;color: #b2b2b2;text-decoration: line-through;">
												<fmt:setLocale value="vi_VN"/>
												<fmt:formatNumber value="${product.price + 20000}" type="currency"/>
                                    		</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Xem thêm
				</a>
			</div>
		</div>
	</section>

	<!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/views/users/common/footer.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- java script -->
	<jsp:include page="/WEB-INF/views/users/common/js.jsp"></jsp:include>
	<script>
		$('.categories').each(function(idx, element) {
			let $el = $(element);
			$el.find('.category').addClass($el.find('.check-cate').text());
		})
	</script>
</body>

</html>
