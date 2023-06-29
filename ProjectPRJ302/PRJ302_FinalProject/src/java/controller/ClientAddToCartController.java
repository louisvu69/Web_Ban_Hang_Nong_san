/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Item;
import model.Order;
import model.Product;

/**
 *
 * @author WINDOWS
 */
public class ClientAddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDAO productService = new ProductDAO();
    private final DecimalFormat df = new DecimalFormat("#.000");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClientAddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClientAddToCartController at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int n = 0;
        int qty = 1;
        String id;
        if (request.getParameter("product-id") != null) {
            id = request.getParameter("product-id");
            Product product = productService.get(Integer.parseInt(id));;
            if (product != null) {
                if (request.getParameter("qty") != null) {
                    qty = Integer.parseInt(request.getParameter("qty"));
                }

                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Item> listItems = new ArrayList<>();
                    Item item = new Item();
                    item.setQty(qty);
                    item.setProduct(product);
                    item.setPrice(Double.parseDouble(product.getPrice()) - Double.parseDouble(product.getPrice()) * (Double.parseDouble(product.getDiscount()) / 100));
                    order.setSumPrice(0);
                    order.setSumPrice(order.getSumPrice() + item.getPrice());
                    listItems.add(item);
                    order.setItems(listItems);
                    n = listItems.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<Item> listItems = order.getItems();
                    boolean check = false;
                    for (Item item : listItems) {
                        if (Integer.parseInt(item.getProduct().getId()) == Integer.parseInt(product.getId())) {
                            item.setQty(item.getQty() + qty);
                            order.setSumPrice(order.getSumPrice() + Double.parseDouble(item.getProduct().getPrice()) - Double.parseDouble(item.getProduct().getPrice()) * (Double.parseDouble(item.getProduct().getDiscount()) / 100));
                            item.setPrice(item.getPrice() + (Double.parseDouble(item.getProduct().getPrice()) - Double.parseDouble(item.getProduct().getPrice()) * (Double.parseDouble(item.getProduct().getDiscount()) / 100)));
                            check = true;
                        }
                    }
                    if (check == false) {
                        Item item = new Item();
                        item.setQty(qty);
                        item.setProduct(product);
                        item.setPrice(Double.parseDouble(product.getPrice()) - Double.parseDouble(item.getProduct().getPrice()) * (Double.parseDouble(item.getProduct().getDiscount()) / 100));
                        order.setSumPrice(order.getSumPrice() + Double.parseDouble(item.getProduct().getPrice()) - Double.parseDouble(item.getProduct().getPrice()) * (Double.parseDouble(item.getProduct().getDiscount()) / 100));
                        listItems.add(item);
                    }
                    n = listItems.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                }
            }
            response.sendRedirect(request.getContextPath() + "/product/list");
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }

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
