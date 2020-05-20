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
public boolean isAlpha(String text){
return text.matches("[a-zA-Z]+ ");
}
public boolean isDigit(String text){
return text.matches("[0-9]+ ");
}
public boolean isEmail(String text){
return text.matches("[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}") ;
}
        %>
        <%
            String nam = request.getParameter("name");
             String gen = request.getParameter("gender") ;
              String add1 = request.getParameter("address1") ;
               String city = request.getParameter("city") ; 
                String contact = request.getParameter("contact");
                 String email = request.getParameter("email") ;
                          String passwd = request.getParameter("passwd");
                          boolean state = true ;
                      String msg ="";
                    
                      if(state==true){
                          try{
                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost/studentdb?useTimezone=true&serverTimezone=UTC" , "root" , "admin");
                              String sql = "select * from students where contactno=?";
                              PreparedStatement ps = con.prepareStatement(sql);
                              ps.setString(1,contact);
                              ResultSet rs = ps.executeQuery();
                              if(rs.next()){
                                  msg = msg + "Given contact number already exist";
                                  state=false;
                                  
                              }
                          
                          rs.close();
                         sql = "select * from students where email=?";
                          ps=con.prepareStatement(sql);
                          ps.setString(1,email);
                          rs=ps.executeQuery();
                          if(rs.next()){
                              msg = msg + "Given email address already exist";
                              state=false;
                              
                          }
                          rs.close();
                          if(state==true){
                         sql = "insert into students(stdname,gender,address1,city,contactno,email,passwd) values(?,?,?,?,?,?,?)";
                              ps=con.prepareStatement(sql);
                              
                              ps.setString(1, nam);
                              ps.setString(2, gen);
                              ps.setString(3, add1);
                              ps.setString(4, city);
                              ps.setString(5, contact);
                              ps.setString(6, email);
                              ps.setString(7, passwd);
                              
                              ps.executeUpdate();
                              msg=msg+" registered successfully";
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
