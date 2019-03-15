<%--
  Created by IntelliJ IDEA.
  User: staskowsky
  Date: 21-12-2018
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html lang="pl">

<html>
<head>
    <title>Produkty - Sklep komputerowy</title>
    <link rel="shortcut icon" href="resources/css/icon.png">
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <security:authorize access="!isAuthenticated()">
            <div class="col-3 headerBtns">

                <a href="${pageContext.request.contextPath}/rejestracja">
                    <button>zarejestruj</button></a>
                <a href="${pageContext.request.contextPath}/logowanie">
                    <button>zaloguj</button></a>

            </div>
        </security:authorize>
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
        <div class="col-1"></div>
        <div class="col-10">

            <c:forEach var="tempProduct" items="${products}">
                <c:url var="addToCart" value="/produkty/dodaj">
                    <c:param name="productId" value="${tempProduct.id}" />
                </c:url>

                <div class="col-12 productTable">
                <div class="productHead">
                    <div class="col-12 col-lg-12"><h1>${tempProduct.name}</h1></div>
                    <div class="col-12 col-lg-12"><h3>${tempProduct.price}zł</h3></div>
                </div>
                <div class="productDescription">
                    <div class="col-12 col-lg-5"> <img src="/resources/photos/${tempProduct.img}"></div>
                    <div class="col-12 col-lg-6" style="padding-left: 0px;"><p>${tempProduct.description}</p></div>
                    <div class="col-12 col-lg-6">
                        <a href="${addToCart}" class="purchase" name="purchase" style="text-decoration: none;">
                            Do koszyka</a>
                    </div>
                </div>
                </div>
            </c:forEach>

        </div>
        <div class="col-1" style="align-content: center">
            <a href="#" class="scrollTop"></a>
        </div>
    </div><div class="mobileContent">
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
