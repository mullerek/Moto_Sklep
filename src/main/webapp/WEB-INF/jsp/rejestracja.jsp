<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 24.11.2021
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Rejestracja</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body class="d-flex flex-column min-vh-100">
<c:import url="menu_gora.jsp"/>
<div class="container">
    <div class="row">
        <div class="col">
            <section class="login-clean" style="background: rgb(255,255,255);">
                <form:form method="post" action="/zarejestruj" style="background: rgb(214,241,252);color: rgb(80, 94, 108);">
                    <div class="illustration"><i class="fas fa-user-tie" style="color:blue;"></i></div>
                    <div class="mb-3"><form:input  path="username" class="form-control" type="text" placeholder="Login" minlength="5" required="required"/></div>
                    <div class="mb-3"><form:input path="password" class="form-control" type="password"  placeholder="Hasło" minlength="6" required="required"/></div>
                    <div class="mb-3"><form:input path="imie" class="form-control" type="test"  placeholder="Imię" minlength="3" required="required"/></div>
                    <div class="mb-3"><form:input path="nazwisko" class="form-control" type="test"  placeholder="Nazwisko" minlenght="3" required="required"/></div>
                    <div class="mb-3"><form:input path="role" class="form-control" type="hidden" value="USER"/></div>
                    <div class="mb-3"><form:input path="aktywne" class="form-control" type="hidden" value="true"/></div>
                    <div class="mb-3"><form:input path="ulica" class="form-control" type="text"  placeholder="Ulica" minlength="4" required="required"/></div>
                    <div class="mb-3"><form:input path="kod_pocztowy" class="form-control" type="text"  placeholder="Kod pocztowy" minlength="5" required="required"/></div>
                    <div class="mb-3"><form:input path="miasto" class="form-control" type="text"  placeholder="Miasto" minlength="3" required="required"/></div>
                    <div class="mb-3"><form:input path="nr_tel" class="form-control" type="text"  placeholder="Nr telefonu" minlength="9"  inputmode="tel" required="required"/></div>
                    <div class="mb-3"><form:input path="email" class="form-control" type="email"  placeholder="Email" inputmode="email" required="required"/></div>
                    <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background:blue;">Zarejestruj się</button></div>
                </form:form>
            </section>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
</body>

</html>
