<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
<!-- start header top  -->
<div class="aa-header-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-top-area">
                    <!-- start header top left -->
                    <div class="aa-header-top-left">
                        <div class="cellphone hidden-xs">
                            <p><a href="${pageContext.request.contextPath}/home"><span class="fas fa-home" >  </span></a>Website bán hàng nông sản</p>
                        </div>
                        <!-- start language -->
                        <div class="aa-language">
                            <div class="dropdown">
                                <a class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <img src="${url}/img/flag/vietnam.png" alt="english flag">Việt Nam
                                </a>
                            </div>
                        </div>

                    </div>
                    <!-- / header top left -->
                    <div class="aa-header-top-right">
                        <ul class="aa-head-top-nav-right">

                            <c:if test="${sessionScope.username != null}">
                                <li>
                                    <a><strong>Hola Senõrita/Señor </strong> ${username }</a>
                                </li>
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/client/logout">Đăng xuất</a></li>
                                </c:if>
                            <c:if test="${sessionScope.username == null}">
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/client/register">Đăng ký</a></li>
                                <li><a href="${pageContext.request.contextPath}/client/login">Đăng nhập</a></li>
                                </c:if>
                            <!--  data-toggle="modal" data-target="#login-modal" -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- / header top  -->
