<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6LeUEhUlAAAAAIo_PH8gzXhCZ194v0pC71zdERql"></script>
<!-- Start header section -->
<jsp:include page = "./header/mainHeader.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/view/client/assets/images/archive-banner.png" alt="banner blog">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Đăng nhập</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>                   
                    <li style="color:#fff">Đăng nhập</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">         
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-login">
                                <h4>Đăng nhập</h4>
                                <form class="aa-login-form" id="loginform" action="${pageContext.request.contextPath}/client/login" method="post">
                                    <label for="">Username</label>
                                    <input type="text" placeholder="Username" name="username">
                                    <label for="">Mật khẩu</label>
                                    <input type="password" placeholder="Password" name="password">
                                    <input type="hidden" name="recaptcha_response" id="recaptchaResponse">

                                    <p class="rememberme" style="display: block"><input type="checkbox" id="rememberme"> Ghi nhớ </p> 
                                    <p style="color:red; display:block">
                                        ${errorMsg}
                                    </p>
                                    <button type="submit" class="aa-browse-btn">Đăng nhập</button>
                                </form>
                            </div>
                        </div>
                    </div>          
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Cart view section -->

<!--  end content-->

<script>
// add event listener to the login button
    document.getElementById('loginform').addEventListener('submit', (e) => {
        e.preventDefault();
        grecaptcha.ready(function () {
            grecaptcha.execute('6LeUEhUlAAAAAIo_PH8gzXhCZ194v0pC71zdERql', {action: 'login'}).then(function (token) {
                var recaptchaResponse = document.getElementById('recaptchaResponse');
                recaptchaResponse.value = token;
                document.getElementById('loginform').submit();
            });
        });
    });
</script>
<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
