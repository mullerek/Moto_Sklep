<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 26.10.2021
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Kategorie</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body class="d-flex flex-column min-vh-100">
<c:import url="menu_gora.jsp"/>
<div class="container">
    <a href="/create-kategorie" class="btn btn-dark rounded-pill py-2 btn-block" style="width: 20%; margin-bottom: 20px;">Dodaj kategorie</a>
    <table border="2" width="70%" cellpadding="2">
        <tr>
            <th>Id</th>
            <th>Nazwa kategorii</th>
            <th>Zarządzaj</th>
            <td>Usuń</td>
        </tr>
        <c:forEach var="kategorie" items="${kategorie}">
            <tr>
                <td>${kategorie.id_kategorii}</td>
                <td>${kategorie.nazwa_kategorii}</td>
                <td><a href="/update-kategorie/${kategorie.id_kategorii}">Zarządzaj</a></td>
                <td><a href="/delete-kategorie/${kategorie.id_kategorii}">Usuń</a></td>
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
