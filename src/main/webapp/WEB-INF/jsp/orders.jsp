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

<title>订单管理页面</title>

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
		$("[name='stateChange']").change(function(){
			var ostate=$(this).val();
			var oid=$(this).attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/order/changeState",
				data:{
					oid:oid,
					state:ostate
				},
				success:function(data){
					alert("ok");
				}
			})
		})
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
								<div class="header">
									<h4 class="title">订单管理</h4>
									<p class="category">Here is a subtitle for this table</p>
									<form action="${pageContext.request.contextPath}/order/orderlist.do" method="get">

		                          	<div style="float:left;  width: 130px;">

		                           <select id="selDep1" name="state" class="form-control" style="width: 130px;">
									   <option value="0"> 请选择</option>
									   <option ${param.state==1?'selected':''} value="1">待付款</option>
									   <option ${param.state==2?'selected':''} value="2">待发货</option>
									   <option ${param.state==3?'selected':''} value="3">已发货</option>
									   <option ${param.state==4?'selected':''} value="4">已签收</option>
		                           </select>
                                    </div>

		                         	 
		                           <div style="float:left; margin:0 2px; width: 130px;"> 
		                            <input type="number" class="form-control" placeholder="订单编号" size=8  name="oid"  value="${param.oid}">
		                          </div>
		                          <div style="float:left; margin:0 2px; width: 65px;">
		                          <button type="submit"  class="btn btn-info btn-fill pull-right">查询</button>
		                          </div>
                          	</form>
									
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<th>订单号</th>
											<th>总价</th>
											<th>订货日期</th>
											<th>状态</th>
											<th>收货人</th>
											<th>收货人号码</th>
											<th>收货人地址</th>
											<th>买家</th>
											<th>操作</th>
										</thead>
										<tbody>
                                        <c:forEach items="${requestScope.ordersBean.alist}" var="list">
												<tr  height="35px">
													<td>${list.oid}</td>
													<td>${list.total}</td>
													<td>${list.ordertime}</td>
													<td>
													<select id="${list.oid}" name="stateChange">
														<option ${list.state==1?'selected':''} value="1">待付款</option>
														<option ${list.state==2?'selected':''} value="2">待发货</option>
														<option ${list.state==3?'selected':''} value="3">已发货</option>
														<option ${list.state==4?'selected':''} value="4">已签收</option>
													</select>
													</td>
													<td>${list.name}</td>
													<td>${list.phone}</td>
													<td>${list.addr}</td>
													<td>${list.oname}</td>
													<td style="font-size: 12px"><a
														href="${pageContext.request.contextPath }/order/orderitem.do?oid=${list.oid}">详情</a></td>
												</tr>
                                        </c:forEach>
										</tbody>
									</table>
                                    <c:if test="${empty param.pageNow || param.pageNow<1}">
                                        <c:set var="pageN" value="1"></c:set>
                                    </c:if>
                                    <c:if test="${!empty param.pageNow}">
                                        <c:set var="pageN" value="${param.pageNow}"></c:set>
                                    </c:if>
                                    <c:if test="${pageN>requestScope.ordersBean.pageCount}">
                                        <c:set var="pageN" value="${requestScope.ordersBean.pageCount}"></c:set>
                                    </c:if>
                                    <c:if test="${pageN<3}">
                                        <c:set var="star" value="1"></c:set>
                                        <c:set var="end" value="5"></c:set>
                                    </c:if>
                                    <c:if test="${pageN>requestScope.ordersBean.pageCount-2}">
                                        <c:set var="star" value="${requestScope.ordersBean.pageCount-4}"></c:set>
                                        <c:set var="end" value="${requestScope.ordersBean.pageCount}"></c:set>
                                    </c:if>
                                    <c:if test="${pageN>=3 && pageN<=requestScope.ordersBean.pageCount-2}">
                                        <c:set var="star" value="${pageN-2}"></c:set>
                                        <c:set var="end" value="${pageN+2}"></c:set>
                                    </c:if>
                                    <c:if test="${requestScope.ordersBean.pageCount<5}">
                                        <c:set var="star" value="1"></c:set>
                                        <c:set var="end" value="${requestScope.ordersBean.pageCount}"></c:set>
                                    </c:if>
								</div>
                                <div class="paging" style="width: 600px;">

                                     <c:if test="${pageN!=1}">
										 <a href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=1&oid=${param.oid}&state=${param.state}" class="about left-r f-l">首页</a>
                                         <a href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=${pageN-1}&oid=${param.oid}&state=${param.state}" class="about left-r f-l">上一页</a>
                                     </c:if>

                                         <c:forEach begin="${star}" end="${end}" var="i">

                                             <c:if test="${i==pageN}">
                                             <a style="color: #dddd38" href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=${i}&oid=${param.oid}&state=${param.state}">第${i}页</a>
                                             </c:if>
                                             <c:if test="${i!=pageN}">
                                             <a href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=${i}&oid=${param.oid}&state=${param.state}">第${i}页</a>
                                             </c:if>
                                         </c:forEach>

                                     <c:if test="${pageN!=requestScope.ordersBean.pageCount}">
                                         <a href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=${pageN+1}&oid=${param.oid}&state=${param.state}" class="about left-l f-l">下一页</a>
										 <a href="${pageContext.request.contextPath}/order/orderlist.do?pageNow=${requestScope.ordersBean.pageCount}&oid=${param.oid}&state=${param.state}" class="about left-r f-l">尾页</a>
									 </c:if>
	                          
	                          <form action="${pageContext.request.contextPath}/order/orderlist.do" method="post">
                                  <input type="hidden" name="pName" value="${param.oid}">
                                  <input type="hidden" name="cid" value="${param.state}">
	                          	<div style=" float: right; margin:-50px 80px 0 0; width: 60px; height: 40px">
	                          	 <input type="number" id="skipNum" class="form-control" placeholder="页面" size=2  name="pageNow" >
	                           </div>
	                           <div style="float: right; margin:-50px 10px 0 0; width: 60px; height: 40px">
	                          	<button type="submit" id="skipBut"  class="btn btn-info btn-fill pull-right">跳转</button>
	                           </div>
	                           </form>
	                          
	                          
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
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/js/bootstrap-notify.js"></script>


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script
	src="${pageContext.request.contextPath}/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>


</html>