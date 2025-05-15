package model;

/**
 *
 * @author LENOVO
 */
public class Member {
    private int memberId;
    private String name;
    private String birthDate;
    private String nationality;
    private String position;
    private String role;
    private String phone;
    private String email;
    private String joinDate;
    private String contractStatus;
    
    public Member() {
    }

    // Constructor có memberId (dùng khi load từ database)
    public Member(int memberId, String name, String birthDate, String nationality, String position, String role, String phone, String email, String joinDate, String contractStatus) {
        this.memberId = memberId;
        this.name = name;
        this.birthDate = birthDate;
        this.nationality = nationality;
        this.position = position;
        this.role = role;
        this.phone = phone;
        this.email = email;
        this.joinDate = joinDate;
        this.contractStatus = contractStatus;
    }

    // Constructor KHÔNG có memberId (dùng khi thêm mới)
    public Member(String name, String birthDate, String nationality, String position, String role, String phone, String email, String joinDate, String contractStatus) {
        this.name = name;
        this.birthDate = birthDate;
        this.nationality = nationality;
        this.position = position;
        this.role = role;
        this.phone = phone;
        this.email = email;
        this.joinDate = joinDate;
        this.contractStatus = contractStatus;
    }

    // Getters
    public int getMemberId() { return memberId; }
    public String getName() { return name; }
    public String getBirthDate() { return birthDate; }
    public String getNationality() { return nationality; }
    public String getPosition() { return position; }
    public String getRole() { return role; }
    public String getPhone() { return phone; }
    public String getEmail() { return email; }
    public String getJoinDate() { return joinDate; }
    public String getContractStatus() { return contractStatus; }

    // Setters
    public void setMemberId(int memberId) { this.memberId = memberId; }
    public void setName(String name) { this.name = name; }
    public void setBirthDate(String birthDate) { this.birthDate = birthDate; }
    public void setNationality(String nationality) { this.nationality = nationality; }
    public void setPosition(String position) { this.position = position; }
    public void setRole(String role) { this.role = role; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setEmail(String email) { this.email = email; }
    public void setJoinDate(String joinDate) { this.joinDate = joinDate; }
    public void setContractStatus(String contractStatus) { this.contractStatus = contractStatus; }
}
