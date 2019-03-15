<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <form:form action="dodano" modelAttribute="product" method="post">
    <form:hidden path="id" />
    <table class="register col-6" style="margin-left: 15px;">
        <tr>
            <td>Nazwa produktu:</td>
            <td><form:input path="name" type="text" class="form-control" /></td>
        </tr>
        <tr><td><form:errors path="name" cssClass="error"/></td></tr>
        <tr>
            <td>Cena:</td>
            <td><form:input path="price" type="text" class="form-control"/></td>
        </tr>
        <tr><td><form:errors path="price" cssClass="error"/></td></tr>
        <tr>
            <td>Kategoria:</td>
            <td>
                <form:select path="category" type="text" class="form-control">
                    <form:option value="computer">Komputery</form:option>
                    <form:option value="cpu">Procesory</form:option>
                    <form:option value="gpu">Karty graficzne</form:option>
                    <form:option value="mboard">Płyty główne</form:option>
                    <form:option value="drive">Dyski</form:option>
                    <form:option value="ram">Pamięci RAM</form:option>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>Zdjęcie:</td>
            <td>
                <form:select path="img" type="text" class="form-control" style="margin-top: 15px;">
                    <form:option value="pc.jpg">Komputer</form:option>
                    <form:option value="laptop.jpg">Laptop</form:option>
                    <form:option value="cpu.jpg">Procesor</form:option>
                    <form:option value="gpu.jpg">Karta graficzna</form:option>
                    <form:option value="mobo.jpg">Płyta główna</form:option>
                    <form:option value="hdd.jpg">Dysk</form:option>
                    <form:option value="ram.jpg">Pamięć RAM</form:option>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>Opis:</td>
            <td><form:textarea path="description" type="text" class="form-control" rows="10" style="margin-top: 15px;"/></td>
        </tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
    </table>

        <a href="/admin/produkty" class="btn btn-info" style="margin-left:31%; margin-top: 15px; min-width: 100px;">Wróć</a>
        <input type="submit" value="Zatwierdź" class="btn btn-success" style="min-width: 100px;margin-top: 15px;">

</form:form>

</div>
</div>
</body>
</html>
