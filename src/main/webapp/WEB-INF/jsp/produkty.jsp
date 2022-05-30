
<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 15.10.2021
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Produkty</title>
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
    <a href="/create-produkty" class="btn btn-dark rounded-pill py-2 btn-block" style="width: 20%;">Dodaj produkt</a>
    <br>

    <table class="table" style="border: 1px solid grey; text-align: center;" >
        <thead class="thead-dark">
            <tr>
                <th>Id</th>
                <th>Id Kategoria</th>
                <th>Nazwa produktu</th>
                <th>Producent</th>
                <th>Rozmiar</th>
                <th>Ilość</th>
                <th>Cena</th>
                <th>Zdjęcie</th>
                <th>Zarządzaj</th>
                <th>Usuń</th>
            </tr>
        </thead>
        <c:forEach var="produkty" items="${produkty}">
            <tr>
                <td>${produkty.id_produktu}</td>
                <td>${produkty.id_kategoria}</td>
                <td>${produkty.nazwa_produktu}</td>
                <td>${produkty.producent}</td>
                <td>${produkty.rozmiar}</td>
                <c:if test="${produkty.ilosc <=5}">
                    <td style="color: red; font-size: 20px; ">${produkty.ilosc} !</td>
                </c:if>
                <c:if test="${produkty.ilosc >5}">
                    <td>${produkty.ilosc}</td>
                </c:if>
                <td>${produkty.cena}</td>
                <td><div id="photos">
                    <img class="photos" src="https://drive.google.com/uc?export=view&id=${produkty.zdjecie}">
                </div></td>
                <td><a href="/update-produkty/${produkty.id_produktu}">Zarządzaj</a></td>
                <td><a href="/delete-produkty/${produkty.id_produktu}">Usuń</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>

</div>
<c:import url="footer.jsp"/>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>