/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jdbc.DBContext;
import model.User;

/**
 *
 * @author WINDOWS
 */
public class RegisterDAO extends DBContext{

    private Connection con;

    public RegisterDAO(Connection con) {
        this.con = con;
    }

    public boolean RegisterUser(User user) {
        boolean set = false;
        Connection con = DBContext.getConnect();
        try {
            String sql = "INSERT INTO users (username,password,email,phone,name,created) values (?,?,?,?,?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getName());
            preparedStatement.setString(6, user.getCreated());
            preparedStatement.executeUpdate();

            set = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;  // On failure, send a message from here.
    }
}
