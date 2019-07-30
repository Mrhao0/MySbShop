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

<title>商品管理页面</title>

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

		$("#selDep2").change(function(){
			if($(this).val()==0){
				$("#cid").val(null);
				$("#csid").val(null);
			}else{
				window.location=$(this).val();
			}
		})
    	$("[name='delp']").click(function(){
    		var pid=$(this).attr("id");
    		$.ajax({
				url:"${pageContext.request.contextPath}/product/delp",
				data:{
					pid:pid,
				},
				success:function(data){
					//$("#p"+pid).remove();
					window.location.reload();
				}
			})
		});
        $.ajax({
            url:"${pageContext.request.contextPath}/product/types",
            dataType:"json",
            success:function(data){
                $("#selDep1").html(" <option value='0'>请选择第一类目</option>");
                for(var i=0;i<data.length;i++){
                    if(${empty param.cid?0:param.cid}==data[i].cid){
                        $("#selDep1").append("<option selected id="+data[i].cid+">"+data[i].cname+"</option>");
                    }else{
                        $("#selDep1").append("<option  id="+data[i].cid+">"+data[i].cname+"</option>");
                    }
                }
                if(${!empty param.csid}){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/product/typechange",
                        dataType:"json",
                        data:{
                            cid:${empty param.cid?0:param.cid},
                        },
                        success:function(data){
                            console.log("成功");
                            console.log("1"+data);
							$("#selDep2").html("<option value='0'>请选择第一类目</option>");
                            for(var i=0;i<data.length;i++){
                                if(${empty param.csid?0:param.csid}==data[i].csid) {
                                    $("#selDep2").append("<option selected id='type" + data[i].csid + "' value='http://127.0.0.1:8081/MySbShop/back/products.do?cid=" + ${param.cid} + "&csid=" + data[i].csid + "'>" + data[i].csname + "</option>");
                                }else{
                                    $("#selDep2").append("<option id='type" + data[i].csid + "' value='http://127.0.0.1:8081/MySbShop/back/products.do?cid=" + ${param.cid} + "&csid=" + data[i].csid + "'>" + data[i].csname + "</option>")
                                }
                            }
                        }
                    })
                }
            }
        });
		if(${!empty param.cid}){
			var cid=${param.cid}
			console.log(cid)
			$("#cid").val(cid);
			$.ajax({
				url:"${pageContext.request.contextPath}/product/typechange",
				dataType:"json",
				data:{
					cid:cid
				},
				success:function(data){
					console.log("2"+data);
					for(var i=0;i<data.length;i++){
						$("#selDep2").append("<option id='type"+data[i].csid+"' value='http://127.0.0.1:8081/MySbShop/back/products.do?cid="+cid+"&csid="+data[i].csid+"'>"+data[i].csname+"</option>");
					}
				}
			})
		}
        $("#selDep1").change(function(){
			$("#selDep2").html("<option value='0'>请选择第一类目</option>");

            var cid=$("#selDep1 option:selected").attr("id");
			$("#cid").val(cid);
            $.ajax({
                url:"${pageContext.request.contextPath}/product/typechange",
                dataType:"json",
                data:{
                    cid:cid
                },
                success:function(data){
                    console.log("3"+data);
                    for(var i=0;i<data.length;i++){
                        $("#selDep2").append("<option id='type"+data[i].csid+"' value='http://127.0.0.1:8081/MySbShop/back/products.do?cid="+cid+"&csid="+data[i].csid+"'>"+data[i].csname+"</option>");
                    }
                }
            })
        });
        $("[name='ishot']").change(function(){
            var old=$(this).attr("abc");
            var neww=0;
            var pid=$(this).attr("id");
            if(old==0){
                neww=1;
            }
            console.log(pid+"----"+old);
            $.ajax({
                url:"${pageContext.request.contextPath}/product/isHotAjax.do",
                data:{
                    isHot:neww,
                    pid:pid
                },
                success:function(data){
                    console.log(data);
                    // if(old==0){
                    //     $(this).children("[id='1']").prop("selected", true);
                    //     $(this).children("option:selected")[0].selected=false;
                    // }else{
                    //     $(this).children("[id='0']").prop("selected", true);
                    //     $(this).children("option:selected")[0].selected=false;
                    // }
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
									<h4 class="title">商品管理</h4>
									<p class="category">Here is a subtitle for this table</p>
									<form action="${pageContext.request.contextPath}/back/products.do" method="get">
                                        <input type="hidden" id="cid" name="cid" value="${param.cid}">
                                        <input type="hidden" id="csid" name="csid" value="${param.csid}">
		                          	<div style="float:left;  width: 130px;">

		                           <select id="selDep1" name="selDep1" class="form-control" style="width: 130px;">
									   <option value="0">请选择第一类目</option>
		                           </select>
                                    </div>
                                    <div style="float:left;  width: 130px;">
                                   <select id="selDep2" name="selDep2"  class="form-control" style="width: 130px;">
                                       <option value="0">请选择第一类目</option>

                                   </select>
		                           </div>
		                         	 
		                           <div style="float:left; margin:0 2px; width: 130px;"> 
		                            <input type="text" class="form-control" placeholder="查询产品" size=8  name="pName"  value="${param.pName}">
		                          </div>
		                          <div style="float:left; margin:0 2px; width: 65px;">
		                          <button type="submit"  class="btn btn-info btn-fill pull-right">查询</button>
		                          </div>
                          	</form>
									
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-hover table-striped">
										<thead>
											<th>产品ID</th>
											<th>图片</th>
											<th>产品名称</th>
											<th>市价</th>
											<th>售价</th>
											<th>详情介绍</th>
											<th>生产日期</th>
											<th>是否热门</th>
											<th>操作</th>
											<th>操作</th>
											<th>操作</th>
										</thead>
										<tbody>
                                        <c:forEach items="${requestScope.productBean.alist}" var="list">
												<tr id="p${list.pid}"  height="35px">
													<td>${list.pid}</td>
													<td><img src="${list.image}" style="width: 100px;height: 60px"></td>
													<td>${list.pName}</td>
													<td>${list.marketPrice}</td>
													<td>${list.shopPrice}</td>
													<td>${fn:substring(list.pdesc,0,10)}...</td>
													<td>${list.pdate}</td>
													<td>
                                                        <select name="ishot" id="${list.pid}" abc="${list.isHot}">
                                                            <option ${list.isHot==1?'selected':''} id="1" value="1">是</option>
                                                            <option ${list.isHot==0?'selected':''} id="0" value="0">否</option>
                                                        </select>
                                                    </td>
													<td style="font-size: 12px"><a name="updatep" href="${pageContext.request.contextPath}/product/update.do?pid=${list.pid}&pageNow=${empty param.pageNow?1:param.pageNow}&cid=${param.cid}&csid=${param.csid}">修改</a></td>
													<td  style="font-size: 12px"><a href="${pageContext.request.contextPath}/product/pinf.do?pid=${list.pid}&pageNow=${empty param.pageNow?1:param.pageNow}&cid=${param.cid}&csid=${param.csid}">详情</a></td>
													<td  style="font-size: 12px"><a name="delp" id="${list.pid}" href="#">删除</a></td>

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
                                    <c:if test="${pageN>requestScope.productBean.pageCount}">
                                        <c:set var="pageN" value="${requestScope.productBean.pageCount}"></c:set>
                                    </c:if>
                                    <c:if test="${pageN<3}">
                                        <c:set var="star" value="1"></c:set>
                                        <c:set var="end" value="5"></c:set>
                                    </c:if>
                                    <c:if test="${pageN>requestScope.productBean.pageCount-2}">
                                        <c:set var="star" value="${requestScope.productBean.pageCount-4}"></c:set>
                                        <c:set var="end" value="${requestScope.productBean.pageCount}"></c:set>
                                    </c:if>
                                    <c:if test="${pageN>=3 && pageN<=requestScope.productBean.pageCount-2}">
                                        <c:set var="star" value="${pageN-2}"></c:set>
                                        <c:set var="end" value="${pageN+2}"></c:set>
                                    </c:if>
                                    <c:if test="${requestScope.productBean.pageCount<5}">
                                        <c:set var="star" value="1"></c:set>
                                        <c:set var="end" value="${requestScope.productBean.pageCount}"></c:set>
                                    </c:if>
								</div>
                                <div class="paging" style="width: 600px;">

                                     <c:if test="${pageN!=1}">
										  <a href="${pageContext.request.contextPath}/back/products.do?pageNow=1&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}" class="about left-r f-l">首页</a>
                                         <a href="${pageContext.request.contextPath}/back/products.do?pageNow=${pageN-1}&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}" class="about left-r f-l">上一页</a>
                                     </c:if>

                                         <c:forEach begin="${star}" end="${end}" var="i">

                                             <c:if test="${i==pageN}">
                                             <a style="color: #dddd38" href="${pageContext.request.contextPath}/back/products.do?pageNow=${i}&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}">第${i}页</a>
                                             </c:if>
                                             <c:if test="${i!=pageN}">
                                             <a href="${pageContext.request.contextPath}/back/products.do?pageNow=${i}&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}">第${i}页</a>
                                             </c:if>
                                         </c:forEach>

                                     <c:if test="${pageN!=requestScope.productBean.pageCount}">
                                         <a href="${pageContext.request.contextPath}/back/products.do?pageNow=${pageN+1}&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}" class="about left-l f-l">下一页</a>
										  <a href="${pageContext.request.contextPath}/back/products.do?pageNow=${requestScope.productBean.pageCount}&pName=${param.pName}&cid=${param.cid}&csid=${param.csid}" class="about left-l f-l">尾页</a>
                                     </c:if>
	                          
	                          <form action="${pageContext.request.contextPath}/back/products.do" method="post">
                                  <input type="hidden" name="pName" value="${param.pName}">
                                  <input type="hidden" name="cid" value="${param.cid}">
                                  <input type="hidden" name="csid" value="${param.csid}">
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