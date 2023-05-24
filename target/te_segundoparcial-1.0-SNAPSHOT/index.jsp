<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="width: 700px;">
            <div class="mx-auto p-4">
                <table border="4" class="table">
                    <thead class="table-success">
                        <tr>
                            <th>SEGUNDO PARCIAL TEM-742<br> 
                                Nombre: Maximo Baldomero Yujra Calla<br>
                                Carnet: 9879538</th>
                        </tr>
                    </thead>
                </table>
                <h1 class="fw-bold" style="text-align: center;">Gestion de productos</h1>
                <p><a href="Inicio?action=add" class="btn btn-success">Nuevo producto</a></p>
                <table class="table">
                    <thead class="table-primary">
                        <tr>
                            <th>Id</th>
                            <th>Descripcion</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                            <th>Categoria</th>
                            <th colspan="2">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="table-secondary">
                        <c:forEach var="item" items="${productos}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.descripcion}</td>
                                <td>${item.cantidad}</td>
                                <td>${item.precio}</td>
                                <td>${item.categoria}</td>
                                <td>
                                    <a href="Inicio?action=edit&id=${item.id}" class="btn btn-warning">Editar</a>
                                </td>
                                <td>
                                    <a href="Inicio?action=delete&id=${item.id}" onclick="return(confirm('Esta seguro de eliminar el registro?'))" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
