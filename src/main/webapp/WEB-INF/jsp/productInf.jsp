<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>产品信息详情页</title>

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


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="${pageContext.request.contextPath}/css/demo.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->

<link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css"
	rel="stylesheet" />
<script type="text/javascript">
    window.onload = function(){
    	$("#sc").click(function(){
			window.location.href = "${pageContext.request.contextPath}/back/products.do?cid=${requestScope.productBean.cid}&csid=${requestScope.productBean.csid}&pageNow=${requestScope.productBean.pageNow}";
		});
        var E = window.wangEditor;
        //这里的id为<div id="editor"中的id.
        var editor = new E('#editor');
        // 配置服务器端地址,也就是controller的请求路径，不带项目路径，前面没有/
        editor.customConfig.uploadImgServer = 'ajax?flag=inputflag';
        
        //配置属性名称，绑定请求的图片数据
        //controller会用到，可以随便设置，但是一定要与controller一致
        //editor.customConfig.uploadFileName = 'img';
        //创建编辑器
        editor.create();
    };
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.js"></script>
</head>
<body>

	<div class="wrapper">

            <%@ include file="page/left.jsp" %>

		<div class="main-panel">
			
        <%@ include file="page/nav.jsp" %>



			<div class="content">
			
				<div class="container-fluid">
				
					<div class="row">
						<div class="card">

							<div>
							<input type="hidden" name="pid" value="${requestScope.product.pid}">
							<table>
								<tr>
									<td>
										<div id="imgs"><img style="width: 150px;height: 100px" src="${requestScope.product.image}" /></div>
									</td>
									<td width="303" align="right">
										是否热门:<input readonly style="width: 20px" type="text" value="${requestScope.product.isHot==0?'否':'是'}">
									</td>
								</tr>
							</table>
							
							</div>
							<div >
								<div style="float:left; width: 400px;" class="form-group">

									<div style="float:left;  width: 250px;">
										<p style="float: left;margin-top: 7px">
										类别:
										</p>
										<div style="float: left">

											<input type="text"  class="form-control" style="width: 100px" readonly value="${requestScope.cac.cname}">
										</div>
										<div style="float: left">
											<input type="text"  class="form-control" style="width: 100px" readonly value="${requestScope.cac.csname}">
										</div>
									</div>

									<div style="width: 260px;">
										<p style="float: left;margin-top: 7px">
											产品名:
										</p>
											<div style="float: left">
												<input readonly value="${requestScope.product.pName}" class="form-control" placeholder="${requestScope.product.pName}" type="text"/>
											</div>
									</div>

									<div style="width: 250px;">
										<p style="float: left;margin-top: 7px">

										</p>
										<div style="float: left">
											生产日期:<input readonly value="${requestScope.product.pdate}" class="form-control" placeholder="${requestScope.product.pdate}" type="text"  />
										</div>
									</div>

								</div>
							</div>

							<div style="width: 700px;height: 80px;">
								<div><span>市价:</span><input readonly value="${requestScope.product.marketPrice}" type="number" id="marketPrice" name="marketPrice" step="0.01"></div>
								<div><span>售价:</span><input readonly value="${requestScope.product.shopPrice}" type="number" id="shopPrice" name="shopPrice" step="0.01"></div>
							</div>

							<div style="width: 800px; height: 400px;margin-top: 80px">
								<div id="editor">
　								<!-- 默认显示 -->
								<p>${requestScope.product.pdesc}</p>

								</div>
								 <input type="button" id='sc'   class="btn btn-info btn-fill pull-right"  value="返回"/>
							</div>

						</div>
					</div>
				</div>
			</div>

<%@ include file="page/footer.jsp" %>
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