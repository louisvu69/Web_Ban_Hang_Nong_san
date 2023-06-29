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
import model.Boardnew;

/**
 *
 * @author WINDOWS
 */
public class BoardNewDAO extends DBContext{

    public void insert(Boardnew boardnew) {
        String sql = "INSERT INTO boardnew(title, content,image_link, author, created) VALUES (?, ?, ?, ?, ?)";
        
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, boardnew.getTitle());
            ps.setString(2, boardnew.getContent());
            ps.setString(3, boardnew.getImage_link());
            ps.setString(4, boardnew.getAuthor());
            ps.setString(5, boardnew.getCreated());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM boardnew WHERE id=?";
        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void edit(Boardnew boardnew) {
        String sql = "UPDATE boardnew SET title=?,content=?,image_link=?,author=?,created=? WHERE id=?";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, boardnew.getTitle());
            ps.setString(2, boardnew.getContent());
            ps.setString(3, boardnew.getImage_link());
            ps.setString(4, boardnew.getAuthor());
            ps.setString(5, boardnew.getCreated());
            ps.setString(6, boardnew.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Boardnew get(int id) {

        String sql = "SELECT * FROM boardnew WHERE id = ? ";
        Connection con = DBContext.getConnect();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Boardnew boardnew = new Boardnew();

                boardnew.setId(rs.getString("id"));
                boardnew.setTitle(rs.getString("title"));
                boardnew.setContent(rs.getString("content"));
                boardnew.setImage_link(rs.getString("image_link"));
                boardnew.setAuthor(rs.getString("author"));
                boardnew.setCreated(rs.getString("created"));
                //System.out.println("cc"+rs.getString("title"));
                return boardnew;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }



    public List<Boardnew> getAll() {
        List<Boardnew> boardnews = new ArrayList<Boardnew>();
        String sql = "SELECT * FROM boardnew";
        Connection conn = DBContext.getConnect();

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Boardnew boardnew = new Boardnew();

                boardnew.setId(rs.getString("id"));
                boardnew.setTitle(rs.getString("title"));
                boardnew.setContent(rs.getString("content"));
                boardnew.setImage_link(rs.getString("image_link"));
                boardnew.setAuthor(rs.getString("author"));
                boardnew.setCreated(rs.getString("created"));
                boardnews.add(boardnew);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return boardnews;
    }
}
