/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Catalog;
import model.Product;

/**
 *
 * @author WINDOWS
 */
public class ProductUpdateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductUpdateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductUpdateController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDAO productDAO = new ProductDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Catalog> cateList = categoryDAO.getAll();
        request.setAttribute("catelist", cateList);

        String id = request.getParameter("id");
        Product product = productDAO.get(Integer.parseInt(id));
        request.setAttribute("product", product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/editproduct.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Product product = new Product();
        product.setId(request.getParameter("product-sku"));
        product.setCatalog_id(request.getParameter("product-cate"));
        product.setName(request.getParameter("product-name"));
        product.setPrice(request.getParameter("product-price"));
        product.setStatus(request.getParameter("product-status"));
        product.setDescription(request.getParameter("product-desc"));
        product.setContent(request.getParameter("product-content"));
        product.setDiscount(request.getParameter("product-discount"));
        product.setImage_link(request.getParameter("product-image"));
        product.setCreated(request.getParameter("product-day"));
        productDAO.edit(product);

        response.sendRedirect(request.getContextPath() + "/admin/product/list");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
