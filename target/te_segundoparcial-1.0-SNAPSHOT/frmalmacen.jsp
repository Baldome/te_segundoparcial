<%@page import="com.emergentes.modelo.Producto"%>
<%
    Producto producto = (Producto) request.getAttribute("producto");
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
                <h1 class="fw-bold" style="text-align: center;"><%= (producto.getId() == 0) ? "Nuevo " : "Editar "%> registro producto</h1>
                <div class="mb-3">
                    <form action="Inicio" method="post">
                        <input type="hidden" name="id" value="<%= producto.getId() %>">
                        <div class="mb-3 row">
                            <label for="descripcion" class="col-sm-2 col-form-label">Descripción</label>
                            <div class="col-sm-10">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" value="<%= producto.getDescripcion() %>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="cantiadad" class="col-sm-2 col-form-label">Cantidad</label>
                            <div class="col-sm-10">
                                <input type="number" name="cantidad" class="form-control" id="cantidad" value="<%= producto.getCantidad() %>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="precio" class="col-sm-2 col-form-label">Precio</label>
                            <div class="col-sm-10">
                                <input type="number" name="precio" class="form-control" id="precio" value="<%= producto.getPrecio() %>">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
                            <div class="col-sm-10">
                                <input type="text" name="categoria" class="form-control" id="categoria" value="<%= producto.getCategoria() %>">
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>