package dao;

import database.DBConnect;
import model.Member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

    public List<Member> getAllMembers() {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM members";

        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Member m = new Member();
                m.setMemberId(rs.getInt("member_id"));
                m.setName(rs.getString("name"));
                m.setBirthDate(rs.getString("birth_date"));
                m.setNationality(rs.getString("nationality"));
                m.setPosition(rs.getString("position"));
                m.setRole(rs.getString("role"));
                m.setPhone(rs.getString("phone"));
                m.setEmail(rs.getString("email"));
                m.setContractStatus(rs.getString("contract_status"));
                m.setJerseyNumber(rs.getInt("jersey_number"));
                m.setSalary(rs.getDouble("salary"));
                m.setUserId(rs.getInt("user_id"));
                list.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addMember(Member m) {
        String sql = "INSERT INTO members (name, birth_date, nationality, position, role, phone, email, contract_status, jersey_number, salary, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, m.getName());
            ps.setString(2, m.getBirthDate());
            ps.setString(3, m.getNationality());
            ps.setString(4, m.getPosition());
            ps.setString(5, m.getRole());
            ps.setString(6, m.getPhone());
            ps.setString(7, m.getEmail());
            ps.setString(8, m.getContractStatus());
            ps.setInt(9, m.getJerseyNumber());
            ps.setDouble(10, m.getSalary());
            ps.setInt(11, m.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateMember(Member m) {
        String sql = "UPDATE members SET name=?, birth_date=?, nationality=?, position=?, role=?, phone=?, email=?, contract_status=?, jersey_number=?, salary=?, user_id=? WHERE member_id=?";
        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, m.getName());
            ps.setString(2, m.getBirthDate());
            ps.setString(3, m.getNationality());
            ps.setString(4, m.getPosition());
            ps.setString(5, m.getRole());
            ps.setString(6, m.getPhone());
            ps.setString(7, m.getEmail());
            ps.setString(8, m.getContractStatus());
            ps.setInt(9, m.getJerseyNumber());
            ps.setDouble(10, m.getSalary());
            ps.setInt(11, m.getUserId());
            ps.setInt(12, m.getMemberId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteMember(int id) {
        String sql = "DELETE FROM members WHERE member_id=?";
        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Member> searchMembers(String keyword) {
        List<Member> list = new ArrayList<>();
        String sql = "SELECT * FROM members WHERE name LIKE ? OR position LIKE ? OR nationality LIKE ?";
        try (Connection conn = DBConnect.connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String pattern = "%" + keyword + "%";
            ps.setString(1, pattern);
            ps.setString(2, pattern);
            ps.setString(3, pattern);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Member m = new Member();
                m.setMemberId(rs.getInt("member_id"));
                m.setName(rs.getString("name"));
                m.setBirthDate(rs.getString("birth_date"));
                m.setNationality(rs.getString("nationality"));
                m.setPosition(rs.getString("position"));
                m.setRole(rs.getString("role"));
                m.setPhone(rs.getString("phone"));
                m.setEmail(rs.getString("email"));
                m.setContractStatus(rs.getString("contract_status"));
                m.setJerseyNumber(rs.getInt("jersey_number"));
                m.setSalary(rs.getDouble("salary"));
                m.setUserId(rs.getInt("user_id"));
                list.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
