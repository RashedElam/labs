/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rest.client;

import com.model.User;
import com.rest.UserService;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.bind.JAXBException;

/**
 *
 * @author 236358
 */
public class UserServiceClient {
    public static String xmlPath() throws MalformedURLException, IOException{
        URL uri = new URL("http://localhost:8080/labs/rest/userapi/users");
        HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/xml");
        
        if(connection.getResponseCode() != 200){
            throw new RuntimeException("Failed: HTTP error code: "+connection.getInputStream());
        }
        
        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        
        File file = new File("C:\\Users\\236358\\Documents\\NetBeansProjects\\labs\\src\\main\\webapp\\WEB-INF\\usergen.xml");        
        if(!file.exists())
            file.createNewFile();
        
        FileWriter writer = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(writer);
        
        String output ="";
        
        while((output = br.readLine()) != null)
            bw.write(output);
       
        bw.close();
        connection.disconnect();
        return file.getAbsolutePath();
    }
    
    public static String fetchUser(int ID) throws JAXBException, FileNotFoundException, MalformedURLException, IOException{
        URL uri = new URL("http://localhost:8080/labs/rest/userapi/user/ID/"+ID);
        HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Accept", "application/xml");
        
        if(connection.getResponseCode() != 200){
            throw new RuntimeException("Failed: HTTP error code: "+connection.getInputStream());
        }
        
        BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        
        File file = new File("C:\\Users\\236358\\Documents\\NetBeansProjects\\labs\\src\\main\\webapp\\WEB-INF\\userId.xml");        
        if(!file.exists())
            file.createNewFile();
        
        FileWriter writer = new FileWriter(file);
        BufferedWriter bw = new BufferedWriter(writer);
        
        String output ="";
        
        while((output = br.readLine()) != null)
            bw.write(output);
       
        bw.close();
        connection.disconnect();
        return file.getAbsolutePath();
    }
    
}
