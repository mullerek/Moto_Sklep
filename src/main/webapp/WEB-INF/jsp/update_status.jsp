<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 15.10.2021
  Time: 18:58
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

    <h2>Zmień status</h2>
    <form:form method="post" action="/update_status/${id_zamowienia}">
        <table>
            <tr>
                <td>Numer zamówienia </td>
                <td><form:input path="id_zamowienia"/></td>
            </tr>
            <tr>
                <td>Nowy status</td>
                <td>
                    <form:select path="czy_zrealizowano">
                        <form:option value="Przyjęto"></form:option>
                        <form:option value="Opłacono"></form:option>
                        <form:option value="Do opłacenia"></form:option>
                        <form:option value="Zapakowano"></form:option>
                        <form:option value="Przekazano kurierowi"></form:option>
                        <form:option value="Wysłano"></form:option>
                        <form:option value="Zrealizowano"></form:option>
                        <form:option value="Anulowano"></form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" class="btn btn-dark rounded-pill py-2 btn-block" style="margin-top: 10px" value="Zmień"/></td>
            </tr>
        </table>
    </form:form>
</div>
<c:import url="footer.jsp"/>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>