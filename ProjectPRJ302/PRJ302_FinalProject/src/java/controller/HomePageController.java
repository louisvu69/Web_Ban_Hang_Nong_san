/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BoardNewDAO;
import dao.ProductDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Boardnew;
import model.Product;

/**
 *
 * @author WINDOWS
 */

public class HomePageController extends HttpServlet {

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
            out.println("<title>Servlet HomePageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomePageController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param req
     * @param resp
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDAO pdao = new ProductDAO();
    private BoardNewDAO bdao = new BoardNewDAO();
    private final DecimalFormat df = new DecimalFormat("#.000");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Boardnew> boardnewList = bdao.getAll();
        req.setAttribute("boardnewlist", boardnewList);
        // Product Rau củ quả
        List<Product> product_raucu = pdao.getProductById(1);
        req.setAttribute("product_raucu", product_raucu);

        // Product hạt
        List<Product> product_hat = pdao.getProductById(2);
        req.setAttribute("product_hat", product_hat);

        // Product trái cây
        List<Product> product_traicay = pdao.getProductById(3);
        req.setAttribute("product_traicay", product_traicay);

        // Product mật ong
        List<Product> product_matong = pdao.getProductById(4);
        req.setAttribute("product_matong", product_matong);

        // Product mới
        List<Product> product_new = pdao.getProductById(5);
        req.setAttribute("product_new", product_new);

        // Product bán chạy
        List<Product> product_banchay = pdao.getProductById(6);
        req.setAttribute("product_banchay", product_banchay);

        List<Product> productList = pdao.getAll();
        req.setAttribute("productlist", productList);
        //Giá giảm
        List<Product> productsList1 = new ArrayList<Product>();
        for (Product product : productList) {
            Product product1 = pdao.get(Integer.parseInt(product.getId()));
            product1.setPrice(String.valueOf(df.format(Double.parseDouble(product.getPrice()) * (1 - (Double.parseDouble(product.getDiscount()) / 100)))));
            productsList1.add(product1);

        }

        req.setAttribute("productlist1", productsList1);

        // Product giảm giá
        List<Product> product_sale = pdao.getProductById(7);
        req.setAttribute("product_sale", product_sale);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/index.jsp");
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
