/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Catalog;
import model.Product;

/**
 *
 * @author WINDOWS
 */
public class ProductSearchByNameController extends HttpServlet {

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
            out.println("<title>Servlet ProductSearchByNameController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductSearchByNameController at " + request.getContextPath() + "</h1>");
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
    private ProductDAO pdao = new ProductDAO();
    private CategoryDAO cdao = new CategoryDAO();
    private DecimalFormat df = new DecimalFormat("#.000");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("s");
        List<Catalog> cateList = cdao.getAll();
        req.setAttribute("catelist", cateList);

        List<Product> productSeachByName = pdao.searchByName(name);
        req.setAttribute("productlist", productSeachByName);

        List<Product> productAllList = pdao.getAll();
        req.setAttribute("product_all", productAllList);

        //Giá giảm
        List<Product> productsList1 = new ArrayList<>();
        for (Product product : productSeachByName) {
            Product product1 = pdao.get(Integer.parseInt(product.getId()));
            product1.setPrice(String.valueOf(df.format(Double.parseDouble(product.getPrice()) * (1 - (Double.parseDouble(product.getDiscount()) / 100)))));
            productsList1.add(product1);

        }

        req.setAttribute("productlist1", productsList1);
        // Product bán chạy
        List<Product> product_banchay = pdao.getProductById(6);
        req.setAttribute("product_banchay", product_banchay);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/product-search.jsp");
        dispatcher.forward(req, resp);

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
        processRequest(request, response);
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
