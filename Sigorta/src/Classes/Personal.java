/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author baris
 */
public class Personal extends Person implements User{
    
    private int auth;
    private int id;
    private String recordDate;
    private int departmantId;
    private int jobId;
    private int branchId;
    private double commission;

    public Personal(int id, String email, String socialId, String name, String surname, String birtday, String recordDate, String phoneNumber, int departmantId, int jobId, int branchId, double commission) {
        super(email, socialId, name, surname, birtday, phoneNumber);
        this.id = id;
        this.recordDate = recordDate;
        this.departmantId = departmantId;
        this.jobId = jobId;
        this.branchId = branchId;
        this.commission = commission;
    }

    
    @Override
    public int getAuth(){
        return this.auth;
    }
    
    @Override
    public void setAuth(int auth){
        this.auth = auth;
    }

    @Override
    public String toString() {
        return "Personal{" + "auth=" + auth + ", id=" + id;
    }
    
    @Override
    public Address getAdress() {
        return null;
    }

    @Override
    public int getId() {
        return this.id;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }

    public int getDepartmantId() {
        return departmantId;
    }

    public void setDepartmantId(int departmantId) {
        this.departmantId = departmantId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public double getCommission() {
        return commission;
    }

    public void setCommission(double commission) {
        this.commission = commission;
    }
    

    
    
}
