
   
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

<title>产品信息上传页</title>

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
		$.ajax({
			url:"${pageContext.request.contextPath}/product/types",
			dataType:"json",
			success:function(data){
				console.log("4"+data);
				$("#selDep3").html("<option>请选择第一类目</option>");
				for(var i=0;i<data.length;i++){
						$("#selDep3").append("<option name='cid'  id="+data[i].cid+" value='"+data[i].cid+"'>"+data[i].cname+"</option>");
				}
			}
		});
		if(${requestScope.upload=='no'}){
			alert("服务器崩了！！")
		}
if(${!empty requestScope.cid}){
    var cid=${empty requestScope.cid?0:requestScope.cid};
	$("#selDep3").html("");
	$.ajax({
		url:"${pageContext.request.contextPath}/product/types",
		dataType:"json",
		success:function(data){
			console.log("3"+data);
			$("#selDep3").html("<option>请选择第一类目</option>");
			for(var i=0;i<data.length;i++){
				if(${empty requestScope.cid?0:requestScope.cid}==data[i].cid){
					$("#selDep3").append("<option selected name='cid'  id="+data[i].cid+" value='"+data[i].cid+"'>"+data[i].cname+"</option>");
				}else{
					$("#selDep3").append("<option name='cid'  id="+data[i].cid+" value='"+data[i].cid+"'>"+data[i].cname+"</option>");
				}
			}
		}
	});
	$("#selDep4").html("<option>请选择第一类目</option>");
	$.ajax({
		url:"${pageContext.request.contextPath}/product/typechange",
		dataType:"json",
		data:{
			cid:cid
		},
		success:function(data){
			console.log("2"+data);
			for(var i=0;i<data.length;i++){
				if(${empty requestScope.product.csid?0:requestScope.product.csid}==data[i].csid)
				{
					$("#selDep4").append("<option selected name='csid' id='type" + data[i].csid + "' value=" + data[i].csid + " >" + data[i].csname + "</option>")
				}else{
					$("#selDep4").append("<option name='csid' id='type" + data[i].csid + "' value=" + data[i].csid + " >" + data[i].csname + "</option>")
				}
			}
		}
	})
}
		$("#selDep3").change(function(){
			$("#selDep4").html("<option>请选择第一类目</option>");
			var cid=$("#selDep3 option:selected").attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/product/typechange",
				dataType:"json",
				data:{
					cid:cid
				},
				success:function(data){
					console.log("1"+data);
					for(var i=0;i<data.length;i++){
						$("#selDep4").append("<option name='csid' id='type"+data[i].csid+"' value="+data[i].csid+" >"+data[i].csname+"</option>")
					}
				}
			})
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
        $("input[type='file']").click(function(){
        	if($('#imgs').children().size()!=0){
        		$('#imgs').html("");
        	}
        });
		$("input[type='file']").change(function(){
			$filePath=URL.createObjectURL(this.files[0]);
			$('#imgs').html("<img src='"+$filePath+"' style='width: 150px;height: 100px' />");
		})
    }
	function scs(){
		console.log($("#editor p").text());
		//var cid=$("#selDep3 option:selected").attr("id");
		var date=new Date();
		var year=date.getFullYear();
		var month=date.getMonth()+1;
		var day=date.getDate();
		var h=date.getHours();
		var m=date.getMinutes();
		var s=date.getSeconds();
		var dates=year+"-"+month+"-"+day+" "+h+":"+m+":"+s;
		var text=$("#editor p").text();
		console.log(dates);

		$("#pdate").val(dates);
		$('#content').val(text);
		return true;
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.js"></script>
</head>
<body>
<input type="hidden" id='flag1' />
	<div class="wrapper">

            <%@ include file="page/left.jsp" %>

		<div class="main-panel">
			
        <%@ include file="page/nav.jsp" %>

			<div class="content">
			
				<div class="container-fluid">
				
					<div class="row">

						<div class="card">
						<form onsubmit="return scs()" action="${pageContext.request.contextPath}/product/productUpimg.do" method='post' enctype="multipart/form-data" >
							<div >
							<table>
								<tr >
									<td>
										<input type="file" accept="image/*" name='img' id='inputFile'/>
										<div id="imgs"></div>
									</td>

								</tr>
							</table>
							</div>
							<div >
								<div style="float:left; width: 400px;" class="form-group">

									<div style="float:left;  width: 130px;">

										<select id="selDep3" name="cid" class="form-control" style="width: 130px;">

										</select>
									</div>
									<div style="float:left;  width: 130px;">
										<select id="selDep4" name="csid" class="form-control" style="width: 130px;">
											<option>请选择第一类目</option>

										</select>
									</div>

									<div style="float:left; width: 600px;">
<div style="float: left"><input value="${requestScope.product.pName}" class="form-control" onblur="newstitles()" placeholder="商品名称" type="text" name="pName" id="newstitle"/></div>
										<div style="float: left"><span id="errnewstitle" style="color: red;" >${errt}</span></div>
										<input type="hidden" name="pdesc" id="content">
										<input type="hidden" name="pdate" id="pdate">

									</div>
								</div>
							</div>

							<div style="width: 700px;height: 80px;">
								<div><span>市价:</span><input value="${requestScope.product.marketPrice}" type="number" id="marketPrice" name="marketPrice" step="0.01"></div>
								<div><span>售价:</span><input value="${requestScope.product.shopPrice}" type="number" id="shopPrice" name="shopPrice" step="0.01"></div>
							</div>

							<div style="width: 800px; height: 400px;">
								<div id="editor">
　								<!-- 默认显示 -->
								<p>${requestScope.product.pdesc}</p>
   
								</div>
								
									<span style="color: red;" >${errc }</span>

								 <input type="submit" id='sc'   class="btn btn-info btn-fill pull-right"  value="上传"/>
							</div>
							</form>
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