package dao;

import database.DBConnect;
import java.sql.*;
import java.util.*;
import model.Member;

public class MemberDAO {

   public List<Member> getAllMembers() {
        List<Member> list = new ArrayList<>();
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT member_id, name, birth_date, nationality, position, role, phone, email, join_date, contract_status FROM members";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Member member = new Member(
                    rs.getInt("member_id"),  // <-- Lấy ID từ SQL
                    rs.getString("name"),
                    rs.getString("birth_date"),
                    rs.getString("nationality"),
                    rs.getString("position"),
                    rs.getString("role"),
                    rs.getString("phone"),
                    rs.getString("email"),
                    rs.getString("join_date"),                    
                    rs.getString("contract_status")
                    
                );
                list.add(member);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
         public boolean addMember(Member member) throws SQLException {
    Connection conn = null;
    PreparedStatement stmt = null;
    boolean success = false;

    try {
        conn = DBConnect.getConnection();
        String sql = "INSERT INTO footballclubmanagement.members (name, birth_date, nationality, " +
                "position, role, phone, email, join_date, contract_status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        stmt = conn.prepareStatement(sql);
        stmt.setString(1, member.getName());
        stmt.setString(2, member.getBirthDate());
        stmt.setString(3, member.getNationality());
        stmt.setString(4, member.getPosition());
        stmt.setString(5, member.getRole());
        stmt.setString(6, member.getPhone());
        stmt.setString(7, member.getEmail());
        stmt.setString(8, member.getJoinDate());
        stmt.setString(9, member.getContractStatus());  // contract_status là tham số thứ 9
        


        int rowsAffected = stmt.executeUpdate();
        success = (rowsAffected > 0);
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }

    return success;
}
      public boolean deleteMember(int memberId) {
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        conn = DBConnect.getConnection();
        // Thay 'id' bằng 'member_id' trong câu lệnh SQL
        String sql = "DELETE FROM members WHERE member_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, memberId);
        int rowsAffected = stmt.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
     public boolean updateMember(Member members) {
    String sql = "UPDATE members SET name = ?, birth_date = ?, nationality = ?, position = ?, role = ?, phone = ?, email = ?, join_date = ?, contract_status = ? WHERE member_id = ?";
    
    try (Connection conn = DBConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, members.getName());
        stmt.setString(2, members.getBirthDate());
        stmt.setString(3, members.getNationality());
        stmt.setString(4, members.getPosition());
        stmt.setString(5, members.getRole());
        stmt.setString(6, members.getPhone());
        stmt.setString(7, members.getEmail());
        stmt.setString(8, members.getJoinDate());
        stmt.setString(9, members.getContractStatus());
        stmt.setInt(10, members.getMemberId());
        
        return stmt.executeUpdate() > 0;
        
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}



}
