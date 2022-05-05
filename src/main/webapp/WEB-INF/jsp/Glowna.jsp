<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 08.06.2021
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 15.10.2021
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Główna</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One display=swap">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Form-Input.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/styles.css">

</head>

<body>
<c:import url="menu_gora.jsp"/>
<div class="container">
    <c:if test="${message!=null}">
    <p style="font-size: 40px; text-align: center">${message} <i class="fa fa-check" style="color: rgb(28,163,34);"></i></p>
    </c:if>
    <div class="simple-slider" style="margin-top: 20px;">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                   <a href="/prox" style="text-align: center"><img class="simple-slider" src="https://static4.bajamoto.pl/pol_pl_ProX-Tlok-RM85-02-16-47-94mm-sel-A-13021_1.jpg" style="background-repeat: no-repeat;width: 80%;"></a>
                </div>
                <div class="swiper-slide">
                    <a href="/fox" style="text-align: center"><img class="simple-slider" src="https://cf.shopee.ph/file/1c64e7b323618689d1b9d588e93cf89b"></a>
                </div>
                <div class="swiper-slide">
                    <a href="/produkty_wg_kat/4" style="text-align: center"><img class="simple-slider" src="https://cdn.shopify.com/s/files/1/1754/5421/articles/4-Stroke_MX_Motor_Oil_1024x1024.JPG?v=1511914430"></a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
</div>
<div class="mt-auto">
<footer class="footer-dark">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3 item">
                <h3>Services</h3>
                <ul>
                    <li><a href="#">Web design</a></li>
                    <li><a href="#">Development</a></li>
                    <li><a href="#">Hosting</a></li>
                </ul>
            </div>
            <div class="col-sm-6 col-md-3 item">
                <h3>About</h3>
                <ul>
                    <li><a href="#">Company</a></li>
                    <li><a href="#">Team</a></li>
                    <li><a href="#">Careers</a></li>
                </ul>
            </div>
            <div class="col-md-6 item text">
                <h3>Company Name</h3>
                <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
            </div>
            <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
        </div>
        <p class="copyright">Company Name © 2021</p>
    </div>
</footer>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.js"></script>
<script src="assets/js/Simple-Slider.js"></script>
<script src="assets/js/modal.js"></script>
</body>

</html>