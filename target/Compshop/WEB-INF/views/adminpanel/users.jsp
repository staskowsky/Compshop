<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: staskowsky
  Date: 02-02-2019
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator - Sklep Rowerowy</title>
    <link rel="shortcut icon" href="resources/css/icon.png">
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-grid.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jq.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    <script	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="adminHeader">
    <a href="/admin/uzytkownicy"><button class="btn btn-secondary adminUsers">Wyświetl użytkowników</button></a>
    <a href="/admin/produkty"><button class="btn btn-secondary">Wyświetl produkty</button></a>
    <a href="/admin/zamowienia"><button class="btn btn-secondary">Wyświetl zamówienia</button></a>
    <a href="/admin/produkty/dodaj"><button class="btn btn-dark">Dodaj produkt</button></a>
    <a href="/"><button class="btn btn-primary">
        <span class="glyphicon glyphicon-home" style="height: 20px;"></span>
    </button></a>
</div>
<div class="container">
<div class="adminContainer">

    <table class="userTable col-12">
        <thead class="textCenter">
        <td style="width: 7%">ID</td>
        <td style="width: 10%">Login</td>
        <td style="width: 10%">Nazwisko</td>
        <td style="width: 10%">Imię</td>
        <td style="width: 18%">E-mail</td>
        <td style="width: 10%">Telefon</td>
        <td style="width: 25%">Adres</td>
        <td style="width: 10%">Zarządzaj</td>

        </thead>
        <c:forEach var="user" items="${users}">

            <c:url var="deleteLink" value="/admin/uzytkownicy/usun">
                <c:param name="userId" value="${user.id}" />
            </c:url>

            <tr>
                <td class="textCenter">${user.id}</td>
                <td>${user.username}</td>
                <td>${user.personal.surname}</td>
                <td>${user.personal.name}</td>
                <td>${user.email}</td>
                <td class="textCenter">${user.personal.phone}</td>
                <td>${user.address.zipcode} ${user.address.city},
                    ul. ${user.address.street} ${user.address.house}</td>
                <td class="textCenter"><a href="${deleteLink}" onclick="
                        if (!(confirm('Usunąć użytkownika?'))) return false">
                    <span class="glyphicon glyphicon-remove" style="color: red;"></span>
                </a></td>
            </tr>
        </c:forEach>
    </table>

</div>
</div>
</body>
</html>
