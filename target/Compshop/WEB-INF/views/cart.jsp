<%--
  Created by IntelliJ IDEA.
  User: staskowsky
  Date: 21-12-2018
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html lang="pl">

<html>
<head>
    <title>Koszyk - Sklep komputerowy</title>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="resources/css/icon.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jq.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body class="col-12">

<div class="row header">

    <security:authorize access="!isAuthenticated()">
    <div class="title col-6 col-lg-7">
        </security:authorize>
        <security:authorize access="hasAnyRole('USER', 'ADMIN')">
        <div class="title col-6 col-lg-5">
            </security:authorize>
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
                <h1>compshop</h1></a>

        </div>
        <div class="info col-6 col-lg-2">
            <p>
                Kontakt: <br>
                <span class="glyphicon glyphicon-envelope"></span> : 123456789<br>
                <span class="glyphicon glyphicon-earphone"></span> : kontakt@compshop.com
            </p>
        </div>
        <security:authorize access="hasAnyRole('USER', 'ADMIN')" >
            <div class="col-5 headerBtns logged">

                <a href="${pageContext.request.contextPath}/koszyk">
                    <button>koszyk</button></a>
                <a href="${pageContext.request.contextPath}/zamowienia">
                    <button>zamówienia</button></a>
                <a href="${pageContext.request.contextPath}/ustawienia">
                    <button>ustawienia</button></a>
                <form:form action="/logout" method="post"><button>wyloguj</button></form:form>

            </div>
        </security:authorize>

    </div>

    <div class="row toStick">
        <div class="categories col-12 nopadding">
            <table>
                <tr class="row">
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/komputery" style="text-decoration: none;">
                        <p>Komputery</p></a></td>
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/procesory" style="text-decoration: none;">
                        <p>Procesory</p></a></td>
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/plyty_glowne" style="text-decoration: none;">
                        <p>Płyty główne</p></a></td>
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/karty_graficzne" style="text-decoration: none;">
                        <p>Karty graficzne</p></a></td>
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/dyski" style="text-decoration: none;">
                        <p>SSD & HDD</p></a></td>
                    <td class="col-2"><a href="${pageContext.request.contextPath}/produkty/ram" style="text-decoration: none;">
                        <p>Pamięć RAM</p></a></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="container">
        <div class="content row">
            <div class="col-lg-10 col-lg-offset-1">

                <div class="cartTable col-12 col-lg-8 col-lg-offset-2">
                    <div class="cartTableHead textCenter">
                        <div class="col-lg-6">Produkt</div>
                        <div class="col-lg-3">Cena</div>
                        <div class="col-lg-1">Ilość</div>
                        <div class="col-lg-2">Usuń</div>
                    </div>

                    <c:if test="${empty cart}"><div style="padding: 15px;">Koszyk jest pusty.</div></c:if>

                <c:forEach var="myCart" items="${cart}">

                    <c:url var="deleteLink" value="/koszyk/usun">
                        <c:param name="cartId" value="${myCart.id}" />
                    </c:url>

                    <div class="cartTableProduct">
                        <div class="col-lg-6">${myCart.product.name}</div>
                        <div class="col-lg-3 textCenter">${myCart.product.price}zł</div>
                        <div class="col-lg-1 textCenter">${myCart.quantity}</div>
                        <div class="col-lg-2 textCenter"><a href="${deleteLink}" onclick="
                            if (!(confirm('Usunąć pozycję z koszyka?'))) return false">
                                <span class="glyphicon glyphicon-remove" style="color: red;"></span>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <form:form action="produkty/zamow">
                    <button class="cartTable purchase purchaseBtn col-12 col-lg-2 col-lg-offset-5"
                            <c:if test="${empty cart}">onclick="emptyBasket()"
                        </c:if>>Złóż zamówienie</button>
                </form:form>
            </div>

            <div class="col-12 cartTableMobile">

                <c:if test="${empty cart}"><div style="padding: 15px;">Koszyk jest pusty.</div></c:if>

                <c:forEach var="myCart" items="${cart}">

                    <c:url var="deleteLink" value="/koszyk/usun">
                        <c:param name="cartId" value="${myCart.id}" />
                    </c:url>

                    <a href="${deleteLink}" onclick="
                            if (!(confirm('Usunąć pozycję z koszyka?'))) return false">
                        <span class="glyphicon glyphicon-remove" style="color: red; float: right; padding-top: 32px; font-size: 20px;"></span>
                    </a>

                    <div class="cartTableMobileProduct">
                            <b>Produkt:</b> ${myCart.product.name}<br>
                            <b>Cena:</b> ${myCart.product.price}zł<br>
                            <b>Ilość:</b> ${myCart.quantity}<br>
                    </div>
                    <hr>

                </c:forEach>
                <form:form action="produkty/zamow">
                    <button class="purchase purchaseBtn col-12 col-lg-2 col-lg-offset-5"
                        <c:if test="${empty cart}">onclick="emptyBasket()"
                        </c:if>>Złóż zamówienie</button>
                </form:form>
            </div>

        </div>

        <div class="mobileContent">
        <div class="dropup">
            <button type="button" class="btn btn-light dropdown-toggle mobileFooter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="float: right;">
                Produkty
            </button>
            <ul class="dropdown-menu" style="border: none;">
                <li><a href="${pageContext.request.contextPath}/produkty/komputery">Komputery</a></li>
                <li><a href="${pageContext.request.contextPath}/produkty/procesory">Procesory</a></li>
                <li><a href="${pageContext.request.contextPath}/produkty/plyty_glowne">Płyty główne</a></li>
                <li><a href="${pageContext.request.contextPath}/produkty/karty_graficzne">Karty graficzne</a></li>
                <li><a href="${pageContext.request.contextPath}/produkty/dyski">SSD & HDD</a></li>
                <li><a href="${pageContext.request.contextPath}/produkty/ram">Pamięć RAM</a></li>
            </ul>
        </div>

        <div class="dropup">
            <button type="button" class="btn btn-light dropdown-toggle mobileFooter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Konto
            </button>
            <ul class="dropdown-menu" style="border: none;">

                <security:authorize access="!isAuthenticated()">
                    <li><a href="${pageContext.request.contextPath}/logowanie">Zaloguj</a></li>
                    <li><a href="${pageContext.request.contextPath}/rejestracja">Zarejestruj</a></li>
                </security:authorize>

                <security:authorize access="hasAnyRole('USER', 'ADMIN')" >
                    <li><a href="${pageContext.request.contextPath}/koszyk">Koszyk</a></li>
                    <li><a href="${pageContext.request.contextPath}/zamowienia">Zamówienia</a></li>
                    <li><a href="${pageContext.request.contextPath}/ustawienia">Ustawienia</a></li>
                    <li><form:form action="/logout" method="post"><button class="logoutMobile">Wyloguj</button></form:form></li>
                </security:authorize>
            </ul>
        </div>
    </div>
    </div>

</body>
</html>
