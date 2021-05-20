package it.unisa.model;

import java.text.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;

public class UserDAO 	
{
   static Connection currentCon = null;
   static ResultSet rs = null;  
   private static DataSource ds;
   public static UserBean doRetrieve(UserBean bean) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
      PreparedStatement preparedStatement = null;
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery =
            "select * from cliente where username='"
                     + username
                     + "' AND password='"
                     + password
                     + "'";
	    
   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("Your user name is " + username);          
   System.out.println("Your password is " + password);
   System.out.println("Query: "+searchQuery);
   
 
	    
   try 
   {
      //connect to DB 
	   Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		ds = (DataSource) envCtx.lookup("jdbc/mydb");
		currentCon = ds.getConnection();
      preparedStatement=currentCon.prepareStatement(searchQuery);
      rs = preparedStatement.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String firstName = rs.getString("nome");
         String lastName = rs.getString("cognome");
	     String admin=rs.getString("ruolo");
         System.out.println("Welcome " + firstName);
         bean.setFirstName(firstName);
         bean.setLastName(lastName);
         bean.setValid(true);
         if(admin.equalsIgnoreCase("admin")) {
        	 bean.setAdmin(true);
         }
         else
        bean.setAdmin(false);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }
   
   public static void doUpdate(UserBean user1) throws SQLException, NamingException {

	   Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		ds = (DataSource) envCtx.lookup("jdbc/mydb");
		currentCon = ds.getConnection();
		 PreparedStatement preparedStatement = null;



        String insertSQL = "INSERT INTO " + "cliente"
                + " (username, nome, cognome, indirizzo, password, cvv, numcarta, intestatario) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
        	
            preparedStatement = currentCon.prepareStatement(insertSQL);
            preparedStatement.setString(1, user1.getUsername());
            preparedStatement.setString(2, user1.getFirstName());
            preparedStatement.setString(3, user1.getLastName());
            preparedStatement.setString(4, user1.getIndirizzo());
            preparedStatement.setString(5, user1.getPassword());
            preparedStatement.setInt(6, user1.getCvv());
            preparedStatement.setInt(7, user1.getNumerocarta());
            preparedStatement.setString(8, user1.getIntestatario());

            preparedStatement.executeUpdate();
            
           
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (currentCon != null)
                	currentCon.close();
            }
        }
    
    }   
  
}