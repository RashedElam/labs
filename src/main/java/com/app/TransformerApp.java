/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app;

import com.model.dao.UserDAO;
import com.model.dao.XmlTransformer;
import java.io.FileNotFoundException;
import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamResult;

/**
 *
 * @author 236358
 */
public class TransformerApp {
    
    public static void main(String[] args) throws JAXBException, FileNotFoundException, TransformerException {
        XmlTransformer transformer = new XmlTransformer();
        String xslPath = "C:\\Users\\236358\\Documents\\labs\\src\\main\\webapp\\xsl\\users.xsl";
        UserDAO userDAO = new UserDAO();
        String xmlPath = "C:\\Users\\236358\\Documents\\labs\\src\\main\\webapp\\WEB-INF\\users.xml";
        userDAO.setFilePath(xmlPath);
        String output = "C:\\Users\\236358\\Documents\\labs\\src\\main\\webapp\\output.html";
        transformer.transform(xslPath, xmlPath, new StreamResult(output));
    }
    
}
