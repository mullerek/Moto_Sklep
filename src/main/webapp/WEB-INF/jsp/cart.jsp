<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 08.06.2021
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Koszyk</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="/assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="/https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="/assets/css/styles.css">
</head>
<body class="d-flex flex-column min-vh-100" onload="suma()" >
<c:import url="menu_gora.jsp"/>
<div class="container">

    <div class="container"><div class="shopping-cart">
        <div class="px-4 px-lg-0">

            <div class="pb-5">
                <div class="container">
                    <c:if test="${cartItems.size() == 0}">

                       <h4 style="text-align: center">Twój koszyk jest pusty</h4>

                    </c:if>
                    <c:if test="${cartItems.size() > 0}">
                    <div class="row">
                        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

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
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Usuń</div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="cartItems" items="${cartItems}">
                                    <tr>
                                        <th scope="row" class="border-0">
                                            <div class="p-2">
                                                <img src="https://drive.google.com/uc?export=view&id=${cartItems.produkt.zdjecie}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                <div class="ml-3 d-inline-block align-middle">
                                                    <h5 class="mb-0"> <a href="/produkt-spec/${cartItems.produkt.id_produktu}" class="text-dark d-inline-block align-middle">${cartItems.produkt.nazwa_produktu}</a></h5>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="border-0 align-middle"><strong>${cartItems.produkt.cena} zł</strong></td>
                                        <td class="border-0 align-middle">
                                            <div class="quantity buttons_added">
                                            <form action="/cart/update" class="quantity buttons_added">
                                                <input type="hidden" value="${cartItems.quantity}" name="qty">
                                                <input type="hidden" value="${cartItems.produkt.id_produktu}" name="pid">
                                                <input type="submit" class="minus" name="btn" value="-"></input>
                                            <input type="number" class="input-text qty text" value="${cartItems.quantity}">
                                                <input type="submit" class="plus" name="btn" value="+"></input>
                                            </form>
                                            </div>
                                        </td>
                                        <td class="border-0 align-middle"><a href="/cart/remove/${cartItems.produkt.id_produktu}" class="text-dark"><i class="fa fa-trash"></i></a></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <form action="/cart/zamow" >

                    <div class="row py-5 p-4 bg-white rounded shadow-sm">
                        <div class="col-lg-6">

                            <h1 style="margin: 20px;font-size: 32px;">Dostawa</h1>
                            <div id="choose1">
                                <div class="form-check"><input class="form-check-input" type="radio" name="dostawa" value="12.99"><label class="form-check-label" >Poczta Polska (12.99 zł)</label></div>
                                <div class="form-check"><input class="form-check-input" type="radio" name="dostawa" value="11.99"><label class="form-check-label" >Kurier DPD (11.99 zł)</label></div>
                                <div class="form-check"><input class="form-check-input" type="radio" name="dostawa" value="10.99"><label class="form-check-label" >Kurier DHL (10.99 zł)</label></div>
                                <div class="form-check"><input class="form-check-input" type="radio" name="dostawa"  checked="checked" value="0.00"><label class="form-check-label" >Odbiór osobisty (0.00 zł)</label></div>
                            </div>

                            <h1 style="margin: 20px;font-size: 32px;">Sposób płatności</h1>
                            <div class="form-check"><input class="form-check-input" type="radio" name="platnosc"  value="Przelew na konto bankowe" id="formCheck-5"><label class="form-check-label" for="formCheck-5">Przelew na konto bankowe</label></div>
                            <div class="form-check"><input class="form-check-input" type="radio" name="platnosc"  value="Blik" id="formCheck-6"><label class="form-check-label" for="formCheck-6">Blik</label></div>
                            <div class="form-check"><input class="form-check-input" type="radio" checked="checked" name="platnosc" value="Płatność przy odbiorze" id="formCheck-7"><label class="form-check-label" for="formCheck-7">Płatność przy odbiorze</label></div>
                        </div>
                        <div class="col-lg-6">
                            <div class="p-4">
                                <ul class="list-unstyled mb-4">
                                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Dostawa </strong><strong id="dostawa"></strong></li>
                                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Wartość zakupów </strong><strong>${suma} zł</strong></li>
                                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Całkowity koszt </strong><strong id="suma" ></strong></li>
                                    </li>
                                </ul><button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Zrealizuj zamówienie</button>

                            </div>
                        </div>
                    </div>
                    </form>

                </div>
            </div>
            </c:if>
        </div>
    </div></div>
</div>
<footer class="footer-dark mt-auto">
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
<script>
    function suma()
    {
        var suma = parseFloat('${suma}');
        document.getElementById("suma").innerHTML = suma + " zł";
        document.getElementById("dostawa").innerHTML = "0.00 zł"
    }
    document.getElementById('choose1').onchange = function (e)
    {
        var suma_koncowa = parseFloat('${suma}');
        if(e.target.tagName.toLocaleLowerCase() === 'input')
        {
            value = e.target.value;
            suma_koncowa += parseFloat(value);
            suma_koncowa = Number(Math.round(suma_koncowa+'e+2')+ 'e-2');
            document.getElementById("dostawa").innerHTML = value + " zł";
            document.getElementById("suma").innerHTML = suma_koncowa + " zł";

        }
    }
</script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/modal.js"></script>
</body>

</html>
