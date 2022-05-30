<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 19.10.2021
  Time: 12:04
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
<div class="container">
    <form action="/cart/add" method="post">
        <div class="row">
            <div class="col"><div id="photos"><img class="photo" src="https://drive.google.com/uc?export=view&id=${odziez.zdjecie}"></div></div>
            <div class="col" >
                <p class="text-center" style="font-size: 30px;margin-top: 30px;"> ${odziez.nazwa_produktu}</p>
                <hr>

                <input type="number" name="qty" value="1" min="1" max="${odziez.ilosc}">
                <button class="btn btn-dark rounded-pill py-2 btn-block" type="submit" style="width: 200px; margin-top: 10px" >Dodaj do koszyka</button>

                <c:if test="${not empty odziez.rozmiar}">
                <p class="text-start">Rozmiar ${odziez.rozmiar} </p>
                </c:if>
                <p class="text-start"><h3>${odziez.cena} zł</h3></p>

                <input type="hidden" value="${odziez.id_produktu}" name="id">

            </div>
        </div>
    </form>
    <div class="row">

        <div class="col" >
            <p class="text-center" style="text-align: center;font-size: 30px;font-family: ABeeZee, sans-serif; ">Opis</p>
            <p >${odziez.opis}</p>
        </div>
        <div class="col">
            <p style="font-family: ABeeZee, sans-serif;margin-top: 10px;">Producent: <b>${odziez.producent}</b></p>
        </div>
    </div>


</div>
<c:import url="footer.jsp"/>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>

