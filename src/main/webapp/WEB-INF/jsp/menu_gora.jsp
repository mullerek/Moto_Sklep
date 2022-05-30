<%--
  Created by IntelliJ IDEA.
  User: pawel
  Date: 26.10.2021
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-light navbar-expand-md bg-warning shadow">
    <div class="container"><a class="navbar-brand" href="/Glowna" style="font-family:'Apple Color Emoji'; font-weight: bolder;">Moto Sklep</a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1" style="color: rgb(255, 193, 7);padding-bottom: 5px; height: 60px">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <div class="search-box" style="text-align: center; ">
                        <form method="post" action="/wyszukaj" style="text-align: center">

                            <button class="btn-search"><i class="fa fa-search"></i></button>
                            <input type="text" class="input-search"name="slowo" placeholder="Wyszukaj...">

                        </form>
                    </div>
                </li>
            </ul>




            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><c:if test="${username == null}">
                <a class="nav-link" href="/login"><i class="fa fa-user"></i>&nbsp;Zaloguj się</a></li>
                </c:if>
                <c:if test="${username != null}">
                    <li class="nav-item">
                        <div class="nav-item dropdown " style="padding: 8px; z-index: 4;" data-bss-hover-animate="pulse"><a class="active" aria-expanded="false" data-toggle="dropdown" href="#"><i class="fa fa-user"></i><c:out value=" ${username}"></c:out></a>
                            <div class="dropdown-menu" style="z-index: 2;">
                                <a class="dropdown-item" href="/logout">Wyloguj</a>
                                <a class="dropdown-item" href="/zamowienia_user">Moje zamówienia</a>
                                <a class="dropdown-item" href="/user_data">Dane osobowe</a>
                            </div>
                        </div></a>
                    </li>
                </c:if>
                <li class="nav-item"><a class="nav-link" href="/cart"><i class="fa fa-shopping-cart"></i>&nbsp;Koszyk</a></li>
            </ul>
        </div>
    </div>
</nav>
<nav class="navbar navbar-light navbar-expand-md " style="z-index: 2;">
    <div class="container"><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-2"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-2">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item" style="padding: 8px; margin-right: 20px;">
                    <c:if test="${username != null and rola=='ADMIN'}">
                    <div class="nav-item dropdown" data-toggle="tooltip" data-bss-tooltip="" data-bss-hover-animate="pulse"><a class="active" aria-expanded="false" data-toggle="dropdown" href="">Zarządzanie</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/produkty">Produkty</a>
                            <a class="dropdown-item" href="/kategorie">Kategorie</a>
                            <a class="dropdown-item" href="/zamowienia">Zamowienia</a>
                        </div>
                    </div>
                    </c:if>
                    <c:if test="${username != null and rola=='PRACOWNIK'}">
                        <div class="nav-item dropdown" data-toggle="tooltip" data-bss-tooltip="" data-bss-hover-animate="pulse"><a class="active" aria-expanded="false" data-toggle="dropdown" href="">Zarządzanie</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/zamowienia">Zamowienia</a>
                            </div>
                        </div>
                    </c:if>
                </li>
                <li class="nav-item" style="padding: 8px;">
                    <div class="nav-item dropdown" data-toggle="tooltip" data-bss-tooltip="" data-bss-hover-animate="pulse"><a class="active" aria-expanded="false" data-toggle="dropdown" href="#">Części silnikowe</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="/produkty_wg_kat/8">Tłoki</a><a class="dropdown-item" href="/produkty_wg_kat/9">Korbowody</a><a class="dropdown-item" href="/produkty_wg_kat/10">Łożyska</a><a class="dropdown-item" href="/produkty_wg_kat/11">Zawory</a></div>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="nav-item dropdown " style="padding: 8px;" data-bss-hover-animate="pulse"><a class="active" aria-expanded="false" data-toggle="dropdown" href="#">Układ napędowy</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="/produkty_wg_kat/5">Łańcuchy</a><a class="dropdown-item" href="/produkty_wg_kat/6">Zębatki</a><a class="dropdown-item" href="/produkty_wg_kat/7">Zestawy</a></div>
                    </div><a class="nav-link" href="#"></a>
                </li>
                <li class="nav-item"><a class="nav-link" style="color: #007bff; " href="/produkty_wg_kat/2">Zawieszenie</a></li>
                <li class="nav-item"><a class="nav-link" style="color: #007bff" href="/produkty_wg_kat/4">Oleje i płyny</a></li>
                <li class="nav-item"><a class="nav-link" style="color: #007bff" href="/produkty_wg_kat/3">Odzież</a></li>
            </ul>
        </div>
    </div>
</nav>
