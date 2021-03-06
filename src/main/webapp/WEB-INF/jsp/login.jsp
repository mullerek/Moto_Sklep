<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 23.11.2021
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Logowanie</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abril+Fatface display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One display=swap">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Form-Input.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Search-Input-responsive.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/styles.css">

</head>
<body>
<c:import url="menu_gora.jsp"/>
<div class="container">
    <div class="row">
        <div class="col">
            <c:if test="${message!=null}">
                <p style="font-size: 30px; text-align: center">${message} </p>
            </c:if>
            <section class="login-clean" style="background: rgb(255,255,255);">
                <form method="post" action="login" style="background: rgb(214,241,252);color: rgb(80, 94, 108);">
                    <div class="illustration"><i class="fas fa-user-tie" style="color:cornflowerblue;"></i></div>
                    <div class="mb-3"><input class="form-control" type="text" name="username" placeholder="Login"></div>
                    <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Has??o"></div>
                    <p style="text-align: center; color: red; font-size: 12px">${errorMsg}</p>
                    <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background:cornflowerblue;">Zaloguj</button></div>
                    <a class="btn btn-primary" href="rejestracja" type="submit" value="Zarejestruj si??" style="margin-top: 10px;width: 240px;">Rejestracja</a>
                </form>
                <p style="text-align: center;transform: perspective(0px);font-size: 30px;font-weight: bold;font-style: italic;color:grey;"></p>
            </section>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/js/bs-init.js"></script>

</body>

</html>

