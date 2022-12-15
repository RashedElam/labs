/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.User;
import com.model.Users;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author 236358
 */
public class UserDAO implements Serializable{
    private Users users;
    private String filePath;

    public UserDAO() {
    }
    
    
    public String getFilePath() {
        return this.filePath;
    }
    
    public Users getUsers(){
        return this.users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    
    public void setFilePath(String fileName) throws JAXBException, FileNotFoundException{
        this.filePath = fileName;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream file = new FileInputStream(this.filePath);
        users = (Users) um.unmarshal(file);
    }

    public void save(Users users, String fileName) throws JAXBException, FileNotFoundException, IOException{
        this.users = users;
        this.filePath = fileName;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream file = new FileOutputStream(fileName);
        m.marshal(users, file);
        file.close();
        
    }
    
    public Users read(String fileName) throws JAXBException, FileNotFoundException{
        this.filePath = fileName;
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream file = new FileInputStream(fileName);
        users = (Users) um.unmarshal(file);
        return users;
    }
    
    public void update(Users users, User other) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(other);
        save(this.users, filePath);
        this.users.add(other);
        save(this.users, filePath);
    }
    
    public void delete(Users users,User user) throws JAXBException, IOException{
        this.users = users;
        this.users.remove(user);
        save(this.users, filePath);
    }
}
