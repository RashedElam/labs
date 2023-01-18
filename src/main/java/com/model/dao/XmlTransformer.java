/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.Users;
import javax.xml.bind.JAXBContext;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import javax.xml.bind.JAXBException;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;

/**
 *
 * @author 236358
 */
public class XmlTransformer {
    
    public XmlTransformer(){}
    
    public void transform(String xslPath, Users users, StreamResult result) throws JAXBException, TransformerConfigurationException, TransformerException{
        
        //step 1: Create TransformerFactory instance
        TransformerFactory tf = TransformerFactory.newInstance();
        
        //Step 2: Load the XSL source file into StreamSource
        StreamSource xslSource = new StreamSource(xslPath);
        
        //Step 3: Load the XML data source (1 - using JAXB, 2- from file)
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        JAXBSource xmlSource = new JAXBSource(jc, users);
        
        //Step 4: Create a transformer instance using xsl document
        Transformer transformer = tf.newTransformer(xslSource);
        
        //Step 5: transform
        transformer.transform(xmlSource, result);
        //StreamResult systemOutResult = new StreamResult(System.out);
        //transformer.transform(xmlSource, systemOutResult);        
    }
    
    public void transform(String xslPath, String xmlPath, StreamResult result) throws JAXBException, TransformerConfigurationException, TransformerException{
        TransformerFactory tf = TransformerFactory.newInstance();
        StreamSource xslSource = new StreamSource(xslPath);
//        JAXBContext jc = JAXBContext.newInstance(Users.class);
//        JAXBSource xmlSource = new JAXBSource(jc, users);
        StreamSource xmlSource = new StreamSource(xmlPath);
        Transformer transformer = tf.newTransformer(xslSource);
        transformer.transform(xmlSource, result);
        StreamResult systemOutResult = new StreamResult(System.out);
        transformer.transform(xmlSource, systemOutResult);
        
        
    }
    
}
