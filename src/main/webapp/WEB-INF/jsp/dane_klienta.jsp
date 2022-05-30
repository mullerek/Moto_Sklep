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
    <title>Dane klienta</title>
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

<body class="d-flex flex-column min-vh-100">


<c:import url="menu_gora.jsp"/>

<div class="container">
    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" class="border-0 bg-light">
                        <div class="p-2 px-3 text-uppercase">Imie nazwisko</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Ulica</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Kod pocztowy</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Miasto</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Nr telefonu</div>
                    </th>
                    <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Email</div>
                    </th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="dane" items="${dane}" >
                    <tr>
                        <td class="border-0 align-middle"><strong>${dane.imie} ${dane.nazwisko} </strong></td>
                        <td class="border-0 align-middle"><strong>${dane.ulica}</strong></td>
                        <td class="border-0 align-middle"><strong>${dane.kod_pocztowy}</strong></td>
                        <td class="border-0 align-middle"><strong>${dane.miasto}</strong></td>
                        <td class="border-0 align-middle"><strong>${dane.nr_tel}</strong></td>
                        <td class="border-0 align-middle"><strong>${dane.email}</strong></td>
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
