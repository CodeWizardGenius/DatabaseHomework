/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;


public class Customer extends Person implements User{
    private int auth;
    private int id;
    private Address address;

    public Customer(int id, Address address, String email, String socialId, String name, String surname, String birtday, String phoneNumber) {
        super(email, socialId, name, surname, birtday, phoneNumber);
        this.id = id;
        this.address = address;
    }
    
    


    @Override
    public int getAuth() {
        return this.auth;
    }

    @Override
    public void setAuth(int auth) {
        this.auth = auth;
    }

    @Override
    public String toString() {
        return "Customer{" + "auth=" + auth + ", id=" + id;
    }

    @Override
    public Address getAdress() {
        return this.address;
    }

    @Override
    public int getId() {
        return this.id;
    }
    
    
    
    
    
}
