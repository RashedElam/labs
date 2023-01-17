/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app;

import com.model.User;
import com.model.dao.SqlDBConnector;
import com.model.dao.UserSqlDAO;
import com.utils.In;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author 236358
 */
public class UserSqlApp {
    private SqlDBConnector connector;
    private Connection connection;
    private UserSqlDAO userSqlDAO;
    
    public UserSqlApp() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, IOException{
        connector = new SqlDBConnector();
        connection = connector.connection();
        userSqlDAO = new UserSqlDAO(connection);
    }
    
    private String read(String prompt){
        System.out.print(prompt);
        return In.nextLine();
    }
    
    //Testing the SQL Create Query
    private void testCreate() throws SQLException{
        System.out.println("Creating a new user: ");
        userSqlDAO.create(read("Name: "), read("Email: "), read("Password: "), read("Date of Birth: "));
        System.out.println("User has been added to the database");
    }
    
    //Testing the SQL Read Query - Read by ID
    private void testRead() throws SQLException{
        String email = read("Email: ");
        String password = read("Password: ");
        User user = userSqlDAO.login(email, password);        
        String exists = (user!= null) ? "User "+user.getName()+" exists in the database": "User does not exist";
        System.out.println(exists);
    }
    
     //Testing the SQL Read - Many Query
    private void testGetAll() throws SQLException{
        List<User> users = userSqlDAO.getUsers();
        users.forEach(u -> System.out.println(u));
    }
    
     //Testing the SQL Update Query - Update (name, password) by ID
    private void testUpdate() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID); 
        if(user != null){
            System.out.println("Update user record: ");
            String name = read("Name: ");
            String password = read("Password: ");
            String dob = read("Date of Birth: ");
            userSqlDAO.update(name, password, dob, ID);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    //Testing the SQL Delete Query - by ID
    private void testDelete() throws SQLException{
        int ID = Integer.parseInt(read("ID: "));
        User user = userSqlDAO.getUser(ID); 
        if(user != null){
            System.out.println("Deleting user record: ");
            userSqlDAO.delete(ID);
        }else{
            System.out.println("User does not exist");
        }
    }
    
    private void menu() throws SQLException{
        char c;
        help();
        while((c=read("Command [c/r/u/d/v/x]: ").charAt(0)) != 'x'){
            switch(c){
                case 'c': testCreate();break;
                case 'r': testRead(); break;
                case 'u': testUpdate(); break;
                case 'd': testDelete();break;
                case 'v': testGetAll();break;
                
            }
        }
    }
    
    private void help(){
        System.out.println("Database Operations: \n"
                + "c = Create User \n"
                + "r = Read User by ID-Password \n"
                + "u = Update User by ID \n"
                + "d = Delete User by ID\n"
                + "v = Fetch all Users\n"
                );
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, IOException {
        UserSqlApp app = new UserSqlApp();
        app.menu();
    }
}
