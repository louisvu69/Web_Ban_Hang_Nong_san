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
public class ProductAddController extends HttpServlet {

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
            out.println("<title>Servlet ProductAddController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductAddController at " + request.getContextPath() + "</h1>");
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
    private CategoryDAO categoryDAO = new CategoryDAO();
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Catalog> cateList = categoryDAO.getAll();
        request.setAttribute("catelist", cateList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/addproduct.jsp");
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
        String product_cate = request.getParameter("product-cate");
        String product_name = request.getParameter("product-name");
        String product_price = request.getParameter("product-price");
        String product_status = request.getParameter("product-status");
        String product_desc = request.getParameter("product-desc");
        String product_content = request.getParameter("product-content");
        String product_discount = request.getParameter("product-discount");
        String product_image = request.getParameter("product-image");
        String product_day = request.getParameter("product-day");
        Product product = new Product();
        product.setCatalog_id(product_cate);
        product.setName(product_name);
        product.setPrice(product_price);
        product.setStatus(product_status);
        product.setDescription(product_desc);
        product.setContent(product_content);
        product.setDiscount(product_discount);
        product.setImage_link(product_image);
        product.setCreated(product_day);
        productDAO.insert(product);
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
