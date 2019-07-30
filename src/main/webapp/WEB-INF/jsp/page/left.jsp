<%@ page pageEncoding="utf-8"%>
<div class="sidebar" data-color="grow" data-image="images/sidebar-5.jpg">
    	<div class="sidebar-wrapper">
			<div class="logo">
                <a href="${pageContext.request.contextPath }/WebIndex/lowindex.jsp" class="simple-text">
                    <img src="${pageContext.request.contextPath}/images/logo.png">
                </a>
            </div>
           
            <ul class="nav">

               	<li>
                    <a href="${pageContext.request.contextPath }/order/orderlist.do">
                        <i class="pe-7s-news-paper"></i>
                        <p>订单列表</p>
                    </a>
                </li>
                
                <li> 
                    <a href="${pageContext.request.contextPath }/back/products.do">
                        <i class="pe-7s-note2"></i>
                        <p>产品列表</p>
                    </a>
                </li>

                <li>
                    <a href="${pageContext.request.contextPath }/product/productUp.do">
                        <i class="pe-7s-science"></i>
                        <p>产品上传</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="manage/">
                        <i class="pe-7s-rocket"></i>
                        <p>购买专业版</p>
                    </a>
                </li>
            </ul>
            	</div>
    </div>
