<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png"
		  href="${pageContext.request.contextPath}/images/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>订单详情页</title>

	<meta
			content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
			name='viewport' />
	<meta name="viewport" content="width=device-width" />
	<!-- Bootstrap core CSS     -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
		  rel="stylesheet" />

	<!-- Animation library for notifications   -->
	<link href="${pageContext.request.contextPath}/css/animate.min.css"
		  rel="stylesheet" />

	<!--  Light Bootstrap Table core CSS    -->
	<link
			href="${pageContext.request.contextPath}/css/light-bootstrap-dashboard.css"
			rel="stylesheet" />

	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
	<!--  CSS for Demo Purpose, don't include it in your project     -->
	<link href="${pageContext.request.contextPath}/css/demo.css"
		  rel="stylesheet" />


	<!--     Fonts and icons     -->

	<link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css"
		  rel="stylesheet" />
	<script type="text/javascript">
		$(function(){

		})
	</script>
</head>
<body>

<div class="wrapper">

	<%@ include file="page/left.jsp" %>

	<div class="main-panel">

		<%@ include file="page/nav.jsp" %>

		<div class="content">
			<div class="container-fluid">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div style="float: left" class="header">
								<span style="font-size: x-large;" class="title">订单号:${requestScope.orderExt.oid}</span>
                                <c:if test="${requestScope.orderExt.state==1}">
                                    <span style="color: #ac2925">待付款</span>
                                </c:if>
                                <c:if test="${requestScope.orderExt.state==2}">
                                    <span style="color: #ac8928">待发货</span>
                                </c:if>
                                <c:if test="${requestScope.orderExt.state==3}">
                                    <span style="color: #9fac3c">待收货</span>
                                </c:if>
                                <c:if test="${requestScope.orderExt.state==4}">
                                    <span style="color: #5fac2a">已签收</span>
                                </c:if>
							</div>

                            <div style="float: right;margin-top: 10px;margin-right: 10px;border: #1DC7EA dashed 5px;">
                                <p>收货人:${requestScope.orderExt.name}</p>
                                <p>收货人号码:${requestScope.orderExt.phone}</p>
                                <p>收货人地址:${requestScope.orderExt.addr}</p>
                            </div>

                            <div style="float: right;margin-top: 10px; margin-right: 10px;border: #59eace dashed 5px;">
                            <p>买家：${requestScope.orderExt.oname}</p>
                            <p>订货日期：${requestScope.orderExt.ordertime}</p>
                            </div>

<div class="content table-responsive table-full-width">
	<table class="table table-hover table-striped">
		<thead>
		<th>产品图片</th>
		<th>产品名称</th>
		<th>市价</th>
		<th>售价</th>
		<th>热门</th>
		<th>数量</th>
		<th>小计</th>
		</thead>
		<tbody>

		<c:forEach items="${requestScope.orderExt.orderItemList}" var="ItemList">
			<tr  height="35px">
				<td><img style="width: 150px;height: 100px" src="${ItemList.product.image}" /></td>
				<td>${ItemList.product.pName}</td>
				<td>${ItemList.product.marketPrice}</td>
				<td>${ItemList.product.shopPrice}</td>
				<td>${ItemList.product.isHot==1?'是':'否'}</td>
				<td>${ItemList.count}</td>
				<td>${ItemList.subtotal}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
                            <div style="float: right;font-size: medium">
                                <p>总价￥：${requestScope.orderExt.total}</p>
                            </div>
						</div>

					</div>

					<%@ include file="page/footer.jsp" %>
				</div>
			</div>
		</div>
	</div>

</body>

<!--   Core JS Files   -->
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>

</html>