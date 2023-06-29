/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.DBContext;
import model.Product;

/**
 *
 * @author WINDOWS
 */
public class ProductDAO extends DBContext {

    public void insert(Product product) {
        String sql = "INSERT INTO product"
                + "(catalog_id, "
                + "name, "
                + "price, "
                + "status, "
                + "description, "
                + "content, "
                + "discount, "
                + "image_link, "
                + "created)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, product.getCatalog_id());
            ps.setString(2, product.getName());
            ps.setString(3, product.getPrice());
            ps.setString(4, product.getStatus());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getContent());
            ps.setString(7, product.getDiscount());
            ps.setString(8, product.getImage_link());
            ps.setString(9, product.getCreated());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void edit(Product product) {
        String sql = "UPDATE product SET name = ?, catalog_id = ?, price = ?, status = ?, description = ?, content = ?, discount = ?, image_link = ?, created = ? WHERE id = ?";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getCatalog_id());
            ps.setString(3, product.getPrice());
            ps.setString(4, product.getStatus());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getContent());
            ps.setString(7, product.getDiscount());
            ps.setString(8, product.getImage_link());
            ps.setString(9, product.getCreated());
            ps.setString(10, product.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void delete(String id) {
        String sql = "DELETE FROM product WHERE id = ?";
        Connection conn = DBContext.getConnect();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public Product get(int id) {
        String sql = "SELECT * FROM product WHERE id = ? ";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("id"));
                product.setCatalog_id(rs.getString("catalog_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setDescription(rs.getString("description"));
                product.setContent(rs.getString("content"));
                product.setDiscount(rs.getString("discount"));
                product.setImage_link(rs.getString("image_link"));
                product.setCreated(rs.getString("created"));
                return product;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        Connection conn = DBContext.getConnect();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getString("id"));
                product.setCatalog_id(rs.getString("catalog_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setDescription(rs.getString("description"));
                product.setContent(rs.getString("content"));
                product.setDiscount(rs.getString("discount"));
                product.setImage_link(rs.getString("image_link"));
                product.setCreated(rs.getString("created"));
                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<Product> getProductById(int id) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE catalog_id=?";
        Connection conn = DBContext.getConnect();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getString("id"));
                product.setCatalog_id(rs.getString("catalog_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setDescription(rs.getString("description"));
                product.setContent(rs.getString("content"));
                product.setDiscount(rs.getString("discount"));
                product.setImage_link(rs.getString("image_link"));
                product.setCreated(rs.getString("created"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> searchByName(String keyword) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE name LIKE ? ";
        Connection conn = DBContext.getConnect();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("id"));
                product.setCatalog_id(rs.getString("catalog_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setStatus(rs.getString("status"));
                product.setDescription(rs.getString("description"));
                product.setContent(rs.getString("content"));
                product.setDiscount(rs.getString("discount"));
                product.setImage_link(rs.getString("image_link"));
                product.setCreated(rs.getString("created"));
                productList.add(product);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return productList;
    }

}
