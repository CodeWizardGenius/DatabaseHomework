/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClasses;



import Classes.Customer;
import Classes.Policy;
import Classes.User;
import Classes.Personal;
import Classes.Address;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;




public class Database {
    
    private static String userName;
    private static String password;
    private static String dbName;
    private static String address;
    private static Integer port;
    private static Connection con;
    private static Statement statement;
    private static Database instance = new Database();
    
    

    private Database(){
        this.userName = "root";
        this.password = "";
        this.dbName = "insurance_db";
        this.address = "localhost";
        this.port = 3306;
        this.con = null;
        this.statement = null;
        connectDb();
        Address.addressType = this.getAddressType();
        Policy.policies = this.getPolicies();
    }
    
    public static Database getInstance(){
        return Database.instance;
    } 
    
    private void connectDb(){
        
        String url = "jdbc:mysql://" + this.address + ":" + this.port + "/" + this.dbName + "?useUnicode=true&characterEncoding=utf8";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            System.out.println("Driver not found!!");
        }
         try {
            con = DriverManager.getConnection(url, this.userName, this.password);
            System.out.println("Connection Success!");
          
        } catch (SQLException ex) {
            System.out.println("Connection faild!!...");
            ex.printStackTrace();
        }
         
    }


    public String getPassword(String mail) {
        String query = "SELECT password FROM user WHERE email = \"" + mail + "\"";
        
        try {
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                return rs.getString("password");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        
        return "";
    }

    public User getUser(String mail) {
        int auth = this.getUserAuth(mail);
        if(auth == 0){
            Customer customer = this.getCustomer(mail);
            customer.setAuth(auth);
            return customer;
        }
        if(auth == 1 || auth == 2){
            Personal personal = this.getPersonal(mail);
            personal.setAuth(auth);
            
            return personal;
        }
        
        return null;
    }

    private int getUserAuth(String mail) {
        String query = "SELECT user_auth FROM user WHERE email = \""+ mail +"\"";
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                return Integer.parseInt(rs.getString("user_auth"));
            }
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return -1;
    }
    
    
    public Personal getPersonal(String mail){
        String query = "SELECT * FROM personal WHERE email = \"" + mail + "\""; 
       try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                return new Personal(
                        Integer.parseInt(rs.getString("id")),
                        rs.getString("email"), 
                        rs.getString("personal_social_id"),
                        rs.getString("name"), 
                        rs.getString("surname"),
                        rs.getString("birthday"), 
                        rs.getString("record_date"),
                        rs.getString("phone_number"), 
                        Integer.parseInt(rs.getString("department_id")), 
                        Integer.parseInt(rs.getString("job_id")), 
                        Integer.parseInt(rs.getString("branch_id")),
                        Double.parseDouble(rs.getString("commission"))
                );
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return null;
    }

    public Customer getCustomer(String mail) {
        String query = "SELECT * FROM customer WHERE email = \"" + mail + "\"";
        
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                int addressId = Integer.parseInt(rs.getString("customer_address_id"));
                Address customerAdress = this.getAdress(addressId);
                
                return new Customer(
                        Integer.parseInt(rs.getString("id")),
                        customerAdress,
                        rs.getString("email"),
                        rs.getString("social_number"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("birthday"),
                        rs.getString("phone_number")
                );
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return null;
    }

    private Address getAdress(int addressId) {
        String query = "SELECT * FROM address WHERE id = " + addressId;
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                int cityId = Integer.parseInt(rs.getString("city_id"));
                int townshipId = Integer.parseInt(rs.getString("township_id"));
                String fullAddress = rs.getString("full_address");
                int addressType = Integer.parseInt(rs.getString("address_type_id"));
                City city = City.cities.get(cityId - 1);
                Township township = null;
                for(Township ts: city.getTownships()){
                    if(ts.getId() == townshipId){
                        township = ts;
                        break;
                    }
                }
                
                
                return new Address(
                        Integer.parseInt(rs.getString("id")),
                        city,
                        township,
                        fullAddress,
                        Address.addressType.get(addressType - 1));
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }

    public ArrayList<City> getCities() {
        ArrayList<City> cities = new ArrayList<City>();
        String query = "SELECT * from city";
        
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                cities.add(new City(
                Integer.parseInt(rs.getString("city_id")),
                rs.getString("city_name")
                ));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cities;
    }

    ArrayList<Township> getTownships(int id) {
        ArrayList<Township> townships = new ArrayList<Township>();
        String query = "SELECT * from township WHERE city_id = " + id;
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                townships.add(new Township(
                        Integer.parseInt(rs.getString("id")), 
                        rs.getString("township_name")
                ));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return townships;
    }

    public ArrayList<String> getAddressType() {
        
        ArrayList<String> types = new ArrayList<String>();
        String query = "SELECT * FROM address_type";
         try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                types.add(rs.getString("address_type_name").toLowerCase());
            }
        }catch(Exception e){
            e.printStackTrace();
        }
         return types;
    }

    public int addAdress(int cityId, int townshipId, String fullAdress, String adressType) {
         int addressTypeId = 0;
         
         for(int i = 0; i < Address.addressType.size(); i++){
             if(adressType.toLowerCase().equals(Address.addressType.get(i))){
                 addressTypeId = i + 1;
                 break;
             }
         }

         String query = "INSERT INTO address "
                 + "(city_id, township_id, full_address, address_type_id) "
                 + "VALUES "
                 + "("+cityId+", "+townshipId+","
                 + " \""+ fullAdress+"\","+addressTypeId+")";
         
         try{
             this.statement = this.con.createStatement();
             this.statement.executeUpdate(query);
             query = "SELECT MAX(id) FROM address";
             ResultSet rs = this.statement.executeQuery(query);
             while(rs.next()){
                 return Integer.parseInt(rs.getString("MAX(id)"));
             }
         }catch(Exception e){
             e.printStackTrace();
         }
         
         return -1;
    }

    public int addUser(String email, String password, int auth) {
        String query = "INSERT INTO user(email, password, user_auth)"
                + " VALUES "
                + "(\""+email+"\", \""+password+"\","+auth+")";
        
        try{
             this.statement = this.con.createStatement();
             this.statement.executeUpdate(query);
             query = "SELECT MAX(id) FROM user";
             ResultSet rs = this.statement.executeQuery(query);
             while(rs.next()){
                 return Integer.parseInt(rs.getString("MAX(id)"));
             }
             }catch(Exception e){
             e.printStackTrace();
         }
        return -1;
    }

    public void addCustomer(String socialNumber, String phoneNumber, String birthday, String name, String surname, String email, int addressId, int userId) {
        String query = "INSERT INTO customer (social_number, name, surname,"
                + "phone_number, email, customer_address_id,"
                + "birthday, user_id) "
                + "VALUES ("
                + "\""+socialNumber+"\", \""+name+"\", \""+surname+"\","
                + "\""+phoneNumber+"\",\""+email+"\","+addressId+","
                + "\""+birthday+"\", "+userId+")";
        try{
             this.statement = this.con.createStatement();
             this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public ArrayList<Policy> getPolicies() {
        ArrayList<Policy> policies = new ArrayList<Policy>();
        String query = "SELECT * from policy";
        
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                policies.add(new Policy(
                        Integer.parseInt(rs.getString("id")),
                        rs.getString("policy_type_id").equals("1")?"individual":"enterprise",
                        rs.getString("insurance_type_id").equals("1")?"House":"Car",
                        rs.getString("start_date"), 
                        rs.getString("pay_date"), 
                        rs.getString("end_date"),
                        Integer.parseInt(rs.getString("cost")),
                        Integer.parseInt(rs.getString("employee_id")),
                        Integer.parseInt(rs.getString("customer_id"))
                ));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return policies;
        
    }


    public void updateAddress(int id, int cityId, int townshipId, String fullAddress) {
        String query = "UPDATE address SET "
                + "city_id =  "+cityId+", "
                + "township_id = "+townshipId+","
                + "full_address = \""+fullAddress+"\" "
                + "WHERE id = " + id; 
        
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updateUser(String email, String password) {
        String query = "UPDATE user SET email = \""+email+"\", password = \""+password+"\" "
                + "WHERE "
                + "email = \""+email+"\"";
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updateCustomer(String socialNumber, String phoneNumber, String birthday, String name, String surname, String email) {
        String query = "UPDATE customer SET " + "social_number = \""+socialNumber+"\", "+
        "name = \""+name+"\", "+
                "surname = \""+surname+"\", "+
                "phone_number = \""+phoneNumber+"\", "+
                "email = \""+email+"\", "+
                "birthday = \""+birthday+"\" "+
                "WHERE  email = \""+email+"\"";
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteAddress(int id) {
        String query = "DELETE FROM address WHERE id = " + id;
       try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

    public void deleteUser(String email) {
       String query = "DELETE FROM user WHERE email = \"" + email + "\"";
       try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteCustomer(String email) {
       String query = "DELETE FROM customer WHERE email = \"" + email + "\"";
       try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public ArrayList<String> getDepartments() {
        ArrayList<String> temp = new ArrayList<String>();
        String query = "SELECT department_name FROM department";
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                temp.add(rs.getString("department_name"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return temp;
    }

    public ArrayList<String> getJobs() {
        ArrayList<String> temp = new ArrayList<String>();
        String query = "SELECT job_name FROM job";
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                temp.add(rs.getString("job_name"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return temp;
    }

    public ArrayList<String> getBranchs() {
        ArrayList<String> temp = new ArrayList<String>();
        String query = "SELECT branch_name FROM branch";
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while(rs.next()){
                temp.add(rs.getString("branch_name"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return temp;
    }

    public void addPersonal(String socialNumber, String name, String surname, String birthday, String recordDate, String phoneNumber,
        String email, int departmantId, int jobId, int branchId, int commission) {
        String query = "INSERT INTO personal "
                + "(personal_social_id, name, surname, birthday, record_date,"
                + "phone_number, email, department_id, job_id, branch_id,"
                + "commission) VALUES ("
                + "\""+socialNumber+"\","
                + "\""+name+"\","
                + "\""+surname+"\","
                + "\""+birthday+"\","
                + "\""+recordDate+"\","
                + "\""+phoneNumber+"\","
                + "\""+email+"\","
                + departmantId +"," 
                + jobId +"," 
                + branchId +"," 
                + commission +")"; 
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deletePersonal(String email) {
       String query = "DELETE FROM personal WHERE email = \"" + email + "\"";
       try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updatePersonal(String socialNumber, String name, String surname,
            String birthday, String recordDate, String phoneNumber,
            String email, int departmantId, int jobId, int branchId, int commision) {
        String query = "UPDATE personal SET "
                + "personal_social_id = \""+socialNumber+"\", "
                + "name = \""+name+"\", "
                + "surname = \""+surname+"\", "
                + "birthday = \""+birthday+"\", "
                + "record_date = \""+recordDate+"\", "
                + "phone_number = \""+phoneNumber+"\", "
                + "email = \""+email+"\", "
                + "department_id = "+departmantId+", "
                + "job_id = "+jobId+", "
                + "branch_id = "+branchId+", "
                + "commission = "+commision+" "
                +"WHERE email = \""+email+"\"";
        
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public ArrayList<String> getCustomerNameSurnameEmail() {
        ArrayList<String> temp = new ArrayList<String>();
        String query = "SELECT name, surname, email FROM customer";
        try{
            this.statement = this.con.createStatement();
            ResultSet rs = this.statement.executeQuery(query);
            while(rs.next()){
                temp.add(rs.getString("name") + " " + rs.getString("surname") + " " + rs.getString("email"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return temp;
    }
    
    public void addPolicy(int policyTypeId,int insuranceTypeId,String startDate,
            String payDate,String endDate,int cost, int employeeId,int customerId){
        String query = "INSERT INTO policy (policy_type_id, insurance_type_id,"
                + " start_date, pay_date, end_date, "
                + "cost, employee_id, customer_id) "
                + "VALUES "
                + "(" + policyTypeId +", "
                + insuranceTypeId +", "
                +"\"" + startDate + "\", "
                +"\"" + payDate + "\", "
                +"\"" + endDate + "\", "
                + cost + ", "
                + employeeId +" , " 
                + customerId + ")";
        
         try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void updatePolicy(int policyId, int policyTypeId, int insuranceTypeId, String startDate, String payDate, String endDate, int cost) {
        String query = "UPDATE policy SET "
                + "policy_type_id = " + policyTypeId + ","
                + "insurance_type_id = " + insuranceTypeId + ","
                + "start_date = \"" + startDate + "\" ,"
                + "pay_date = \"" + payDate + "\" ,"
                + "end_date = \"" + endDate + "\" ,"
                + "cost = " + cost +" "
                + "WHERE "
                + "id = " + policyId;
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deletePolicy(int policyId) {
        String query = "DELETE FROM policy WHERE id = " + policyId;
        try{
            this.statement = this.con.createStatement();
            this.statement.executeUpdate(query);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
}
