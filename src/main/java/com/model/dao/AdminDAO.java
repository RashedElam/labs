/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.Admins;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author 236358
 */
public class AdminDAO {
    private Admins admins;
    private String fileName;

    public AdminDAO() {
    }
    
    
    public String getFileName() {
        return this.fileName;
    }
    
    public Admins getAdmins(){
        return this.admins;
    }

    public void setAdmins(Admins admins) {
        this.admins = admins;
    }
    
    public void setFileName(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream file = new FileInputStream(this.fileName);
        admins = (Admins) um.unmarshal(file);
    }

    public void save(Admins admins, String fileName) throws JAXBException, FileNotFoundException, IOException{
        this.admins = admins;
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream file = new FileOutputStream(fileName);
        m.marshal(admins, file);
        file.close();
        
    }
    
    public Admins read(String fileName) throws JAXBException, FileNotFoundException{
        this.fileName = fileName;
        JAXBContext jc = JAXBContext.newInstance(Admins.class);
        Unmarshaller um = jc.createUnmarshaller();
        FileInputStream file = new FileInputStream(fileName);
        admins = (Admins) um.unmarshal(file);
        return admins;
    }
}
