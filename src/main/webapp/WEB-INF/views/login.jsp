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
    <title>Logowanie - Sklep komputerowy</title>
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
            <p>
            <div id="loginbox" class="mainbox col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-2">
                <div class="panel panel-info" style="border-color: dimgray;">
                    <div class="panel-heading" style="background-color: rebeccapurple; color: white; border: none">
                        <div class="panel-title" style="border-color: dimgray" >Logowanie</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <!-- Login Form -->
                        <form:form action="${pageContext.request.contextPath}/zaloguj"
                                   method="POST" class="form-horizontal">

                            <!-- Place for messages: error, alert etc ... -->
                            <div class="form-group">
                                <div class="col-xs-15">
                                    <div>
                                        <!-- Check for login error -->
                                        <c:if test="${param.error != null}">
                                            <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                                Nieprawidłowe dane.
                                            </div>

                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                                Zostałeś wylogowany.
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <!-- User name -->
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="username" type="text" placeholder="Login" class="form-control">
                            </div>

                            <!-- Password -->
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input name="password" type="password" placeholder="Hasło" class="form-control">
                            </div>

                            <!-- Login/Submit Button -->
                            <div style="margin-top: 10px" class="form-group">
                                <div class="col-sm-6 controls">
                                    <button type="submit" class="btn btn-success">Zaloguj</button>
                                </div>
                            </div>
                        </form:form>

                    </div>

                </div>

            </div>
            </p>
        </div>
        <div class="col-1"></div>
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
