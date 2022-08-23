<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //if (session.getAttribute("correo") != null) {
    //si sesion existe entonces enviar a menu
    //  response.sendRedirect("menu");
    //}
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="vistas/assets/img/logo.svg" type="image/x-icon" />
    <title>Error 404</title>
</head>
<style>
    body {
        background-color: black;
        background-image: url(vistas/assets/img/logo.svg);
        background-size: 3%;
    }
    
    @media screen and (max-width: 992px) {
        body {
            background-size: 9%;
        }
    }
    
    div {
        background-color: rgba(0, 0, 0, 0.233);
        margin-top: 5%;
        padding: 1%;
        color: white;
        text-shadow: 0px 0px 15px white;
        border-radius: 20px;
        text-align: center;
        font-family: "Times New Roman", Times, serif;
        font-size: 500%;
    }
    
    @media screen and (max-width: 992px) {
        div {
            margin-top: 50%;
        }
    }
    
    img {
        display: block;
        margin: auto;
        width: 20%;
        height: 20%;
    }
    
    @media screen and (max-width: 992px) {
        img {
            width: 35%;
            height: 35%;
        }
    }
</style>

<body>
    <div>
        <img src="vistas/assets/img/gato_mecanico.svg" alt="gato" />
        <p>Error 404</p>
    </div>
</body>

</html>