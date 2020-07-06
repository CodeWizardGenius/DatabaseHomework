/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClasses;

import java.awt.Color;
import java.awt.Rectangle;


public class AppInfo {
    //Info of icon
    public static final String APP_NAME = "Karapelit Insurance";
    public static final String VERSION = "1.37";
    public static final String APP_ICON = "../Icons/app-icon.png";
    public static final String ADD_ICON = "../Icons/plus.png";
    public static final String DELETE_ICON = "../Icons/delete.png";
    public static final String SEARCH_ICON = "../Icons/search.png";
    public static final String UPDATE_ICON = "../Icons/update.png";
    
    //App Color
    public static final Color APP_COLOR = new java.awt.Color(255, 184, 96); 
    
    //App coordinate
    public static final Rectangle APP_COORDINATE = new java.awt.Rectangle(300, 100, 0, 0);
    
    //Page name
    public static final String LOGIN_PAGE_NAME = "Login Page";
    public static final String CUSTOMER_SING_IN_PAGE_NAME = "Customer Sign In";
    public static final String HOME_PAGE = "Home Page";
    public static final String ADD_PERSONAL_PAGE = "Add Personal"; 
    public static final String ADD_POLICY_PAGE = "Add Policy";
    public static final String UPDATE_PERSONAL_PAGE = "Update Personal";
    public static final String UPDATE_CUSTOMER_PAGE = "Update Customer";
    public static final String UPDATE_POLICY_PAGE = "Update Policy";
    public static final String DELETE_CUSTOMER_PAGE = "Delete Customer";
    public static final String DELETE_PERSONAL_PAGE = "Delete Personal";
    public static final String DELETE_POLICY_PAGE = "Delete Policy";
    
    
    // Success Feedback
    public static final String SUCCESS_LOGIN = "Login Successful";
    public static final String SUCCESS_NEW_CUSTOMER = "Customer Created successfull";
    public static final String SUCCESS_UPDATE_CUSTOMER = "Customer update successfull";
    public static final String SUCCESS_DELETE_CUSTOMER = "Customer delete successfull";
    public static final String SUCCESS_NEW_PERSONAL = "New personal adding successfull";
    public static final String SUCCESS_DELETE = "Personal delete successfull";
    public static final String SUCCESS_UPDATE_PERSONAL = "Personal update successfull";
    public static final String SUCCESS_NEW_POLICY = "New Policy adding successfull";
    public static final String SUCCESS_UPDATE_POLICY = "Policy update successfull";
    public static final String SUCCESS_DELETE_POLICY = "Policy delete successfull";
    public static final String SUCCESS_SEND_MAIL = "Mail was successfully sent";
    
    // Fail Feedback
    public static final String WRONG_INPUT = "Wrong input entered. Please check in again";
    public static final String WRONG_EMAIL_OR_PASSWORD = "Wrong email or password. Please check in again";
    public static final String EMAIL_NOT_FOUND = "E-Mail not found. Please check in againg";
    public static final String PROCCESS_CANCEL_MESSAGE = "Proccess Canceled";

    //Feedback
    public static final String DOUBLE_CHECK_MESSAGE = "Are you sure? Does proccess want writing 'Yes'";
    public static final String CUSTOMER_HAS_NO_POLICY = "The customer has no policy";
}
