<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
<!DOCTYPE html>
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>          
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/home">TRANG CHỦ</a></li>
                        <li><a href="${pageContext.request.contextPath}/introduce">GIỚI THIỆU</a></li>
                        <li><a href="${pageContext.request.contextPath}/product/list">SẢN PHẨM</span></a>
                            <ul class="dropdown-menu">                
                                <li><a href="product.jsp">RAU CỦ QUẢ</a></li>
                                <li><a href="product.jsp">CÁC LOẠI HẠT</a></li>
                                <li><a href="product.jsp">TINH DẦU</a></li>
                                <li><a href="product.jsp">MẬT ONG</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/boardnew/list">TIN TỨC</a></li>
                        <li><a href="${pageContext.request.contextPath}/policy">CHÍNH SÁCH</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">LIÊN HỆ</a></li>
                        <li class="aa-search"><!-- search box -->
                            <a class="aa-search-box">
                                <form action="${pageContext.request.contextPath}/product/search" method="GET">
                                    <input type="text" name="s" id="" placeholder="Tìm kiếm sản phẩm..">
                                    <button class="serach-box"><span class="fa fa-search"></span></button>
                                </form>
                            </a>
                            <!-- / search box -->
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->

            </div>
        </div>       
    </div>
</section>
