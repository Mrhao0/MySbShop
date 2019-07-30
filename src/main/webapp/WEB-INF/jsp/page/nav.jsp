<%@ page pageEncoding="utf-8"%>
<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                    <a class="navbar-brand" href="#">商品管理系统</a>
                     <a class="navbar-brand" href="#"> 欢迎:${sessionScope.userName}</a>
                   
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="pe-7s-graph">消息</i>
                                    <b class="caret"></b>
                                    <span class="notification">5</span>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
                       
                       
                    </ul>
                    
						<a id='power' class="navbar-brand" href="#"></a>
						
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/back/outLogin">
                            	安全退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
