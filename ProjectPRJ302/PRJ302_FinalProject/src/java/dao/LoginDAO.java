/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jdbc.DBContext;

/**
 *
 * @author WINDOWS
 */
public class LoginDAO extends DBContext{

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User checkLogin(String username, String password) {
        try {
            String query = "select username, password from users where username = ? AND password = ?";
            
            conn = DBContext.getConnect();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1), rs.getString(2));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
