/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClasses;

import java.util.ArrayList;


public class City {
    
    public static ArrayList<City> cities = Database.getInstance().getCities();
    private int id;
    private String name;
    private ArrayList<Township> townships;

    public City(int id, String name) {
        this.id = id;
        this.name = name;
        this.townships = Database.getInstance().getTownships(id);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Township> getTownships() {
        return townships;
    }

    public void setTownships(ArrayList<Township> townships) {
        this.townships = townships;
    }
    
    
    
    
    
    
}
