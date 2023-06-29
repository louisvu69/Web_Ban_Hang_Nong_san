package dao;

import jdbc.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jdbc.DBContext;
import model.Ordered;

/**
 *
 * @author WINDOWS
 */
public class OrderedDAO extends DBContext {

    public void insert(Ordered ord) {
        String sql = "INSERT INTO ordered(product_id, transaction_id,qty) VALUES (?, ?, ?)";
        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(ord.getProduct_id()));
            ps.setInt(2, Integer.parseInt(ord.getTransaction_id()));
            ps.setInt(3, ord.getQty());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Ordered> getAll() {
        List<Ordered> ordereds = new ArrayList<>();
        String sql = "SELECT * FROM ordered";
        Connection con = DBContext.getConnect();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ordered ordered = new Ordered();
                ordered.setId(rs.getString("id"));
                ordered.setProduct_id(rs.getString("product_id"));
                ordered.setTransacsion_id(rs.getString("transaction_id"));
                ordered.setQty(Integer.parseInt(rs.getString("qty")));
                ordereds.add(ordered);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ordereds;

    }
}
