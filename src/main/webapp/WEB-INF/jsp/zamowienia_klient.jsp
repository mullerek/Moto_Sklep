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
    <title>Zamówienie</title>
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
    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
        <c:forEach begin="0" var="zamowione" items="${zamowione}" end="0">
            <h3 style="text-align: center">Nr zamówienia: ${zamowione.zamowienia.id_zamowienia}</h3>

        </c:forEach>

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="border-0 bg-light">
                        <div class="p-2 px-3 text-uppercase">Produkt</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Cena</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Ilość</div>
                    </th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="zamowione" items="${zamowione}" >
                    <tr>
                        <th scope="row" class="border-0">
                            <div class="p-2">
                                <img src="https://drive.google.com/uc?export=view&id=${zamowione.produkty.zdjecie}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                <div class="ml-3 d-inline-block align-middle">
                                    <h7 class="mb-0"> <a href="/produkt-spec/${zamowione.produkty.id_produktu}" class="text-dark d-inline-block align-middle">${zamowione.produkty.nazwa_produktu}</a></h7>
                                </div>
                            </div>
                        </th>
                        <td class="border-0 align-middle"><strong>${zamowione.produkty.cena} zł</strong></td>
                        <td class="border-0 align-middle"><strong>${zamowione.ilosc}</strong></td>
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
