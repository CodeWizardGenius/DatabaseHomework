/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.util.ArrayList;

/**
 *
 * @author baris
 */
public class Policy {
    public static ArrayList<Policy> policies;
    private int id;
    private String policyType;
    private String insuranceType;
    private String recordDate;
    private String payDate;
    private String endDate;
    private int cost;
    private int personId;
    private int customerId;

    public Policy(int id, String policyType, String insuranceType, String recordDate, String payDate, String endDate, int cost, int personId, int customerId) {
        this.id = id;
        this.policyType = policyType;
        this.insuranceType = insuranceType;
        this.recordDate = recordDate;
        this.payDate = payDate;
        this.endDate = endDate;
        this.cost = cost;
        this.personId = personId;
        this.customerId = customerId;
    }

    public static ArrayList<Policy> getPolicies() {
        return policies;
    }

    public static void setPolicies(ArrayList<Policy> policies) {
        Policy.policies = policies;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPolicyType() {
        return policyType;
    }

    public void setPolicyType(String policyType) {
        this.policyType = policyType;
    }

    public String getInsuranceType() {
        return insuranceType;
    }

    public void setInsuranceType(String insuranceType) {
        this.insuranceType = insuranceType;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    
    
    
    
    
    
}
