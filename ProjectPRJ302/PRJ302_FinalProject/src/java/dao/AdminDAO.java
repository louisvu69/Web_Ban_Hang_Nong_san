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
import model.Admin;

/**
 *
 * @author WINDOWS
 */
public class AdminDAO extends DBContext {

    public void insert(Admin admin) {
        String sql = "INSERT INTO admin(username,password,name) VALUES (?,?,?)";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setString(3, admin.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(String id) {
        String sql = "Delete from admin where id=?";

        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Admin get(int id) {
        Admin admin = new Admin();
        String sql = "SELECT * FROM admin WHERE id=?";
        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setName(rs.getString("name"));

                return admin;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void edit(Admin admin) {
        String sql = "Update admin set username =?, password =?, name =? where id=?";
        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(4, admin.getId());
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setString(3, admin.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Admin> getAll() {
        List<Admin> admins = new ArrayList<Admin>();
        String sql = "SELECT * FROM admin";
        Connection conn = DBContext.getConnect();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Admin admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setName(rs.getString("name"));
                admins.add(admin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admins;
    }

    public boolean checkAdminLogin(String username, String password) {
        boolean exist = false;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String sql = "select * from admin where username=? and password=?";
            Connection con = DBContext.getConnect();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs;
            rs = st.executeQuery();
            exist = rs.next();
            Admin admin = new Admin();
            String name = rs.getString("name");
            admin.setName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exist;
    }
}
