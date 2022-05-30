
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
    <title>Glowna</title>
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
    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="border-0 bg-light">
                        <div class="p-2 px-3 text-uppercase">Id zamówienia</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Dane adresowe klienta</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Data złożenia zamówienia</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Status</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Rodzaj płatności</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Wartość zamówienia</div>
                    </th>
                    <th scope="col" class="border-0 bg-light" >
                        <div class="py-2 text-uppercase" >Rodzaj dostawy</div>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="zamowione" items="${zamowione}">
                    <tr>
                        <td class="border-0 align-middle"><a href="/zamowienia_klient/${zamowione.user.id_user}/${zamowione.id_zamowienia}"><strong>Zamówienie nr: ${zamowione.id_zamowienia}</strong></a></td>
                        <td class="border-0 align-middle"><a href="/dane_klienta/${zamowione.user.id_user}"><strong>${zamowione.user.imie} ${zamowione.user.nazwisko} </strong></a></td>
                        <td class="border-0 align-middle"><strong>${zamowione.data_zamowienia}</strong></td>
                        <td class="border-0 align-middle"><strong>${zamowione.czy_zrealizowano} <a href="/update_status/${zamowione.id_zamowienia}"  />Zmień</strong></td>
                        <td class="border-0 align-middle"><strong>${zamowione.rodzaj_platnosci} </strong></td>
                        <td class="border-0 align-middle"><strong>${zamowione.wartosc_zamowienia} zł</strong></td>
                        <td class="border-0 align-middle"><strong>${zamowione.rodzaj_dostawy} </strong></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>
