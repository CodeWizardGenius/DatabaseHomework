package Classes;

import SupportClasses.City;
import SupportClasses.Database;
import SupportClasses.Township;
import java.util.ArrayList;

/**
 *
 * @author baris
 */
public class Address {
    public static ArrayList<String> addressType;
    private int id;
    private City city;
    private Township township;
    private String fullAddress;
    private String type;

    public Address(int id, City city, Township township, String fullAddress, String type) {
        this.id = id;
        this.city = city;
        this.township = township;
        this.fullAddress = fullAddress;
        this.type = type;
    }

    @Override
    public String toString() {
        return this.city.getName() + "-" + this.township.getName() + "-" + this.fullAddress + "[" + this.id + "," + this.type + "]";
    }

    public static ArrayList<String> getAddressType() {
        return addressType;
    }

    public static void setAddressType(ArrayList<String> addressType) {
        Address.addressType = addressType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Township getTownship() {
        return township;
    }

    public void setTownship(Township township) {
        this.township = township;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
    
    
    
    
}
