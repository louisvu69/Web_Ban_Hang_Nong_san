<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>

   
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  <!-- / header section -->
  
<!--  content -->
   <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="${pageContext.request.contextPath}/view/client/assets/images/contact-banner.png" alt="banner liên hệ">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Liên hệ</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>         
          <li style="color:#fff">Thông tin liên hệ</li>
        </ol>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->
<!-- start contact section -->
 <section id="aa-contact">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="aa-contact-area">
           <div class="aa-contact-top">
             <h2>Chúng tôi đang chờ để hỗ trợ bạn..</h2>
             <p>Nếu bạn nó bất cứ thắc mắc hay ý kiến gì cứ tìm đến chúng tôi.</p>
           </div>
         
           <!-- Contact address -->
           <div class="aa-contact-address">
             <div class="row">
               <div class="col-md-7">
         			 <div class="aa-contact-map">
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5236220427437!2d105.52584505407368!3d21.01172461332785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1678088390788!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
           </div>
               </div>
               <div class="col-md-5">
                 <div class="aa-contact-address-right">
                   <address>
                     <h4>Nông Sản 24</h4>
                     <p>Liên hệ cho chúng tôi bất cứ khi nào bạn cần.</p>
                     <p><span class="fa fa-home"></span>Km40 - TT.Tân Yên - Hàm Yên - Tuyên Quang</p>
                     <p><span class="fa fa-phone"></span>039.9902.314</p>
                     <p><span class="fa fa-envelope"></span>Email: linhvthe176900@fpt.edu.vn</p>
                   </address>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
<!--  end content-->
  
<!--  footer-->
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->


  
