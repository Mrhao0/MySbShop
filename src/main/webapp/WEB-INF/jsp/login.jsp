<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<script>$(document).ready(function(c) {
	$('.close').on('click', function(c){
		$('.login-form').fadeOut('slow', function(c){
	  		$('.login-form').remove();
		});
	});	  
});
</script>
 <!--SIGN UP-->
 <h1 style="font-family:'方正华隶简体'; color: #0e4277;">管理员登陆</h1>
<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
		<img src="${pageContext.request.contextPath}/images/avtar.png" />
	</div>
			<form action="${pageContext.request.contextPath}/back/dologin" method="post">
			<input type="text" class="text"
				value="${cookie.userName1.value}"
				name="userName" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'admin';}">
			<div class="key">
					<input type="password" value="${cookie.passWord1.value}" name="userPassword" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'admin';}">
						</div>
					<input type="checkbox" ${!empty cookie.userName1?'checked':''} class="text" name="save" value="1" /><i style="color:#9199aa;">一周内免登陆</i>
					<div class="signin">
						<input type="submit" value="Login" >
					</div>	
			</form>
</div>
 <div class="copy-rights">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href=# target="_blank" title="#">#</a> - Collect from <a href=# title=# target="_blank">#</a></p>
</div>

</body>
</html>