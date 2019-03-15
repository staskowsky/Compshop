<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <a href="/admin/zamowienia"><button class="btn btn-primary">
        Wróć do zamówień</button></a>
</div>
<div class="container">
<div class="adminContainer">

    <table class="userTable col-12">
        <thead>
        <td class="col-6 textCenter">Produkt</td>
        <td class="col-3 textCenter">Cena jednostkowa</td>
        <td class="col-3 textCenter">Ilość</td>
        </thead>

        <c:forEach var="ordered" items="${ordered}">

            <tr>
                <td style="padding: 15px;"> ${ordered.product.name}</td>
                <td class="textCenter">${ordered.product.price}zł</td>
                <td class="textCenter"> ${ordered.quantity}</td>
            </tr>

        </c:forEach>
    </table>

    <div class="col-6">
        <h2>ID zamówienia: ${ordered.get(0).order.id}</h2>
        <h2>ID zamawiającego: ${ordered.get(0).order.user.id}</h2>
        <h2>Data zamówienia: ${ordered.get(0).order.date.toLocaleString()}</h2>
        <h2>Cena zamówienia:
            <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2"
                              value="${ordered.get(0).order.price}"/>zł
        </h2>
    </div>



</div>
</div>
</body>
</html>
