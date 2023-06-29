/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderedDAO;
import dao.TransactionDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Ordered;
import model.Transactions;

/**
 *
 * @author WINDOWS
 */
public class ClientTransactionController extends HttpServlet {

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
            out.println("<title>Servlet ClientTransactionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClientTransactionController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/checkout.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param req
     * @param resp
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private TransactionDAO transDAO = new TransactionDAO();
    private OrderedDAO orderedDAO = new OrderedDAO();

    @Override

// -------------------------------------------------------------
// Another version of code in ChatGPT
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        Transactions transaction = new Transactions();
        transaction.setUser_session(request.getParameter("transaction_usersession"));
        transaction.setUser_name(request.getParameter("transaction_name"));
        transaction.setUser_mail(request.getParameter("transaction_email"));
        transaction.setUser_phone(request.getParameter("transaction_phone"));
        transaction.setAddress(request.getParameter("transaction_address"));
        transaction.setMessage(request.getParameter("transaction_mess"));
        transaction.setAmount(request.getParameter("transaction_amount"));
        transaction.setPayment(request.getParameter("transaction_payment"));
        transaction.setCreated(request.getParameter("transaction_created"));
        transDAO.insert(transaction);

        int maxid = transDAO.getAll().stream().mapToInt(Transactions::getId).max().orElse(0);

        HttpSession session = request.getSession(true);
        Order order = (Order) session.getAttribute("order");
        order.getItems().forEach(item -> {
            Ordered ordered = new Ordered();
            ordered.setProduct_id(item.getProduct().getId());
            ordered.setQty(item.getQty());
            ordered.setTransacsion_id(String.valueOf(maxid));
            orderedDAO.insert(ordered);
        });

        session.removeAttribute("order");
        session.removeAttribute("sumprice");
        session.removeAttribute("length_order");

        response.sendRedirect(request.getContextPath() + "/view/client/checkout");
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
// old code
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("utf-8");
//        resp.setContentType("text/html;charset=UTF-8");
//        String tr_usersession = req.getParameter("transaction_usersession");
//        String tr_username = req.getParameter("transaction_name");
//        String tr_usermail = req.getParameter("transaction_email");
//        String tr_userphone = req.getParameter("transaction_phone");
//        String tr_useraddress = req.getParameter("transaction_address");
//        String tr_usermess = req.getParameter("transaction_mess");
//        String tr_amount = req.getParameter("transaction_amount");
//        String tr_payment = req.getParameter("transaction_payment");
//        String tr_created = req.getParameter("transaction_created");
//
//        Transactions transaction = new Transactions();
//        transaction.setUser_session(tr_usersession);
//        transaction.setUser_name(tr_username);
//        transaction.setUser_mail(tr_usermail);
//        transaction.setUser_phone(tr_userphone);
//        transaction.setAddress(tr_useraddress);
//        transaction.setMessage(tr_usermess);
//        transaction.setAmount(tr_amount);
//        transaction.setPayment(tr_payment);
//        transaction.setCreated(tr_created);
//
//        transDAO.insert(transaction);
//
//        int maxid = 0;
//        List<Transactions> transactions = transDAO.getAll();
//        if (transactions.size() == 0) {
//            maxid = 0;
//        } else {
//            for (Transactions transactions2 : transactions) {
//                if (transactions2.getId() >= maxid) {
//                    maxid = transactions2.getId();
//                }
//            }
//        }
//        HttpSession session = req.getSession(true);
//        Order order = (Order) session.getAttribute("order");
//        List<Item> listItems = order.getItems();
//        for (Item item : listItems) {
//            Ordered ordered = new Ordered();
//            ordered.setProduct_id(item.getProduct().getId());
//            ordered.setQty(item.getQty());
//            ordered.setTransacsion_id(String.valueOf(maxid));
//            orderedDAO.insert(ordered);
//        }
//        if (session != null) {
//            session.removeAttribute("order"); //remove session
//            session.removeAttribute("sumprice"); //remove session
//            session.removeAttribute("length_order"); //remove session
//        }
//        resp.sendRedirect(req.getContextPath() + "/view/client/checkout");
//
//    }
