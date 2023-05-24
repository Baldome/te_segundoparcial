package com.emergentes.controlador;

import com.emergentes.dao.AlmacenDAO;
import com.emergentes.dao.AlmacenDAOImpl;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inicio", urlPatterns = {"/Inicio"})
public class Inicio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AlmacenDAO dao = new AlmacenDAOImpl();
            int id;
            Producto producto = new Producto();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmalmacen.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    producto = dao.getById(id);
                    request.setAttribute("producto", producto);
                    request.getRequestDispatcher("frmalmacen.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("Inicio");
                    break;
                case "view":
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String descripcion = request.getParameter("descripcion");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        String categoria = request.getParameter("categoria");
        Producto producto = new Producto();
        producto.setId(id);
        producto.setDescripcion(descripcion);
        producto.setCantidad(cantidad);
        producto.setPrecio(precio);
        producto.setCategoria(categoria);
        if (id == 0) {
            try {
                AlmacenDAO dao = new AlmacenDAOImpl();
                dao.insert(producto);
                response.sendRedirect("Inicio");
            } catch (Exception e) {
                System.out.println("Error "+e.getMessage());
            }
        } else {
            try {
                AlmacenDAO dao = new AlmacenDAOImpl();
                dao.update(producto);
                response.sendRedirect("Inicio");
            } catch (Exception e) {
                System.out.println("Error "+e.getMessage());
            }
        }
    }
}
