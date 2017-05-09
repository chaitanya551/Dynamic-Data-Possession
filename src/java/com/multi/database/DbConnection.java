/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.multi.database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author JP9
 */
public class DbConnection {
    public static Connection getConnection()
    {
        Connection con = null;
        try{
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/multicopy", "root", "root");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
