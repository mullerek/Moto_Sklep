<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 15.10.2021
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dodaj Produkt</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
<c:import url="menu_gora.jsp"/>
<div class="container">
    <h2>Dodaj Produkt</h2>
    <form:form method="post" action="/create-produkty">
        <table>
            <tr>
                <td>Id kategorii </td>
                <td>
                <form:select path="id_kategoria">
                    <c:forEach var="kat" items="${listaKat}">
                        <form:option value="${kat.id_kategorii}" label="${kat.nazwa_kategorii}"></form:option>
                    </c:forEach>
                </form:select>
                </td>
            </tr>
            <tr>
                <td>Nazwa Produktu </td>
                <td><form:input path="nazwa_produktu"/></td>
            </tr>
            <tr>
                <td>Producent </td>
                <td><form:input path="producent"/></td>
            </tr>
            <tr>
                <td>Opis </td>
                <td><form:input path="opis"/></td>
            </tr>
            <tr>
                <td>Rozmiar </td>
                <td><form:input path="rozmiar"/></td>
            </tr>
            <tr>
                <td>Ilość </td>
                <td><form:input path="ilosc"/></td>
            </tr>
            <tr>
                <td>Cena </td>
                <td><form:input path="cena"/></td>
            </tr>
            <tr>
                <td>Zdjęcie </td>
                <td><form:input path="zdjecie"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input class="btn btn-dark rounded-pill py-2 btn-block" style="width: 80%; margin-top: 10px;" type="submit" value="Dodaj"/></td>
            </tr>
        </table>
    </form:form>
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
