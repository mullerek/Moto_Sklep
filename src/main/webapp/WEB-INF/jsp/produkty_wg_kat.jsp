<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 08.06.2021
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>Produkty</title>
  <script src="/assets/bootstrap/js/zoom.js"></script>
  <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/https://fonts.googleapis.com/css?family=Acme">
  <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
  <link rel="stylesheet" href="/assets/fonts/ionicons.min.css">
  <link rel="stylesheet" href="/assets/fonts/simple-line-icons.min.css">
  <link rel="stylesheet" href="/assets/css/Footer-Dark.css">
  <link rel="stylesheet" href="/https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="/assets/css/styles.css">
</head>

<body>


<c:import url="menu_gora.jsp"/>

<div  id="container" >


        <c:forEach var="produkty" items="${produkty}" >
          <a class="a_odziez" href="/produkt-spec/${produkty.id_produktu}">
          <div class="card">
            <div class="product-image">
              <img  style="text-align: center;" src="https://drive.google.com/uc?export=view&id=${produkty.zdjecie}">
            </div>
            <div class="product-info">
              <p>${produkty.nazwa_produktu}</p>
              <h7>${produkty.cena} zł</h7>
            </div>
          </div>
          </a>
        </c:forEach>
</div>
<footer class="footer-dark">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-md-3 item">
        <h3>Informacje</h3>
        <ul>
          <li><a href="#">Regulamin</a></li>
          <li><a href="#">Zwroty</a></li>
          <li><a href="#"></a></li>
        </ul>
      </div>
      <div class="col-sm-6 col-md-3 item">
        <h3>Kontakt</h3>
        <ul>
          <li style="color: var(--white);"><a class="text-white" href="#" style="color: var(--white);">Tel: +48 500 409 226</a></li>
          <li><a href="#">Email: pawel.muller1998@gmail.com</a></li>
          <li><a href="#">Careers</a></li>
        </ul>
      </div>

      <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
    </div>
    <p class="copyright">Company Name © 2021</p>
  </div>
</footer>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>
