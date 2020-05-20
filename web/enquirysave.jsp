<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
 <%-- 
    Document   : usersave
    Created on : 15 Jun, 2019, 2:28:22 PM
    Author     : Animesh Chourasia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%!
            public void jspInit(){
try{
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Driver successfully loaded");
}
catch(ClassNotFoundException ex){
System.out.println( "Problem loading driver: " +ex);
}
} 

        %>
        <%
          
            String nam = request.getParameter("name");
             String crs = request.getParameter("courses") ;
              String cnt = request.getParameter("contact") ;
             
                String cmt = request.getParameter("comment");
                 String email = request.getParameter("email") ;
                        
                          boolean state = true ;
                      String msg ="";
                    
                      if(state==true){
                          try{
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
                              
                         
                          if(state==true){
                        String sql = "insert into enquiry(stdname,courses,contactno,comment,email) values(?,?,?,?,?)";
                               PreparedStatement ps = con.prepareStatement(sql);
                              
                              ps.setString(1, nam);
                              ps.setString(2, crs);
                              ps.setString(3, cnt);
                              ps.setString(4, cmt);
                              ps.setString(5, email);
                            
                              
                              ps.executeUpdate();
                              
                              msg=msg+" enquiry submitted successfully ,you will be contacted via email";
                          }
                          con.close();
                          
                      }catch(SQLException ex){
                          out.println("Error in database operation: " +ex);
                          
                      }
                      }
                      out.println(msg);
                      %>
    </body>
</html>
