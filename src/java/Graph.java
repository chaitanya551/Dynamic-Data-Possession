/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author JP9
 */
import com.multi.database.DbConnection;
import java.sql.*; 
import java.io.*;
import org.jfree.data.category.DefaultCategoryDataset; 
import org.jfree.chart.ChartFactory; 
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.JFreeChart; 
import org.jfree.chart.ChartUtilities; 
public class Graph {  
        
        public static void main(String[] args) throws Exception{
                
                Connection conn = DbConnection.getConnection();
                DefaultCategoryDataset my_bar_chart_dataset = new DefaultCategoryDataset();
                Statement stmt = conn.createStatement();
                try {
                        ResultSet query_set = stmt.executeQuery("select count(*) from loc1");
                        while (query_set.next()) {
                                String[] category1 = {"India","USA","UK","CHINA"};
                                int marks = query_set.getInt(1);
                                for(String category :category1)
                                {
                                    my_bar_chart_dataset.addValue(marks,"Files",category);
                                }
                                }
                JFreeChart BarChartObject=ChartFactory.createBarChart("Server Vs Files - Bar Chart","Server","No.of Files",my_bar_chart_dataset,PlotOrientation.VERTICAL,true,true,false);                  
                query_set.close();
                stmt.close(); 
                conn.close();
                int width=640; /* Width of the image */
                int height=480; /* Height of the image */                
                File BarChart=new File("output_chart.png");              
                ChartUtilities.saveChartAsPNG(BarChart,BarChartObject,width,height); 
                }
                 catch (Exception i)
                 {
            System.out.println(i);
                 }
   
        }
} 
